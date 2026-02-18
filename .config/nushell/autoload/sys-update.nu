def --env sys-update [] {
    print $"(ansi green)Updating system package...(ansi reset)"
    paru -Syu
    print $"(ansi yellow)Updating flatpak package...(ansi reset)"
    flatpak update

    print -n "REBOOT NOW? [y/N]"
    let response = input
    match $response {
        "y" | "Y" => {
            print $"(ansi red)Rebooting system...(ansi reset)"
            reboot
        },
        _ => {
            print $"(ansi yellow)Please reboot your system as soon as possible to apply updates.(ansi reset)"
        },
    }
}
