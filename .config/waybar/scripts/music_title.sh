#!/usr/bin/env bash
title=$(playerctl metadata --format "{{ title }}" 2>/dev/null)

# 若沒音樂就離開
[ -z "$title" ] && echo "" && exit 0

max_len=24
scroll_speed=1

if [ ${#title} -le $max_len ]; then
    echo "$title"
    exit 0
fi

# 取時間偏移製造滾動效果
offset=$((($(date +%s) / scroll_speed) % (${#title} + 3)))
scrolling_title="${title:$offset:$max_len}"

# 若不夠長就接回頭（環狀滾動）
if [ ${#scrolling_title} -lt $max_len ]; then
    scrolling_title+="${title:0:$(($max_len - ${#scrolling_title}))}"
fi

echo "$scrolling_title"
