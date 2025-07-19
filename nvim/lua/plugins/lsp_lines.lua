return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
        require("lsp_lines").setup()
        -- 等所有 LSP 啟動完後再覆蓋 diagnostic 設定
        vim.defer_fn(function()
            vim.diagnostic.config({
                virtual_text = false,
                virtual_lines = true,
            })
        end, 0)
    end,
}
