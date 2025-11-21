function batcmd
    if test (count $argv) -eq 0
        echo "Usage: bc <command>"
        return 1
    end

    eval $argv | bat -l conf -p
end
