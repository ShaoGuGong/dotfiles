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
local input_method_group = vim.api.nvim_create_augroup("Fcitx5Toggle", { clear = true })
local c_dev_group = vim.api.nvim_create_augroup("CDevSetting", { clear = true })
local compile_group = vim.api.nvim_create_augroup("CompileSetting", { clear = true })

-- 定義要綁定的事件
-- local input_method_events = {
--     "InsertEnter",
--     "InsertLeave",
--     "BufEnter",
--     "BufLeave",
--     "BufCreate",
-- }

-- 綁定每個事件
vim.api.nvim_create_autocmd("InsertLeave", {
    group = input_method_group,
    pattern = "*",
    -- command = "silent! !fcitx5-remote -c",
    callback = function()
        vim.uv.spawn("fcitx5-remote", { args = { "-c" } })
    end,
})

local c_dev_events = {
    "BufRead",
    "BufNewFile",
}

vim.api.nvim_create_autocmd(c_dev_events, {
    group = c_dev_group,
    pattern = { "*.c", "*.h", "*.cpp", "*.hpp" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})

local function python_run()
    local found = vim.fs.find("main.py", { upward = true, stop = vim.uv.os_homedir() })[1]
    if found then
        vim.opt_local.makeprg = "uv run " .. vim.fn.shellescape(found)
    else
        vim.opt_local.makeprg = "uv run %"
    end
end

local function rust_run()
    -- 優先尋找 Cargo.toml，因為這是 Rust 專案的標誌
    local cargo_toml = vim.fs.find("Cargo.toml", { upward = true, stop = vim.uv.os_homedir() })[1]
    if cargo_toml then
        -- 如果在 Cargo 專案中，不論在哪個子目錄，直接執行 cargo run
        vim.opt_local.makeprg = "cargo run"
    else
        -- 如果只是單獨的 .rs 檔案，使用 rustc
        -- %:r 會取得不含副檔名的檔名
        vim.opt_local.makeprg = "rustc % -o %:r && ./%:r && rm %:r"
    end
end

local makepkg_group = {
    ["*.py"] = python_run,
    ["*.rs"] = rust_run,
}

for key, value in pairs(makepkg_group) do
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        group = compile_group,
        pattern = key,
        callback = value,
    })
end

-- 移除自動開啟Spell Check
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.diagnostic.config({ virtual_text = false })
-- vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "Outline" })
