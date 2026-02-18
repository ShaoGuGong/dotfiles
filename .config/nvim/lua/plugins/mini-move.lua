return {
    {
        "nvim-mini/mini.move",
        event = "VeryLazy",
        opts = {
            mappings = {
                -- 修改 Normal 模式下的快捷鍵
                left = "<C-M-h>",
                right = "<C-M-l>",
                down = "<C-M-j>",
                up = "<C-M-k>",

                -- 修改 Visual 模式下的快捷鍵
                line_left = "<C-M-H>",
                line_right = "<C-M-L>",
                line_down = "<C-M-J>",
                line_up = "<C-M-K>",
            },
        },
    },
}
