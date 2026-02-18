# config.nu
#
# Installed by:
# version = "0.110.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

$env.config.buffer_editor = "helix"
$env.EDITOR = "helix"
$env.config.show_banner = false
$env.path ++= ["~/.dotfiles/", "~/.emacs.d/bin", "~/.local/bin", "~/Scripts", "~/.cargo/bin"]

$env.WEZTERM_CONFIG_DIR = "~/.config/wezterm"
$env.DOOMDIR = "~/.config/doom"


do --env {
    let ssh_agent_file = (
        $nu.temp-dir | path join $"ssh-agent-(whoami).nuon"
    )

    if ($ssh_agent_file | path exists) {
        let ssh_agent_env = open ($ssh_agent_file)
        if ($"/proc/($ssh_agent_env.SSH_AGENT_PID)" | path exists) {
            load-env $ssh_agent_env
            return
        } else {
            rm $ssh_agent_file
        }
    }

    let ssh_agent_env = ^ssh-agent -c
        | lines
        | first 2
        | parse "setenv {name} {value};"
        | transpose --header-row
        | into record
    load-env $ssh_agent_env
    $ssh_agent_env | save --force $ssh_agent_file
}

source ($nu.config-path | path dirname | path join "themes/catppuccin_mocha.nu")

# setglobally nu.path $nu.data-dir
mkdir ($nu.data-dir | path join "vendor/autoload")
# setting starship prompt
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
#setting tv
tv init nu | save -f ($nu.data-dir | path join "vendor/autoload/tv.nu")
# setting zoxide
zoxide init nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")
# source ($nu.data-dir | path join "vendor/autoload/zoxide.nu")


fastfetch
