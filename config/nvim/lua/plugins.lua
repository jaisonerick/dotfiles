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

return require('lazy').setup({
  {
    -- Enable Gruvbox colorscheme
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('plugins.colorscheme')
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true, build = ':MasonUpdate' },
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
      { "folke/neodev.nvim", opts = {} },
    },
  },
  { 'folke/which-key.nvim', opts = {} },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    'ibhagwan/fzf-lua',
    opts = {
      'telescope',
      winopts = {
        split = 'horizontal belowright 20new',
        preview = {
          default = 'bat',
        }
      },
      previewers = {
        bat = {
          theme = 'gruvbox-dark'
        }
      }
    }
  },
  'christoomey/vim-tmux-navigator',-- Seamless navigation between tmux and vim
  'christoomey/vim-tmux-runner',-- Run from vim on Tmux panel
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    opts = {
      on_attach = function (bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set('n', '?', api.tree.toggle_help,                  opts('Help'))
        vim.keymap.set('n', 'x', api.node.navigate.parent_close,                  opts('Help'))
        -- your removals and mappings go here
      end,
      renderer = {
        icons = {
          show = {
            file = false,
            folder = false,
            folder_arrow = true,
            git = false,
            modified = false,
          },
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "󰆤",
            modified = "●",
            folder = {
              arrow_closed = "▸",
              arrow_open = "▾",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          }
        }
      }
    }
  }
}, {
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})


  -- use 'bling/vim-bufferline'               -- Show all buffers as if they were tabs
  -- use 'vim-scripts/BufOnly.vim'            -- Close all buffers but the current
  -- use 'scrooloose/nerdtree'                -- File navigation panel on Vim
  -- use 'majutsushi/tagbar'                  -- Vim plugin that displays tags in a window, ordered by scope
  -- use 'sickill/vim-pasta'                  -- Pasting with context indentation
  -- use 'puremourning/vimspector'            -- Vim Debugger
  --
  -- use 'lbrayner/vim-rzip'                  -- Supports Zip files (for Yarn PnP)
  --
  -- use 'pbrisbin/vim-mkdir'                 -- Vim automatically creates the non-existent directory for you.
  -- use 'tpope/vim-eunuch'                   -- Vim sugar for the UNIX shell commands that need it the most.
  -- use 'tpope/vim-repeat'                   -- Allow '.' to repeat plugin commands (like surround, unimpaired, etc)
  -- use 'tpope/vim-surround'                 -- Provides mappings to easily delete, change and add surroundings ('', etc)
  -- use 'tpope/vim-unimpaired'               -- Pairs of handy bracket mappings
  -- use 'vim-scripts/tComment'               -- Toggle comment lines for multiple languages
  -- use 'vim-test/vim-test'                  -- A Vim wrapper for running tests on different granularities.
  -- use 'tpope/vim-endwise'                  -- Adds 'end' to certain languages (like ruby, vimscript, etc)
  -- use 'tpope/vim-fugitive'                 -- Calls any arbitrary Git command from within Vim
  -- use 'tpope/vim-rhubarb'                  -- Similar to Fugitive, but for Github
  --
  -- use 'honza/vim-snippets'                 -- Vim snippets support
  --
  -- use 'christoomey/vim-system-copy'        -- System copy and paste (cp and cv)
  --
  -- use { 'neoclide/coc.nvim', branch = 'release' } -- Autocomplete for Vim
  --
  -- use 'hashivim/vim-terraform'             -- Terraform support
  --
  -- -- Ruby Bundles
  -- use 'vim-ruby/vim-ruby'                  -- Vim's runtime files for ruby support. This includes syntax highlighting,
  --                                           -- indentation, omnicompletion, and various useful tools and mappings.
  -- use 'tpope/vim-rails'                    -- Massive Rails vim plugin to work with Vim projects
  -- use 'tpope/vim-projectionist'            -- Allows :A to automatically jump between Spec and Lib when building gems
  -- use 'tpope/vim-rake'                     -- Use togehter with the above
  -- use 'tpope/vim-bundler'                  -- This is a lightweight bag of Vim goodies for Bundler
  -- use 'kana/vim-textobj-user'              -- Create your own text objects (used by vim-textobj-rubyblock)
  -- use 'nelstrom/vim-textobj-rubyblock'     -- Ruby text objects
  --
  -- use 'slim-template/vim-slim'             -- Slim Syntax Highlighting (https://github.com/slim-template/slim)
  --
  -- -- HTML/Javascript Bundles
  -- use 'mattn/emmet-vim'                    -- Expading abbreviations with Emmet
  -- use 'pangloss/vim-javascript'            -- Syntax highlighting and improved indentation for javascript
  -- use 'leafgarland/typescript-vim'         -- TypeScript syntax
  -- use 'maxmellon/vim-jsx-pretty'           -- JS and JSX syntax
  -- use { 'styled-components/vim-styled-components', branch = main } --  Package for styled components
  -- use 'jparise/vim-graphql'                -- GraphQL syntax
  -- use 'neoclide/jsonc.vim'                 -- Support for JSONC
  --
  -- use 'elixir-editors/vim-elixir'
