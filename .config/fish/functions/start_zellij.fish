function start_zellij
    # 取列表的第一欄（跳過表頭），每個名字各一行
    set -l sessions (zellij list-sessions -n | awk '{print $s}')
    if test (count $sessions) -ge 1
        set -l selected (printf '%s\n' $sessions | sk)
        if test -n "$selected"
            zellij attach (printf '%s' $selected | awk '{print $1}')
        end
    else
        set -l session_name (date +%m-%d_%H:%M)
        zellij attach -c "$session_name"
    end
end
