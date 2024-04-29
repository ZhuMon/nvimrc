return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Neodev, a plugin for development
  use 'folke/neodev.nvim'

  -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp-status.nvim'

  -- Completion
  use 'hrsh7th/nvim-cmp' -- completion
  use 'hrsh7th/cmp-nvim-lsp' -- completion for LSP
  use 'hrsh7th/cmp-nvim-lua' -- completion for lua
  use 'hrsh7th/cmp-nvim-lsp-signature-help' -- signature help
  use 'hrsh7th/cmp-buffer' -- completion for buffers
  use 'hrsh7th/cmp-path' -- completion for paths
  use 'hrsh7th/nvim-insx' -- auto close brackets
  use 'onsails/lspkind-nvim' -- icons for completion

  -- Nvimtree for file exploring
  use {'nvim-tree/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}

  -- DAP for debugging
  use 'mfussenegger/nvim-dap'
  use {'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio'}}

  -- Linter
  use 'mfussenegger/nvim-lint'

  -- Formatter
  use 'mhartington/formatter.nvim'

  -- Styling
  use 'Mofiqul/dracula.nvim'

  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({with_sync = true})
      ts_update()
    end
  }

  -- TODOHighlight
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    opts = {highlight = {before = '', keyword = 'TODO', after = ''}}
  }

  -- Telescope for fuzzy finding
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}

  -- Status bar
  use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}

  -- Commenter
  use 'numToStr/Comment.nvim'

  -- Go
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua' -- recommended if need floating window support

  -- Copilot
  use {"zbirenbaum/copilot.lua"}

  -- Helm
  use 'towolf/vim-helm'

end)
