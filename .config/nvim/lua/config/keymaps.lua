-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap_set = LazyVim.safe_keymap_set
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")

local modes = { "n", "v", "i", "s", "x", "o", "c", "t" }
keymap_set(modes, "<C-[>", "<ESC>", { desc = "Escape from any mode" })
keymap_set("i", "kj", "<esc>", { desc = "Escape from insert mode" })
-- ─────────────────────────────── Search ────────────────────────────
keymap_set("t", "<esc>", [[<C-\><C-n>]], { desc = "Terminal: Exit to Normal Mode" })
keymap_set({ "n", "x", "o" }, "n", "nzzzv", { desc = "Next Search Result" })
keymap_set({ "n", "x", "o" }, "N", "Nzzzv", { desc = "Prev Search Result" })
keymap_set("n", "<C-j>", "i<cr><ESC>", { desc = "Insert Below" })

local wk = require("which-key")
wk.add({
    { "<leader>t", "<cmd>terminal<cr>", desc = "Open terminal" },
})
local transparent_status = vim.g.transparent_enabled or false
local copilot_status = true
local autosave_status = false
local tab_size = 4

local toggles = {
    {
        map = "<leader>U",
        id = "transparent",
        name = "Transparent",
        get = function()
            return transparent_status
        end,
        set = function(state)
            vim.cmd("TransparentToggle")
            if state then
                transparent_status = true
            else
                transparent_status = false
            end
        end,
    },
    {
        map = "<leader>C",
        id = "copilot",
        name = "Copilot ",
        get = function()
            return copilot_status
        end,
        set = function(state)
            if state then
                vim.cmd("Copilot enable")
                copilot_status = true
            else
                vim.cmd("Copilot disable")
                copilot_status = false
            end
        end,
    },
    {
        map = "<leader>a",
        id = "autosave",
        name = "auto-save",
        get = function()
            return autosave_status
        end,
        set = function(state)
            vim.cmd("ASToggle")
            if state then
                autosave_status = true
            else
                autosave_status = false
            end
        end,
    },
    {
        map = "<leader>c<Tab>",
        id = "tabsize",
        name = "tabsize 4/2",
        get = function()
            return tab_size == 4
        end,
        set = function(state)
            if state then
                tab_size = 4
            else
                tab_size = 2
            end
            print("tabsize = " .. tab_size)
            vim.opt.tabstop = tab_size
            vim.opt.shiftwidth = tab_size
            vim.opt.softtabstop = tab_size
        end,
    },
    {
        map = "<leader>W",
        id = "whitespace_mode",
        name = "whitespace-mode",
        get = function()
            return vim.opt.list:get()
        end,
        set = function(state)
            if state then
                vim.opt.list = true
            else
                vim.opt.list = false
            end
        end,
    },
}

for _, cfg in pairs(toggles) do
    Snacks.toggle
        .new({
            id = cfg.id,
            name = cfg.name,
            get = cfg.get,
            set = cfg.set,
        })
        :map(cfg.map)
end
