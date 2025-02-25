#!/bin/bash

# 출력명 설정 (xrandr 명령어로 확인한 출력명으로 교체)
OUTPUT="eDP-1" # 예: eDP-1

# 밝기를 낮추기 전에 대기할 시간 (밀리초)
IDLE_THRESHOLD=300000 # 5분 = 300000 밀리초

# 밝기 조정
xrandr --output $OUTPUT --brightness 0.3

# 유휴 상태 해제 감지 및 밝기 복원
while :; do
  # 현재 유휴 시간 확인
  idle_time=$(xprintidle)

  # 유휴 시간이 기준치보다 작다면 밝기 복원
  if [ "$idle_time" -lt "$IDLE_THRESHOLD" ]; then
    xrandr --output $OUTPUT --brightness 1.0
    break
  fi

  # 잠시 대기 (0.5초)
  sleep 0.5
done
