-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

local wk = require("which-key")

wk.add({
    { "<leader>ut", "<Cmd>TransparentToggle<CR>", desc = "Toggle TransParent" },
    -- 建立 <leader>t 群組

    { "<leader>t", group = "Terminal" }, -- 這一行最重要，讓 <leader>t 變 group
    -- 再掛下面兩個功能
    { "<leader>tf", "<Cmd>ToggleTerm direction=float<CR>", desc = "Open Floating Terminal" },
    { "<leader>tt", "<Cmd>ToggleTermToggleAll<CR>", desc = "Toggle All Terminals" },
})

local copilot_status = true
Snacks.toggle
    .new({
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
    })
    :map("<leader>C")
local autosave_status = true
Snacks.toggle
    .new({
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
    })
    :map("<leader>a")
