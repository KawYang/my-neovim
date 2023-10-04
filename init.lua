require("plugins.plugins-setup")

require("core.options")
require("core.keymaps")


-- >>> core >>> 
require("core.plugin.bufferline")
require("core.plugin.lualine")
require("core.plugin.which-key")
require("core.plugin.toggleterm")
require("core.plugin.nvim-tree")
require("core.plugin.dashboard")
require("core.plugin.telescope")
require("core.plugin.gitsigns")
require("core.plugin.gitdiffview")
require("core.plugin.which-key")
require("core.plugin.autopairs")
require("core.plugin.noice")

-- >>> dap >>> 
require("dap.dap")
require("dap.lsp")
require("dap.java")
require("dap.cmp")
require("dap.treesitter")
require'lspconfig'.jdtls.setup{}

