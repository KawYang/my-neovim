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

    if packer_bootstrap then
        require("packer").sync()
    end
end)

