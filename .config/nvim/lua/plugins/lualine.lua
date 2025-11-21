vim.g.nvim_start_time = vim.loop.hrtime() / 1e6

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
        local icons = LazyVim.config.icons
        -- opts.options.component_separators = ""
        opts.options.component_separators = ""
        -- opts.options.section_separators = { left = "", right = "" }
        opts.options.section_separators = ""
        opts.sections.lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } }
        opts.sections.lualine_b = {
            { "branch", icon = "", separator = { right = "" } },
            -- { "filename", separator = { right = "" } },
        }
        opts.sections.lualine_c = {
            {
                "buffers",
                show_filename_only = true, -- Shows shortened relative path when set to false.
                hide_filename_extension = true, -- Hide filename extension when set to true.
                show_modified_status = true, -- Shows indicator when the buffer is modified.
                max_length = vim.o.columns * 3 / 5,
                symbols = {
                    modified = " ●", -- Text to show when the buffer is modified
                    alternate_file = "", -- Text to show to identify the alternate file
                    directory = "", -- Text to show when the buffer is a directory
                },
            },
        }
        opts.sections.lualine_y = {
            { "progress", separator = { left = "" }, padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
        }
        opts.sections.lualine_z = {
            {
                -- function()
                --     return " " .. os.date("%R")
                -- end,
                function()
                    local now = vim.loop.hrtime() / 1e6
                    local elapsed = now - vim.g.nvim_start_time
                    local seconds = math.floor(elapsed / 1000)
                    local minutes = math.floor(seconds / 60)
                    if minutes >= 60 then
                        local hours = math.floor(minutes / 60)
                        minutes = minutes % 60
                        return string.format("󰔟 %02d:%02d", hours, minutes)
                    else
                        seconds = seconds % 60
                        return string.format("󰔟 %02d:%02d", minutes, seconds)
                    end
                end,
                separator = { right = "" },
                left_padding = 2,
            },
        }
        opts.winbar = {
            lualine_b = {
                { "filetype", icon_only = true, separator = "" },
            },
            lualine_c = {
                {
                    function()
                        local navic = require("nvim-navic")
                        if navic.is_available() then
                            local loc = navic.get_location()
                            return (loc ~= "" and loc) or " "
                        end
                        return " "
                    end,
                    color_correction = "dynamic",
                    navic_opts = { highlight = true },
                },
            },
            lualine_x = {
                { "filename" },
                {
                    "diagnostics",
                    symbols = {
                        error = icons.diagnostics.Error,
                        warn = icons.diagnostics.Warn,
                        info = icons.diagnostics.Info,
                        hint = icons.diagnostics.Hint,
                    },
                    separator = "",
                },
            },
        }
        opts.inactive_winbar = {
            lualine_b = {
                { "filetype", icon_only = true, separator = "" },
            },
            lualine_x = {
                { "filename" },
                {
                    "diagnostics",
                    symbols = {
                        error = icons.diagnostics.Error,
                        warn = icons.diagnostics.Warn,
                        info = icons.diagnostics.Info,
                        hint = icons.diagnostics.Hint,
                    },
                    separator = "",
                },
            },
        }
    end,
}
