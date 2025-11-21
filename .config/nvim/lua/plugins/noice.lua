return {
    "folke/noice.nvim",
    -- enabled = false,
    opts = {
        cmdline = {
            view = "cmdline",
        },
        routes = {
            {
                filter = { event = "msg_show", kind = { "shell_out", "shell_err" } },
                view = "split",
                opts = {
                    level = "info",
                    skip = false,
                    replace = false,
                },
            },
        },
    },
}
