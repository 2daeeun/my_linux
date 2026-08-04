#!/bin/bash

# 다운로드/업로드를 waybar에서 각각 별도 영역(모듈)으로 표시하기 위해 방향을 인자로 받는다.
#   net_speed.sh down  →  "12MB/s↓"
#   net_speed.sh up    →  "129KB/s↑"
case "${1:-}" in
down)
  COUNTER="rx_bytes"
  CACHE="/tmp/waybar_net_rx"
  SUFFIX="↓"
  ;;
up)
  COUNTER="tx_bytes"
  CACHE="/tmp/waybar_net_tx"
  SUFFIX="↑"
  ;;
*)
  echo "usage: $(basename "$0") down|up" >&2
  exit 1
  ;;
esac

# 자동으로 네트워크 인터페이스 선택 (eth0, wlan0 등)
INTERFACE=$(ip route get 1.1.1.1 | awk '{print $5; exit}')

# 현재 바이트 읽기
NOW=$(cat "/sys/class/net/$INTERFACE/statistics/$COUNTER")

# 이전 바이트 불러오기 (처음이면 현재값 → rate 0)
OLD=$(cat "$CACHE" 2>/dev/null || echo "$NOW")
echo "$NOW" >"$CACHE"

# 차이 계산 (interval=1 이므로 초당 속도)
RATE=$((NOW - OLD))

# 사람이 읽기 쉬운 형식으로 변환
readable() {
  local bytes=$1
  if [ "$bytes" -lt $((1024 * 1024)) ]; then
    echo "$((bytes / 1024))KB/s"
  else
    echo "$((bytes / 1024 / 1024))MB/s"
  fi
}

# CPU/MEM(style.css)과 동일한 14단계 색상표
COLORS=(
  "#D5FF00" "#E5FF00" "#F2FF00" "#FFF700" "#FFE500" "#FFD400" "#FFBF00"
  "#FFAA00" "#FF9500" "#FF7F00" "#FF6A00" "#FF5500" "#FF2A00" "#FF0000"
)

# 각 단계의 하한 임계값 (bytes/s, 로그 스케일 / 10MB/s에서 빨강)
# 64KB → 96KB → 144KB → 216KB → 320KB → 480KB → 720KB
# → 1MB → 2MB → 3MB → 4MB → 5MB → 7MB → 10MB
# 표시가 정수 KB/MB 단위이므로 단계마다 표시값이 겹치지 않도록 잡았다.
THRESHOLDS=(
  65536 98304 147456 221184 327680 491520 737280
  1048576 2097152 3145728 4194304 5242880 7340032 10485760
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

echo "$(colorize "$RATE" "$(readable $RATE)")$SUFFIX"
