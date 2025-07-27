function umount_remote_server
    cd ~
    if mountpoint -q $HOME/Documents/workspace/remote_server/
        umount -l $HOME/Documents/workspace/remote_server/
    else
        echo "remote_server is not mounted."
    end
end
