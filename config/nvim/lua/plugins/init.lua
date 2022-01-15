vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use({ "wbthomason/packer.nvim", opt = true })

  local config = function(name)
      return string.format("require('plugins.%s')", name)
  end

  local use_with_config = function(path, name)
      use({ path, config = config(name) })
  end

  -- themes (sorted by contrast)
  use({
    "dracula/vim", -- high contrast
    "bluz71/vim-nightfly-guicolors",
    "rafamadriz/neon"
  })
  use("mhinz/vim-startify")
  -- basic
  use("tpope/vim-surround")
  use("tpope/vim-repeat")
  use("tpope/vim-obsession")
  use("tpope/vim-commentary")
  -- required by few libs
  use("nvim-lua/plenary.nvim")
  -- editorconfig
  use("tpope/vim-sleuth")
  use("editorconfig/editorconfig-vim")
  -- git
  use_with_config("lewis6991/gitsigns.nvim", "gitsigns")
  -- file management
  use_with_config("francoiscabrol/ranger.vim", "ranger")
  use("rbgrouleff/bclose.vim")

  use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use { 'junegunn/fzf.vim' }
  -- status bar, tree
  use("kyazdani42/nvim-web-devicons")
  use_with_config("nvim-lualine/lualine.nvim", 'lualine')
  use_with_config("kyazdani42/nvim-tree.lua", 'nvim-tree')

  -- lsp + autocmoplete
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/nvim-cmp")
  use("weilbith/nvim-lsp-smag") -- makes <C-]> work, not a necessity, like a gd }
  -- icons for autocomplete
  use("onsails/lspkind-nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use("jose-elias-alvarez/nvim-lsp-ts-utils")
  -- snippets
  use("SirVer/ultisnips")
  use("quangnguyen30192/cmp-nvim-ultisnips")
  -- json
  use("b0o/schemastore.nvim") -- simple access to json-language-server schemae

  -- treesitter
  use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = config("treesitter"),
  })
  -- text objects
  use("wellle/targets.vim") -- disabled for now
  use({
      'RRethy/nvim-treesitter-textsubjects',
      ft = { "lua", "typescript", "typescriptreact" },
  })

  -- tsx
  use({ "JoosepAlviste/nvim-ts-context-commentstring", ft = { "typescript", "typescriptreact" } }) -- makes jsx comments actually work
  use({ "windwp/nvim-ts-autotag", ft = { "typescript", "typescriptreact" } }) -- automatically close jsx tags

  -- additional functionality
  use_with_config("windwp/nvim-autopairs", "autopairs")
  use("bronson/vim-visual-star-search") -- star search your visual selection
  use_with_config("norcalli/nvim-colorizer.lua", "colorizer")
  use_with_config("andymass/vim-matchup", "matchup") -- improves %, replaces matchit
  use("vimwiki/vimwiki")

  -- perf
  use_with_config("nathom/filetype.nvim", "filetype") -- greatly reduces startup time
end)

