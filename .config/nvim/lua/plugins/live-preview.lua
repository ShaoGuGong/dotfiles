return {
    "brianhuster/live-preview.nvim",
    lazy = true,
    ft = { "markdown", "html" },
    dependencies = {
        -- You can choose one of the following pickers
        -- "nvim-telescope/telescope.nvim",
        -- "ibhagwan/fzf-lua",
        -- "echasnovski/mini.pick",
        "folke/snacks.nvim",
    },
    keys = { {
        "<leader>mp",
        "<CMD>LivePreview start<CR>",
        desc = "Live Preview",
    } },
}
