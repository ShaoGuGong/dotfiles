# overwrite greeting
# potentially disabling fastfetch
source /usr/share/cachyos-fish-config/cachyos-config.fish
#function fish_greeting
#    # smth smth
#end
if status is-interactive
    set -gx PATH $HOME/.dotfiles/ $PATH
    set -gx WEZTERM_CONFIG_DIR $HOME/.config/wezterm
    set -x EDITOR nvim
    #                                     ╭─────╮
    #                                     │ fzf │
    #                                     ╰─────╯
    # Enable fzf keybindings
    fzf_key_bindings
    # Optional: Better preview layout
    set -gx FZF_DEFAULT_OPTS '
    --height 40%
    --reverse
    --bind ctrl-n:preview-down,ctrl-p:preview-up,f3:toggle-preview
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
    --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
    --color=selected-bg:#45475a
    --multi
    '
    # Optional: Use fd for faster and cleaner file searching (if installed)
    set -gx FZF_DEFAULT_COMMAND 'fd --type f'

    #                                  ╭───────────╮
    #                                  │ set alias │
    #                                  ╰───────────╯
    alias Leet="nvim leetcode.nvim"
    alias ptt="bbsu@ptt.cc"
    alias lg="lazygit"
    alias cd="z"
    alias update="sys-update"
    alias reload_fish="source $HOME/.config/fish/config.fish"

    zoxide init fish | source
    starship init fish | source
    fish_vi_key_bindings
end
