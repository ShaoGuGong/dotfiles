#! /bin/bash

dotfile_path="$HOME/Documents/dotfile"

# ──────────────────────────────── Neovim ────────────────────────────────
rsync -avhP ~/.config/nvim/ "$dotfile_path/nvim/" --exclude ".git" --exclude ".gitignore"
# ───────────────────────────────── Yazi ─────────────────────────────────
rsync -avhP ~/.config/yazi/ "$dotfile_path/yazi/" --exclude ".git" --exclude ".gitignore"
# ───────────────────────────────── fish ─────────────────────────────────
rsync -avhP ~/.config/fish/ "$dotfile_path/fish/" --exclude ".git" --exclude ".gitignore"
# ──────────────────────────────── vivify ────────────────────────────────
rsync -avhP ~/.config/vivify/ "$dotfile_path/vivify/" --exclude ".git" --exclude ".gitignore"
# ─────────────────────────────── starship ───────────────────────────────
rsync -avhP ~/.config/starship.toml "$dotfile_path/" --exclude ".git" --exclude ".gitignore"
# ─────────────────────────────── wezterm ─────────────────────────────
rsync -avhP $HOME/.wezterm.lua "$dotfile_path/"

paru -Qeq >"$dotfile_path/my_arch_package"
git add .
git commit -m "$(date +%m-%d-%Y)"
git push origin main
