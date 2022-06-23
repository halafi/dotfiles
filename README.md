# dotfiles

My dotfiles for Neovim, tmux, fish and everything configurable.
Setup for web development (React with TypeScript), Go, Lua and Rust on macOS Monterey.
Managed with [Dotbot](https://github.com/anishathalye/dotbot).

## Terminal

I am using [iTerm2](https://github.com/gnachman/iTerm2) for macOS.

- [Fish](https://github.com/fish-shell/fish-shell) 🐟 with [ohmyfish](https://github.com/oh-my-fish/oh-my-fish)

- Neovim on its [master branch](https://github.com/neovim/neovim/commits/master)
  
- Neovim LSP client with several LSP servers installed

- [tmux](https://github.com/tmux/tmux) (no session management at the moment)

- [Ranger](https://github.com/ranger/ranger) for file management, occasionally [Broot](https://github.com/Canop/broot) if I need it

- [lazygit](https://github.com/jesseduffield/lazygit) to give some GUI to git commands

- [karabiner elements](https://karabiner-elements.pqrs.org/) for keyboard tweaks

## Dependencies

### System

1. Install [brew](https://brew.sh/)
2. Install fish: `brew install fish`
3. Install [omf](https://github.com/oh-my-fish/oh-my-fish) and `omf install z`
4. [config] Map Tab to Control in Keyboard preferences

### Dotfiles

1. Install packer: https://github.com/wbthomason/packer.nvim#quickstart
2. Install [FiraCode font patched with icons](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Retina/complete/Fira%20Code%20Retina%20Nerd%20Font%20Complete.ttf)
3. Install [Go](https://go.dev/doc/install)
4. Brew packages:
    - `brew install asdf fish exa fzf bat git-delta ripgrep neovim tmux ranger yarn htop lazygit`
5. [Tmux plugin manager](https://github.com/tmux-plugins/tpm)
6. LSP servers (used by Neovim): 
    - `yarn global add vscode-langservers-extracted`
    - `yarn global add typescript typescript-language-server eslint prettier`
    - `go install golang.org/x/tools/gopls@latest`
    - `https://jdhao.github.io/2021/08/12/nvim_sumneko_lua_conf/`
    - `brew install rust-analyzer`

### Markdown Preview Dependencies
1. `brew install pandoc`
2. `npm i -g live-server`

### Rust / Cargo
1. https://doc.rust-lang.org/cargo/getting-started/installation.html

### Elixir + LSP
1. `brew install elixir`
2. https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elixirls

### Python + LSP
1. `yarn global add pyright`
