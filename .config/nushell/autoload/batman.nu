def batman [cmd] {
    if $cmd != null {
        man $cmd | bat -l Manpage -p
    }
}
