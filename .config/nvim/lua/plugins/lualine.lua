return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
        local icons = LazyVim.config.icons
        opts.options.component_separators = ""
        opts.options.section_separators = { left = "", right = "" }
        opts.sections.lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } }
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
        opts.sections.lualine_z = {
            {
                function()
                    return " " .. os.date("%R")
                end,
                separator = { right = "" },
                left_padding = 2,
            },
        }
    end,
}
