-- For `plugins/markview.lua` users.
return {
    "OXY2DEV/markview.nvim",
    lazy = false,

    -- For `nvim-treesitter` users.
    priority = 49,

    -- For blink.cmp's completion
    -- source
    dependencies = {
        "saghen/blink.cmp",
    },
    opts = {
        preview = {
            icon_provider = "mini",
        },
        typst = {
            heading = {
                shift_width = 0,
            },
            list_items = {
                shift_width = 1,
            },
        },
    },
}
