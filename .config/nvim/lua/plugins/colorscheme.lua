return {
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "bamboo",
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
            require("bamboo").load()
        end,
    },
}
