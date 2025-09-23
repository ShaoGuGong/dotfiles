return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
        require("tiny-inline-diagnostic").setup({
            preset = "ghost",
            options = {
                multilines = {
                    enabled = true,
                    always_show = true,
                },
                throttle = 0,
                show_all_diags_on_cursorline = true,
                -- enable_on_insert = true,
                -- enable_on_select = true,
            },
        })
        vim.diagnostic.config({ virtual_text = false }) -- Disable default virtual text
    end,
}
