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

- [Ranger](https://github.com/ranger/ranger) for file management

- [lazygit](https://github.com/jesseduffield/lazygit) to give some GUI to git commands

- [karabiner elements](https://karabiner-elements.pqrs.org/) to map capslock to control and some other stuff

## Dependencies

0. Install brew: https://brew.sh/
0. Install fish: `brew install fish`
0. Install omf: https://github.com/oh-my-fish/oh-my-fish and `omf install z nvm` (also install nvm itslef https://github.com/nvm-sh/nvm#install--update-script)
2. Brew packages:
    - `brew install fish exa fzf bat delta ripgrep neovim tmux ranger yarn htop lazygit`
3. [Tmux plugin manager](https://github.com/tmux-plugins/tpm)
4. LSP servers (used by Neovim): 
    - `yarn global add vscode-langservers-extracted`
    - `yarn global add typescript typescript-language-server eslint prettier`
    - `go install golang.org/x/tools/gopls@latest`
    - `https://jdhao.github.io/2021/08/12/nvim_sumneko_lua_conf/`
    - `brew install rust-analyzer`
5. [nvm](https://github.com/nvm-sh/nvm)

### Markdown Preview Dependencies
1. `brew install pandoc`
2. `npm i -g live-server`

