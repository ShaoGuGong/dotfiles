vim.g.nvim_start_time = vim.loop.hrtime() / 1e6

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
        opts.options.theme = "nord"
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
        opts.sections.lualine_c = {}
        opts.sections.lualine_y = {
            { "progress", separator = { left = "" }, padding = { left = 1, right = 0 } },
            { "location", padding = { left = 1, right = 1 } },
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
        opts.tabline = {
            lualine_a = {
                {
                    "filename",
                    separator = { left = "", right = "" },
                    file_status = true, -- Displays file status (readonly status, modified status)
                    newfile_status = true, -- Display new file status (new file means no write after created)
                    path = 1, -- 0: Just the filename
                    -- 1: Relative path
                    -- 2: Absolute path
                    -- 3: Absolute path, with tilde as the home directory
                    -- 4: Filename and parent dir, with tilde as the home directory

                    shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                    -- for other components. (terrible name, any suggestions?)
                    -- It can also be a function that returns
                    -- the value of `shorting_target` dynamically.
                    symbols = {
                        modified = "[]", -- Text to show when the file is modified.
                        readonly = "[]", -- Text to show when the file is non-modifiable or readonly.
                        unnamed = "[]", -- Text to show for unnamed buffers.
                        newfile = "[󰎔]", -- Text to show for newly created file before first write
                    },
                },
                -- {
                --     "buffers",
                --     show_filename_only = true, -- Shows shortened relative path when set to false.
                --     hide_filename_extension = false, -- Hide filename extension when set to true.
                --     show_modified_status = true, -- Shows indicator when the buffer is modified.
                --
                --     mode = 0, -- 0: Shows buffer name
                --     -- 1: Shows buffer index
                --     -- 2: Shows buffer name + buffer index
                --     -- 3: Shows buffer number
                --     -- 4: Shows buffer name + buffer number
                --
                --     max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
                --     -- it can also be a function that returns
                --     -- the value of `max_length` dynamically.
                --
                --     symbols = {
                --         modified = " ●", -- Text to show when the buffer is modified
                --         alternate_file = " ", -- Text to show to identify the alternate file
                --         directory = " ", -- Text to show when the buffer is a directory
                --     },
                -- },
            },
        }
    end,
}
