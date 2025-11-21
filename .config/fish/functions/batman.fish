function batman
    set -l cmd $argv[1]
    test -z "$cmd" && return 1
    command man $cmd | bat -l Manpage -p
end
