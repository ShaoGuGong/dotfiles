return {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- or ft = 'typst'
    version = "1.*",
    opts = {}, -- lazy.nvim will implicitly calls `setup {}`
    keys = {
        {
            "<leader>cp",
            ft = "typst",
            "<cmd>TypstPreviewStop<cr><cmd>TypstPreview<cr>",
            desc = "Typst Preview",
        },
    },
}
