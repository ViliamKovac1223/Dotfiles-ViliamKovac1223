-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local packer = require('packer')

packer.init({
    max_jobs = 16,
    -- max_jobs = nil
})

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- packer
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('ntk148v/vim-horizon')

    -- LSP zero
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

    -- Java live server
    use 'mfussenegger/nvim-jdtls'

    -- Auto-pair brackets, quotes, ....
    use('tmsvg/pear-tree')
    -- Auto comments
    use('numToStr/Comment.nvim')

    -- Nvim-dap (debugger)
    use 'mfussenegger/nvim-dap'
    -- Nvim-dap-ui (ui for debugger)
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    -- Fzf
    use ('junegunn/fzf', { run =  'fzf#install()' })
    -- use '/usr/bin/fzf' -- local install of fzf
    use 'junegunn/fzf.vim'
    -- Replace phrase in all files
    -- Rg 'phrase' -g '*.py'
    -- Press "alt a" to select all buffers to quickfix window
    -- :cfdo %s/phrase/new_phrase/gc | update
    -- Update write changes to files
    -- -g '*.py'  - limit to *.py files
    -- g - global
    -- c - ask before every replacement

    -- Vim-grepper
    use 'mhinz/vim-grepper'

    -- Tabline
    -- https://github.com/akinsho/bufferline.nvim
    -- use {'akinsho/bufferline.nvim', tag = "v3.*"}
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

    -- Which-key
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- Your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- vifm
    use 'vifm/vifm.vim'

    -- Dashboard
    use {
        'glepnir/dashboard-nvim',
        -- event = 'VimEnter',
        -- config = function()
        --     require('dashboard').setup {
        --     }
        -- end,
        requires = {'nvim-tree/nvim-web-devicons'}
    }

    -- Color schemes
    use 'RRethy/nvim-base16'

    -- Highlights todo/fixme/... words
    use  {
        "folke/todo-comments.nvim",
        requires = { "nvim-lua/plenary.nvim" }
    }

    -- Vim color
    use 'norcalli/nvim-colorizer.lua'

    -- Vimwiki
    -- use 'vimwiki/vimwiki'

    -- Mind (neovim notes)
    use {
        'phaazon/mind.nvim',
        branch = 'v2.2',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require'mind'.setup()
        end
    }

    -- Nvim-tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

end)

