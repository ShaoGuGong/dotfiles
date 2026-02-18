function start_zellij
    # 取列表的第一欄（跳過表頭），每個名字各一行
    # set -l sessions (zellij list-sessions -n | awk '{print $s}')
    # set -l new_session "[New Session]"
    # set -l selected (printf '%s\n' $new_session $sessions | tv)
    # if test -n "$selected"
    #     if test "$selected" = "$new_session"
    #         set -l default_name (date +%m-%d_%H:%M)
    #         read -P "Enter Session Name [$default_name]: " input_name
    #         if test -n $input_name
    #             zellij attach -c "$input_name"
    #         else
    #             zellij attach -c "$default_name"
    #         end
    #     else
    #         zellij attach (printf '%s' $selected | awk '{print $1}')
    #     end
    # end
    # echo ""
    zellij -l welcome
end
