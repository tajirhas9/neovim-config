local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        }
    },
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    "nvim-lualine/lualine.nvim",
    { "nvim-treesitter/nvim-treesitter" --, build = ":TSUpdate"
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },
    { 'akinsho/bufferline.nvim',  version = "*",     dependencies = 'nvim-tree/nvim-web-devicons' },
    -- { 'yamatsum/nvim-cursorline' },
    {
        'neoclide/coc.nvim',
        branch = 'release'
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = true
    },
    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
    },
    --######################
    -- Themes
    -- { 'projekt0n/github-nvim-theme' },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    -- { "EdenEast/nightfox.nvim",     priority = 1000, config = true, opts = {} },
    { "ellisonleao/gruvbox.nvim", priority = 1000,   config = true,                               opts = ... },
    -- {
    --     "navarasu/onedark.nvim",
    --     dependencies = {
    --         'nvim-tree/nvim-web-devicons'
    --     }
    -- },
    --#######################
    { "sindrets/diffview.nvim",   event = "VeryLazy" },
    {
        "norcalli/nvim-colorizer.lua",
        event = "VeryLazy",
    },
    {
        "kkoomen/vim-doge",
        event = "VeryLazy",
    },
    {
        "Exafunction/windsurf.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        event = "BufEnter",
    },
    {
        "github/copilot.vim",
        event = "InsertEnter",
    },

    -- Show current code context
    {
        "SmiteshP/nvim-navic",
        dependencies = {
            "neovim/nvim-lspconfig"
        }
    },
    "nvim-treesitter/nvim-treesitter-context",
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async"
        }
    }
})
