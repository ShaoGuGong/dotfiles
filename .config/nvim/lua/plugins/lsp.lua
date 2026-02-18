return {
    "neovim/nvim-lspconfig",
    opts = {
        diagnostics = { virtual_text = false }, -- Disable virtual text
        servers = {
            pyright = {
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "on", -- Enable type checking
                            reportUnusedVariable = false,
                            reportUnusedFunction = false,
                        },
                    },
                },
            },
            ruff_lsp = {
                init_options = {
                    settings = {
                        configuration = "/home/shaogu/.config/nvim/lua/plugins/setting/ruff.toml",
                    },
                },
            },
        },
    },
}
