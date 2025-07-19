return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
        local icons = LazyVim.config.icons
        opts.sections.lualine_c = {
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 1 } },
            {
                "diagnostics",
                symbols = {
                    error = icons.diagnostics.Error,
                    warn = icons.diagnostics.Warn,
                    info = icons.diagnostics.Info,
                    hint = icons.diagnostics.Hint,
                },
            },
        }
    end,
}
