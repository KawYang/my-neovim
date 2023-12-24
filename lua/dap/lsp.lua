require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    -- 确保安装，根据需要填写
    ensure_installed = {
        "jdtls",
        "lua_ls"
    },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspsaga').setup({
    -- add any options here, or leave empty to use the default settings
})

require("neodev").setup({
    -- add any options here, or leave empty to use the default settings
})
require("lspconfig").lua_ls.setup {
    capabilities = capabilities,
}

local keymap = vim.keymap
-- option - B
keymap.set('n', '∫', ':Lspsaga finder<CR>')
keymap.set('n', '<M-CR>', ':Lspsaga code_action<CR>')
