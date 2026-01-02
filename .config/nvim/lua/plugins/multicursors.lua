return {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvimtools/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
        {
            mode = { "v", "n" },
            "<leader>cM",
            "<cmd>MCstart<cr>",
            desc = "muticursors",
        },
    },
}
