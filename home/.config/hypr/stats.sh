#!/usr/bin/env sh

# CPU 사용률 계산
cpu_line="$(grep '^cpu ' /proc/stat)"
set -- $cpu_line
idle=$5
total=$(( $2 + $3 + $4 + $5 + $6 + $7 + $8 ))
cpu_usage=$(awk -v i="$idle" -v t="$total" 'BEGIN { printf("%.1f", (1 - (i/t)) * 100) }')

# 메모리 사용률 계산 (free -m 으로 MB 단위 가져오고, awk 로 GB, 퍼센트 계산)
read mem_total_mb mem_used_mb <<< \
  $(free -m | awk '/^Mem:/ { print $2, $3 }')
mem_total_gb=$(awk "BEGIN { printf(\"%.2f\", $mem_total_mb/1024) }")
mem_used_gb=$(awk "BEGIN { printf(\"%.2f\", $mem_used_mb/1024) }")
mem_pct=$(awk "BEGIN { printf(\"%.0f\", ($mem_used_mb/$mem_total_mb)*100) }")

# 배터리 잔량 읽기
bat_path="/sys/class/power_supply/BAT0/capacity"
if [ -r "$bat_path" ]; then
  bat=$(cat "$bat_path")
else
  bat="N/A"
fi

# # 출력
# printf "CPU: %s%%    MEM: %s/%.2f GiB (%s%%)    BAT: %s%%\n" \
#   "$cpu_usage" "$mem_used_gb" "$mem_total_gb" "$mem_pct" "$bat"

# 출력 (한 줄에 하나씩)
printf "CPU:\t%s %%\n" \
  "$cpu_usage"
printf "MEM:\t%s / %.1f GB (%s %%)\n" \
  "$mem_used_gb" "$mem_total_gb" "$mem_pct"
printf "BAT:\t%s %%\n" \
  "$bat"
