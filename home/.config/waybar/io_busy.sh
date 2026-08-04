#!/bin/bash

# 루트(/)가 위치한 물리 디스크 자동 감지 (disk_speed.sh와 동일)
ROOT_SRC=$(findmnt -n -o SOURCE / 2>/dev/null | sed 's/\[.*\]//')
PART=${ROOT_SRC#/dev/}
DISK=$(lsblk -no PKNAME "/dev/$PART" 2>/dev/null | head -n1)
[ -z "$DISK" ] && DISK="$PART"
if [ ! -r "/sys/block/$DISK/stat" ]; then
  for d in /sys/block/*; do
    name=$(basename "$d")
    case "$name" in
    loop* | ram* | zram* | dm-* | sr*) continue ;;
    esac
    if [ -r "$d/stat" ]; then
      DISK="$name"
      break
    fi
  done
fi
STAT="/sys/block/$DISK/stat"

# 이전 io_ticks와 시각 저장 (디스크별로 분리)
TICK_FILE="/tmp/waybar_disk_ioticks_$DISK"
TIME_FILE="/tmp/waybar_disk_iotime_$DISK"

# 필드10 = io_ticks (디바이스가 I/O 처리 중이던 누적 시간, ms)
read -r _ _ _ _ _ _ _ _ _ io_ticks _ <"$STAT"
NOW_NS=$(date +%s%N)

TICK_OLD=$(cat "$TICK_FILE" 2>/dev/null || echo "$io_ticks")
TIME_OLD=$(cat "$TIME_FILE" 2>/dev/null || echo "$NOW_NS")

echo "$io_ticks" >"$TICK_FILE"
echo "$NOW_NS" >"$TIME_FILE"

# %util = 100 * (busy 증가분 ms) / (실제 경과 ms), 0~100 clamp
TICK_DELTA=$((io_ticks - TICK_OLD))
ELAPSED_MS=$(((NOW_NS - TIME_OLD) / 1000000))

if [ "$ELAPSED_MS" -le 0 ]; then
  UTIL=0
else
  UTIL=$((100 * TICK_DELTA / ELAPSED_MS))
fi
[ "$UTIL" -gt 100 ] && UTIL=100
[ "$UTIL" -lt 0 ] && UTIL=0

# CPU와 동일한 14단계 임계값(%) → style.css의 #custom-io_busy.levelN 색상 적용
# custom 모듈은 config의 states가 적용되지 않으므로 class를 직접 내보낸다
LEVELS=(10 15 20 25 30 35 40 45 50 55 60 65 70 75)
CLASS=""
for ((i = ${#LEVELS[@]} - 1; i >= 0; i--)); do
  if [ "$UTIL" -ge "${LEVELS[i]}" ]; then
    CLASS="level$((i + 1))"
    break
  fi
done

# JSON 출력
# %3d로 자릿수를 3칸에 고정 → 0~100% 어디서든 모듈 폭과 % 기호 위치가 흔들리지 않는다
printf '{"text": "I/O: %3d%%", "percentage": %d, "class": "%s"}\n' "$UTIL" "$UTIL" "$CLASS"
