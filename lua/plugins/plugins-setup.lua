-- 自动安装packer
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- 保存此文件自动更新安装软件
-- 注意PackerCompile改成了PackerSync
-- plugins.lua改成了plugins-setup.lua，适应本地文件名字
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

return require("packer").startup(function(use)
    -- packe 插件
    use 'wbthomason/packer.nvim'

    -- >>> core >>>
    -- 主题插件 状态来
    use 'folke/tokyonight.nvim'
    -- 图标
    use 'nvim-tree/nvim-web-devicons'
    -- 状态栏
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }

    -- 欢迎页
    use {
        'glepnir/dashboard-nvim',
        requires = {'nvim-tree/nvim-web-devicons'}
    }

    -- buffer分割线
    use 'akinsho/bufferline.nvim'


    -- 目录树
    use {
        'nvim-tree/nvim-tree.lua',
        lazy = true,
        requires = {'nvim-tree/nvim-web-devicons'}
    }

    -- 文件检索
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        requires = {'nvim-lua/plenary.nvim'}
    }
    use 'nvim-telescope/telescope-live-grep-args.nvim'
    use {'nvim-telescope/telescope-ui-select.nvim'}
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }

    -- git 相关
    use 'lewis6991/gitsigns.nvim'
    use 'sindrets/diffview.nvim'

    -- which key
    use 'folke/which-key.nvim'

    -- hope
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup {
                keys = 'etovxqpdygfblzhckisuran'
            }
        end
    }

    -- 终端插件
    use 'akinsho/toggleterm.nvim'



    -- >>> dap >>>
    -- mason
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig'
    -- dap 
    use 'mfussenegger/nvim-jdtls'
    use 'rcarriga/cmp-dap'
    use 'theHamsta/nvim-dap-virtual-text'

    use {
        'mfussenegger/nvim-dap',
        branch = "master"
    }

    use {
        'rcarriga/nvim-dap-ui',
        requires = {"mfussenegger/nvim-dap"} ,
    }

    -- 代码提示
    use 'hrsh7th/nvim-cmp'
    -- ??
    use 'hrsh7th/cmp-nvim-lsp'
    use 'neovim/nvim-lspconfig'
    -- ??
    use 'L3MON4D3/LuaSnip'
    -- ??
    use 'saadparwaiz1/cmp_luasnip'
    -- ?
    use 'rafamadriz/friendly-snippets'
    -- 路径
    use 'hrsh7th/cmp-path'

    if packer_bootstrap then
        require("packer").sync()
    end
end)

