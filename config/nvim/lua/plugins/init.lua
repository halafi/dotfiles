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
    -- "dracula/vim", -- high contrast
    -- "folke/tokyonight.nvim",
    "Mofiqul/vscode.nvim"
  })
  use({
    "nvimdev/lspsaga.nvim",
    after = "nvim-lspconfig",
    config = config("lspsaga"),
    requires = {
        {"nvim-tree/nvim-web-devicons"},
        --Please make sure you install markdown and markdown_inline parser
        {"nvim-treesitter/nvim-treesitter"}
    }
  })

  -- use_with_config("folke/which-key.nvim", 'which-key')
  -- basic
  use("tpope/vim-surround")
  use("tpope/vim-unimpaired")
  use("tpope/vim-repeat")
  use("tpope/vim-obsession")
  use_with_config("numToStr/Comment.nvim", "comment")
  -- required by few libs
  use("nvim-lua/plenary.nvim")
  -- editorconfig
  use("tpope/vim-sleuth")
  use("editorconfig/editorconfig-vim")
  -- git
  -- use_with_config("tpope/vim-fugitive", "fugitive")
  use({
    "tpope/vim-fugitive",
    requires = { "tpope/vim-rhubarb", "junegunn/gv.vim" },
    config = config("fugitive"),
  })
  use_with_config("lewis6991/gitsigns.nvim", "gitsigns")
  use('rhysd/conflict-marker.vim')
  -- file management
  use("rbgrouleff/bclose.vim") -- not sure if needed

  -- use_with_config("ibhagwan/fzf-lua", "fzf") -- better lua version of fzf.vim
  use({
        "nvim-telescope/telescope.nvim", -- fuzzy finder
        config = config("telescope"),
        requires = {
            {
                "nvim-telescope/telescope-fzf-native.nvim", -- better algorithm
                run = "make",
            },
        },
    })
  use('nvim-telescope/telescope-ui-select.nvim')
  -- status bar, tree
  use("nvim-tree/nvim-web-devicons")
  use_with_config("nvim-lualine/lualine.nvim", 'lualine')
  use_with_config("kyazdani42/nvim-tree.lua", 'nvim-tree')

  -- lsp + autocmoplete
  use("neovim/nvim-lspconfig")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  -- use("hrsh7th/cmp-copilot") -- not working well at this point
  use("hrsh7th/nvim-cmp")
  -- use("weilbith/nvim-lsp-smag") -- makes <C-]> work, not a necessity, like a gd }
  -- icons for autocomplete
  use("onsails/lspkind-nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use("jose-elias-alvarez/typescript.nvim")
  use_with_config("RRethy/vim-illuminate", "illuminate")
  -- use("github/copilot.vim")
  -- snippets
  use_with_config('hrsh7th/vim-vsnip', 'vsnip')
  use('hrsh7th/cmp-vsnip')
  -- lua
  use("folke/lua-dev.nvim") -- better sumneko_lua settings
  -- json
  use("b0o/schemastore.nvim") -- simple access to json-language-server schemae
  -- rust
  -- use {
  --   "simrat39/rust-tools.nvim",
  --   requires = { "nvim-lua/plenary.nvim", "rust-lang/rust.vim" },
  --   opt = true,
  --   module = "rust-tools",
  --   ft = { "rust" },
  --   config = function()
  --     require("plugins.rust-tools").setup()
  --   end,
  -- }

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
  -- use("ggandor/lightspeed.nvim") -- motion
  use_with_config("windwp/nvim-autopairs", "autopairs")
  use("bronson/vim-visual-star-search") -- star search your visual selection
   -- highlight color codes
  use({ "RRethy/vim-hexokinase", config = config("hexokinase"), run = "make hexokinase" })
  use_with_config("andymass/vim-matchup", "matchup") -- improves %, replaces matchit
  use_with_config("nat-418/boole.nvim", "boole")
  use_with_config('simrat39/symbols-outline.nvim', 'symbols-outline')

  use({
        "davidgranstrom/nvim-markdown-preview", -- preview markdown output in browser
        opt = true,
        ft = { "markdown" },
        cmd = "MarkdownPreview",
  })

  use('voldikss/vim-floaterm')
  use('ptzz/lf.vim', 'lf')
  use_with_config('chentoast/marks.nvim', 'marks')

end)

