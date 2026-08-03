#!/bin/bash

# 자동으로 네트워크 인터페이스 선택 (eth0, wlan0 등)
INTERFACE=$(ip route get 1.1.1.1 | awk '{print $5; exit}')

# 이전 rx/tx 바이트 저장 파일
RX_FILE="/tmp/waybar_net_rx"
TX_FILE="/tmp/waybar_net_tx"

# 현재 바이트 읽기
RX_NOW=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX_NOW=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

# 이전 바이트 불러오기 (처음이면 현재값)
RX_OLD=$(cat "$RX_FILE" 2>/dev/null || echo "$RX_NOW")
TX_OLD=$(cat "$TX_FILE" 2>/dev/null || echo "$TX_NOW")

# 차이 계산
RX_RATE=$((RX_NOW - RX_OLD))
TX_RATE=$((TX_NOW - TX_OLD))

# 저장
echo $RX_NOW >"$RX_FILE"
echo $TX_NOW >"$TX_FILE"

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

# 각 단계의 하한 임계값 (bytes/s, 로그 스케일)
# 64KB → 128KB → 256KB → 512KB → 1MB → 2MB → 3MB
# → 5MB → 8MB → 12MB → 20MB → 30MB → 45MB → 60MB
THRESHOLDS=(
  65536 131072 262144 524288 1048576 2097152 3145728
  5242880 8388608 12582912 20971520 31457280 47185920 62914560
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

DOWN=$(colorize "$RX_RATE" "$(readable $RX_RATE)")
UP=$(colorize "$TX_RATE" "$(readable $TX_RATE)")

echo "$DOWN↓ $UP↑"
