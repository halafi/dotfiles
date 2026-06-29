# dotfiles

Personal macOS dotfiles for a simple web-development setup: Fish, tmux, Git,
Bat, Karabiner/Goku, VSCode, iTerm2, and a small set of CLI tools.

Dotfiles are linked with [Dotbot](https://github.com/anishathalye/dotbot).
Packages and apps are declared in [Brewfile](Brewfile).

## Setup

1. Install Apple's command line tools:

   ```sh
   xcode-select --install
   ```

2. Install [Homebrew](https://brew.sh/).

3. Install packages, apps, and fonts from the Brewfile:

   ```sh
   brew bundle
   ```

4. Link dotfiles:

   ```sh
   ./install
   ```

5. Change the default shell to Fish if needed:

   ```sh
   echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
   chsh -s /opt/homebrew/bin/fish
   ```

## Manual Steps

### Git and SSH

Generate an SSH key and add it to GitHub:

https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

Git commit signing is enabled in `home/gitconfig`. On a new machine, install or
import the GPG key before relying on signed commits.

### Fish

Fish universal variables are intentionally not tracked. Keep portable shell
settings in `config/fish/config.fish` or `config/fish/conf.d/*.fish`.

Oh My Fish is optional. If installed, `config/fish/conf.d/omf.fish` loads it.

### tmux

Install tmux plugins after the dotfiles are linked:

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then open tmux and press `prefix` + `I` to install plugins.

### Keyboard

Karabiner Elements and Goku are installed by the Brewfile.

1. Open Karabiner Elements once and allow the required macOS permissions.
2. Make sure the active Karabiner profile is named `Default`.
3. Run:

   ```sh
   goku
   ```

### Language Runtimes

The repo keeps a global `.tool-versions` file for asdf. Install only the
language plugins you currently need, for example:

```sh
asdf plugin add nodejs
asdf install
```

Rust, Go, Python, and Elixir setup can stay project-specific unless needed
globally.

## Notes

- `vscode/` and `iterm2/` are configuration backups, not currently linked by
  Dotbot.
- `config/fish/fish_variables` and Fish migration files are ignored because
  they are local/generated state.
- Run `brew bundle check --verbose` to see which Brewfile entries are missing
  or outdated on the current Mac.
