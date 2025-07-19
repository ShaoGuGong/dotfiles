return {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
        code = {
            enabled = true,
            render_modes = false,
            sign = true,
            style = "full",
            position = "left",
            language_pad = 0,
            language_icon = true,
            language_name = true,
            disable_background = { "diff" },
            width = "full",
            left_margin = 0,
            left_pad = 0,
            right_pad = 0,
            min_width = 0,
            border = "hide",
            above = "▄",
            below = "▀",
            inline_left = "",
            inline_right = "",
            inline_pad = 0,
            highlight = "RenderMarkdownCode",
            highlight_language = nil,
            highlight_border = "RenderMarkdownCodeBorder",
            highlight_fallback = "RenderMarkdownCodeFallback",
            highlight_inline = "RenderMarkdownCodeInline",
        },
        heading = {
            enabled = true,
            render_modes = false,
            atx = true,
            setext = true,
            sign = true,
            icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
            position = "overlay",
            signs = { "󰫎 " },
            width = "full",
            left_margin = 0,
            left_pad = 0,
            right_pad = 0,
            min_width = 0,
            border = true,
            border_virtual = false,
            border_prefix = false,
            above = "▄",
            below = "▀",
            backgrounds = {
                "RenderMarkdownH1Bg",
                "RenderMarkdownH2Bg",
                "RenderMarkdownH3Bg",
                "RenderMarkdownH4Bg",
                "RenderMarkdownH5Bg",
                "RenderMarkdownH6Bg",
            },
            foregrounds = {
                "RenderMarkdownH1",
                "RenderMarkdownH2",
                "RenderMarkdownH3",
                "RenderMarkdownH4",
                "RenderMarkdownH5",
                "RenderMarkdownH6",
            },
            custom = {},
        },
        checkbox = {
            unchecked = { icon = "✘ " },
            checked = { icon = "✔ " },
            custom = { todo = { rendered = "◯ " } },
        },
        dash = {
            enabled = true,
            render_modes = false,
            icon = "─",
            width = "full",
            left_margin = 0,
            highlight = "RenderMarkdownDash",
        },
        bullet = {
            enabled = true,
            render_modes = false,
            icons = { "●", "○", "◆", "◇" },
            ordered_icons = function(ctx)
                local value = vim.trim(ctx.value)
                local index = tonumber(value:sub(1, #value - 1))
                return ("%d."):format(index > 1 and index or ctx.index)
            end,
            left_pad = 0,
            right_pad = 0,
            highlight = "RenderMarkdownBullet",
            scope_highlight = {},
        },
        pipe_table = { preset = "double" },
        sign = {
            enabled = true,
            highlight = "RenderMarkdownSign",
        },
        indent = { enabled = true },
    },
    ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
    config = function(_, opts)
        require("render-markdown").setup(opts)
        Snacks.toggle({
            name = "Render Markdown",
            get = function()
                return require("render-markdown.state").enabled
            end,
            set = function(enabled)
                local m = require("render-markdown")
                if enabled then
                    m.enable()
                else
                    m.disable()
                end
            end,
        }):map("<leader>um")
    end,
}
