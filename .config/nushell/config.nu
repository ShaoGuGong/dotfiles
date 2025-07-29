# config.nu
#
# Installed by:
# version = "0.106.0"
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


source ($nu.data-dir | path join "vendor/autoload/zoxide.nu")

# ──────────────────────────────── alias ──────────────────────────────
alias Leet = nvim "leetcode.nvim"
alias ptt = ssh "bbsu@ptt.cc"
alias lg = lazygit
alias cd = z
alias update = paru -Syu
alias eza_ls = eza -al --color=always --group-directories-first --icons # preferred listing
alias eza_la = eza -a --color=always --group-directories-first --icons  # all files and dirs
alias eza_ll = eza -l --color=always --group-directories-first --icons  # long format
alias eza_lt = eza -aT --color=always --group-directories-first --icons # tree listing
alias eza_l. = eza -a | grep -e '^\.'                                     # show only dotfiles


# ────────────────────────────── functions ────────────────────────────
use ./scripts/yz.nu
use ./scripts/ssh_server.nu

fastfetch
