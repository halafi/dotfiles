vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use({ "wbthomason/packer.nvim", opt = true })
  -- impatient.nvim has to be loaded before anything else,
  -- it's also required in init.lua
  use('lewis6991/impatient.nvim')

  local config = function(name)
      return string.format("require('plugins.%s')", name)
  end

  local use_with_config = function(path, name)
      use({ path, config = config(name) })
  end

  -- themes (sorted by contrast)
  use({
    "dracula/vim", -- high contrast
    "halafi/chuek.nvim",
    "folke/tokyonight.nvim"
  })
  use("mhinz/vim-startify")
  -- basic
  use("tpope/vim-surround")
  use("tpope/vim-repeat")
  use("tpope/vim-obsession")
  use_with_config("numToStr/Comment.nvim", "comment")
  -- required by few libs
  use("nvim-lua/plenary.nvim")
  -- editorconfig
  use("tpope/vim-sleuth")
  use("editorconfig/editorconfig-vim")
  -- git
  use_with_config("tpope/vim-fugitive", "fugitive")
  use_with_config("lewis6991/gitsigns.nvim", "gitsigns")
  -- file management
  use_with_config("francoiscabrol/ranger.vim", "ranger")
  use("rbgrouleff/bclose.vim")

  use_with_config("ibhagwan/fzf-lua", "fzf") -- better lua version of fzf.vim
  -- status bar, tree
  use("kyazdani42/nvim-web-devicons")
  use_with_config("nvim-lualine/lualine.nvim", 'lualine')
  use_with_config("kyazdani42/nvim-tree.lua", 'nvim-tree')

  -- lsp + autocmoplete
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/nvim-cmp")
  -- use("weilbith/nvim-lsp-smag") -- makes <C-]> work, not a necessity, like a gd }
  -- icons for autocomplete
  use("onsails/lspkind-nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use("jose-elias-alvarez/nvim-lsp-ts-utils")
  use_with_config("RRethy/vim-illuminate", "illuminate")
  -- snippets
  use_with_config('hrsh7th/vim-vsnip', 'vsnip')
  use('hrsh7th/cmp-vsnip')
  -- lua
  use("folke/lua-dev.nvim") -- better sumneko_lua settings
  -- json
  use("b0o/schemastore.nvim") -- simple access to json-language-server schemae

  -- treesitter
  use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = config("treesitter"),
  })
  -- text objects
  use("wellle/targets.vim")
  use("nvim-treesitter/nvim-treesitter-textobjects") -- vif, ]m
  use({
      "kana/vim-textobj-user", {
        "Julian/vim-textobj-variable-segment", -- av/iv for variable segment
        "michaeljsmith/vim-indent-object", -- ai/ii for indentation area
      },
  })

  -- tsx
  use({ "JoosepAlviste/nvim-ts-context-commentstring", ft = { "typescript", "typescriptreact", "lua" } }) -- makes jsx comments actually work
  use({ "windwp/nvim-ts-autotag", ft = { "typescript", "typescriptreact" } }) -- automatically close jsx tags

  -- registers
  use_with_config("svermeulen/vim-subversive", "subversive") -- adds substitute operator
  -- use_with_config("svermeulen/vim-cutlass", "cutlass") -- separates cut and delete operations
  use_with_config("svermeulen/vim-yoink", "yoink") -- improves paste
  use({
    "svermeulen/vim-cutlass",
    requires = {
        "svermeulen/vim-yoink",
    },
    config = config("cutlass"),
  })

  -- additional functionality
  use_with_config("ThePrimeagen/refactoring.nvim", "refactoring")
  use("ggandor/lightspeed.nvim") -- motion, use "s" "dz..." "f . fF"
  use_with_config("windwp/nvim-autopairs", "autopairs")
  use("bronson/vim-visual-star-search") -- star search your visual selection
  use_with_config("norcalli/nvim-colorizer.lua", "colorizer")
  use_with_config("andymass/vim-matchup", "matchup") -- improves %, replaces matchit
  -- use("vimwiki/vimwiki")

  -- perf
  use_with_config("nathom/filetype.nvim", "filetype") -- greatly reduces startup time

end)

