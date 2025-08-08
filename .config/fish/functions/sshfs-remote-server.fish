function sshfs-remote-server
    set -l workdir $argv[1]
    set -l server (awk '/^Host / { print $2}' $HOME/.ssh/config | fzf)
    if test -z "$server"
        echo "❌ 請提供 server 名稱"
        return 1
    end
    if not test -d $HOME/Documents/workspace/remote_server/
        mkdir -p $HOME/Documents/workspace/remote_server/
    end

    set -l basedir /home/ray_cluster/Documents/workspace/

    if test -z "$workdir"
        sshfs $server:$basedir $HOME/Documents/workspace/remote_server/
    else
        sshfs $server:$basedir/$workdir $HOME/Documents/workspace/remote_server/
    end
    and cd $HOME/Documents/workspace/remote_server/
end
