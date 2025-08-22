function ssh-server
    set -l server (awk '/^Host / { print $2}' $HOME/.ssh/config | fzf)
    if test -z "$server"
        echo -e "\033[1;91mNo server selected\033[0m"
        return 1
    end
    nohup wezterm ssh $server >/dev/null 2>&1 &
end
