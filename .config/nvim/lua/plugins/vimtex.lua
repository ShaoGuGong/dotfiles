return {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
        -- PDF 預覽器
        vim.g.vimtex_view_method = "zathura"

        -- 編譯器選 latexmk
        vim.g.vimtex_compiler_method = "latexmk"

        -- latexmk 編譯選項（使用 XeLaTeX 編譯支援中文）
        vim.g.vimtex_compiler_latexmk = {
            backend = "jobs",
            build_dir = "build",
            callback = 1,
            continuous = 1,
            executable = "latexmk",
            options = {
                "-xelatex",
                "-file-line-error",
                "-synctex=1",
                "-interaction=nonstopmode",
            },
        }
    end,
}
