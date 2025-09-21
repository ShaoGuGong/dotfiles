return {
    "akinsho/bufferline.nvim",
    opts = {
        options = {
            modified_icon = "󱩽 ",
            indicator = {
                -- style = "icon",
                -- icon = "󱩽 ",
                style = "underline",
            },
            separator_style = "slant",
            always_show_bufferline = true,
        },
        highlights = {
            buffer_selected = {
                italic = false,
            },
            diagnostic_selected = {
                italic = false,
            },
            hint_selected = {
                italic = false,
            },
            hint_diagnostic_selected = {
                italic = false,
            },
            info_selected = {
                italic = false,
            },
            info_diagnostic_selected = {
                italic = false,
            },
            warning_selected = {
                italic = false,
            },
            warning_diagnostic_selected = {
                italic = false,
            },
            error_selected = {
                italic = false,
            },
            error_diagnostic_selected = {
                italic = false,
            },
            indicator_selected = {
                fg = "#c8c093",
                bg = "NONE",
            },
            -- indicator_visible = {
            --     fg = "#c8c093",
            --     bg = "NONE",
            -- },
            -- modified_visible = {
            --     fg = "#c8c093",
            --     bg = "NONE",
            -- },
        },
    },
}
