return {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- or ft = 'typst'
    ft = { "typst" },
    version = "1.*",
    opts = {}, -- lazy.nvim will implicitly calls `setup {}`
    config = function()
        require("typst-preview").setup({
            port = 8000,
        })
    end,
    keys = {
        {
            "<leader>cp",
            ft = "typst",
            "<cmd>TypstPreview<cr>",
            desc = "Typst Preview",
        },
    },
}
