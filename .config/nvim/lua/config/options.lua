-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.guicursor = "a:block-blinkon500-blinkoff500-blinkwait500,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor,o:hor50"
vim.opt.winborder = "none"

vim.opt.hidden = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.list = true
vim.opt.lcs = {
    tab = "󰌒 ",
    space = "·",
    -- trail = "-",
    nbsp = "+",
}
