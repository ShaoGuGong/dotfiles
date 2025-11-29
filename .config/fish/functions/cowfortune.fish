function cowfortune
    set cmd (shuf -n 1 -e cowsay cowthink)
    set style (shuf -n 1 -e b d g p s t w y)
    set cow (cowsay -l | tail -n +2 | shuf -n 1)

    fortune -a | fmt -80 -s | $cmd -$style -f $cow -n
end
