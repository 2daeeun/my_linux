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
echo $RX_NOW > "$RX_FILE"
echo $TX_NOW > "$TX_FILE"

# 사람이 읽기 쉬운 형식으로 변환
readable() {
    local bytes=$1
    if [ "$bytes" -lt $((1024*1024)) ]; then
        echo "$((bytes / 1024))KB/s"
    else
        echo "$((bytes / 1024 / 1024))MB/s"
    fi
}

DOWN=$(readable $RX_RATE)
UP=$(readable $TX_RATE)

echo "$DOWN↓ $UP↑"
