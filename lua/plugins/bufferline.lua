vim.opt.termguicolors = true

require("bufferline").setup {
    options = {
        -- mode = "table",
        themable = true,
        -- numbers = "buffer_id",
        color_icons = true,
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        -- 左侧让出 nvim-tree 的位置
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }},
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = "",
        -- 悬停展示
        -- hover = {
        --         enabled = true,
        --         delay = 200,
        --         reveal = {'close'}
        --     }, 

        -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' } 标签类型
        separator_style = "slant",
        indicator = {
                style = 'underline', -- | 'underline' ,
            },
    }
}
