-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Set Fcitx5 autocmds auto switch input method to English
-- 建立一個 augroup，防止重複定義
local group = vim.api.nvim_create_augroup("Fcitx5Toggle", { clear = true })

-- 定義要綁定的事件
local events = {
    "InsertEnter",
    "InsertLeave",
    "BufEnter",
    "BufLeave",
    "BufCreate",
}

-- 綁定每個事件
for _, event in ipairs(events) do
    vim.api.nvim_create_autocmd(event, {
        group = group,
        pattern = "*",
        command = "silent! !fcitx5-remote -c",
    })
end
