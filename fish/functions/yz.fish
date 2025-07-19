#                                    ╭──────╮
#                                    │ yazi │
#                                    ╰──────╯
function yz
    set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"

    if test -s "$tmp"
        set -l cwd (cat "$tmp")
        if test -n "$cwd"; and test "$cwd" != "$PWD"
            cd "$cwd"
        end
    end

    rm -f -- "$tmp"
end
