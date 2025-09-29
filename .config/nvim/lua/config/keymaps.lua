-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ─────────────────────────────── Search ────────────────────────────
-- Normal 模式
vim.keymap.set("n", "n", "nzzzv", { desc = "Repeat search" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Repeat search (reverse)" })

-- Visual 模式
vim.keymap.set("x", "n", "nzzzv", { desc = "Repeat search" })
vim.keymap.set("x", "N", "Nzzzv", { desc = "Repeat search (reverse)" })

-- Operator-pending 模式
vim.keymap.set("o", "n", "nzzzv", { desc = "Repeat search" })
vim.keymap.set("o", "N", "Nzzzv", { desc = "Repeat search (reverse)" })

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    -- vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "<C-M-,>", [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set("t", "<C-,>", [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set("t", "<C-.>", [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set("t", "<C-M-.>", [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
local wk = require("which-key")

wk.add({
    -- 建立 <leader>t 群組
    { "<leader>t", group = "Terminal" }, -- 這一行最重要，讓 <leader>t 變 group
    -- 再掛下面兩個功能
    { "<leader>tf", "<Cmd>ToggleTerm direction=float<CR>", desc = "Open Floating Terminal" },
    { "<leader>tt", "<Cmd>ToggleTermToggleAll<CR>", desc = "Toggle All Terminals" }, -- 建立 <leader>t 群組
})

local transparent_status = vim.g.transparent_enabled or false
Snacks.toggle
    .new({
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
    })
    :map("<leader>U")

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

local autosave_status = false
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

local neocolumn_status = false
Snacks.toggle
    .new({
        id = "NeoColumn",
        name = "NeoColumn",
        get = function()
            return neocolumn_status
        end,
        set = function(state)
            vim.cmd("ToggleNeoColumn")
            if state then
                neocolumn_status = true
            else
                neocolumn_status = false
            end
        end,
    })
    :map("<leader>cn")

local tab_size = 4
Snacks.toggle
    .new({
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
    })
    :map("<leader>c<Tab>")
