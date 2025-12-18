return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        columns = {
            "permissions",
            "size",
            "mtime",
            "icon",
        },
    },
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    keys = function()
        local wk = require("which-key")
        wk.add({
            {
                "<leader>e",
                "<cmd>Oil<cr>",
                desc = "Open Oil",
                icon = " ",
            },
        })
    end,
}
