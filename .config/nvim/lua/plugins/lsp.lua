return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            pyright = {
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "off", -- Disable type checking
                            reportUnusedVariable = false,
                            reportUnusedFunction = false,
                        },
                    },
                },
            },
            ruff_lsp = {
                init_options = {
                    settings = {
                        configuration = "/home/shaogu/.config/nvim/lua/plugins/ruff.toml",
                    },
                },
            },
        },
    },
}
