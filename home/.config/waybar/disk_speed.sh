#!/bin/bash

# 읽기/쓰기를 waybar에서 각각 별도 영역(모듈)으로 표시하기 위해 종류를 인자로 받는다.
#   disk_speed.sh read   →  "R:850MB/s"
#   disk_speed.sh write  →  "W:12MB/s"
case "${1:-}" in
read)
  KIND="read"
  PREFIX="R:"
  ;;
write)
  KIND="write"
  PREFIX="W:"
  ;;
*)
  echo "usage: $(basename "$0") read|write" >&2
  exit 1
  ;;
esac

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

# 이전 값 저장 파일 (디스크별·종류별로 분리)
CACHE="/tmp/waybar_disk_${KIND}_$DISK"

# 현재 섹터 수 읽기 (필드3 = read sectors, 필드7 = write sectors, 1섹터 = 512B)
read -r _ _ r_sec _ _ _ w_sec _ <"$STAT"
if [ "$KIND" = "read" ]; then
  NOW=$((r_sec * 512))
else
  NOW=$((w_sec * 512))
fi

# 이전 값 불러오기 (처음이면 현재값 → rate 0)
OLD=$(cat "$CACHE" 2>/dev/null || echo "$NOW")
echo "$NOW" >"$CACHE"

# 차이 계산 (interval=1 이므로 초당 속도)
RATE=$((NOW - OLD))

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

# CPU/MEM(style.css)과 동일한 14단계 색상표
COLORS=(
  "#D5FF00" "#E5FF00" "#F2FF00" "#FFF700" "#FFE500" "#FFD400" "#FFBF00"
  "#FFAA00" "#FF9500" "#FF7F00" "#FF6A00" "#FF5500" "#FF2A00" "#FF0000"
)

# 각 단계의 하한 임계값 (bytes/s, 로그 스케일 / 1GB/s에서 빨강)
# 1MB → 2MB → 3MB → 5MB → 9MB → 15MB → 25MB
# → 42MB → 70MB → 120MB → 200MB → 350MB → 600MB → 1.0GB
# 표시가 정수 MB 단위이므로 단계마다 표시값이 겹치지 않도록 잡았다.
THRESHOLDS=(
  1048576 2097152 3145728 5242880 9437184 15728640 26214400
  44040192 73400320 125829120 209715200 367001600 629145600 1073741824
)

# 속도에 맞는 색을 pango markup으로 입힘 (임계값 미만이면 기본 흰색)
colorize() {
  local bytes=$1 text=$2 i
  for ((i = ${#THRESHOLDS[@]} - 1; i >= 0; i--)); do
    if [ "$bytes" -ge "${THRESHOLDS[i]}" ]; then
      echo "<span color=\"${COLORS[i]}\">$text</span>"
      return
    fi
  done
  echo "$text"
}

echo "$PREFIX$(colorize "$RATE" "$(readable $RATE)")"
