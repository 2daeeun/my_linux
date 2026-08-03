#!/bin/bash

# 루트(/)가 위치한 물리 디스크 자동 감지
ROOT_SRC=$(findmnt -n -o SOURCE / 2>/dev/null | sed 's/\[.*\]//')
PART=${ROOT_SRC#/dev/}
DISK=$(lsblk -no PKNAME "/dev/$PART" 2>/dev/null | head -n1)
[ -z "$DISK" ] && DISK="$PART"

# stat 파일이 없으면(overlayfs, LVM, 파티션명만 잡힌 경우 등) 실제 블록 디바이스 중 첫 번째 선택
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

# 이전 값 저장 파일 (디스크별로 분리)
READ_FILE="/tmp/waybar_disk_read_$DISK"
WRITE_FILE="/tmp/waybar_disk_write_$DISK"

# 현재 섹터 수 읽기 (필드3 = read sectors, 필드7 = write sectors, 1섹터 = 512B)
read -r _ _ r_sec _ _ _ w_sec _ <"$STAT"
READ_NOW=$((r_sec * 512))
WRITE_NOW=$((w_sec * 512))

# 이전 값 불러오기 (처음이면 현재값 → rate 0)
READ_OLD=$(cat "$READ_FILE" 2>/dev/null || echo "$READ_NOW")
WRITE_OLD=$(cat "$WRITE_FILE" 2>/dev/null || echo "$WRITE_NOW")

# 차이 계산 (interval=1 이므로 초당 속도)
READ_RATE=$((READ_NOW - READ_OLD))
WRITE_RATE=$((WRITE_NOW - WRITE_OLD))

# 저장
echo "$READ_NOW" >"$READ_FILE"
echo "$WRITE_NOW" >"$WRITE_FILE"

# 사람이 읽기 쉬운 형식으로 변환
readable() {
  local bytes=$1
  if [ "$bytes" -lt $((1024 * 1024)) ]; then
    echo "$((bytes / 1024))KB/s"
  elif [ "$bytes" -lt $((1024 * 1024 * 1024)) ]; then
    echo "$((bytes / 1024 / 1024))MB/s"
  else
    printf "%d.%dGB/s" $((bytes / 1073741824)) $(((bytes * 10 / 1073741824) % 10))
  fi
}

READ=$(readable $READ_RATE)
WRITE=$(readable $WRITE_RATE)

echo "R:$READ W:$WRITE"
