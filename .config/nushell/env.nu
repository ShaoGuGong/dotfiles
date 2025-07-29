# env.nu
#
# Installed by:
# version = "0.106.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.
$env.config = {
  edit_mode: vi,
  show_banner: false,
}

$env.EDITOR = "nvim"
$env.PATH = ($env.PATH | append ($env.HOME | path join "Documents/dotfiles"))
$env.WEZTERM_CONFIG_DIR = $env.HOME | path join ".config/wezterm"

$env.FZF_DEFAULT_OPTS = '
--height 40%
--reverse
--bind ctrl-n:preview-down,ctrl-p:preview-up,f3:toggle-preview
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
--color=selected-bg:#45475a
--multi
'

$env.PROMPT_INDICATOR_VI_INSERT = "INSERT  "
$env.PROMPT_INDICATOR_VI_NORMAL = "NORMAL  "

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
zoxide init nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")
