-- lazy.nvim
return {
    "chrisgrieser/nvim-origami",
    event = "VeryLazy",
    opts = {
        foldtext = {
            lineCount = {
                template = " 󰘕 %d lines ", -- `%d` is replaced with the number of folded lines
                hlgroup = "Todo",
            },
        },
    }, -- needed even when using default config

    -- recommended: disable vim's auto-folding
    init = function()
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99
    end,
}
