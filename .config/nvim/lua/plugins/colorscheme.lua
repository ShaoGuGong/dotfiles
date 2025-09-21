return {
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "evergarden",
        },
    },
    { "ellisonleao/gruvbox.nvim" },
    { "rebelot/kanagawa.nvim" },
    { "Mofiqul/vscode.nvim" },
    { "savq/melange-nvim" },
    {
        "ribru17/bamboo.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("bamboo").setup({
                -- optional configuration here
            })
        end,
    },
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            require("everforest").setup({
                -- Your config here
                background = "hard",
            })
        end,
    },
    {
        "everviolet/nvim",
        name = "evergarden",
        priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
        opts = {
            theme = {
                variant = "fall", -- 'winter'|'fall'|'spring'|'summer'
                accent = "green",
            },
            editor = {
                transparent_background = false,
                sign = { color = "none" },
                float = {
                    color = "mantle",
                    solid_border = false,
                },
                completion = {
                    color = "surface0",
                },
            },
        },
    },
    {
        "nyngwang/nvimgelion",
        config = function()
            -- do whatever you want for further customization~
        end,
    },
}
