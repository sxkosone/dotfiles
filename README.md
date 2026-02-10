# dotfiles

My macOS zsh and Neovim configuration.

## What's in here

- [Pure](https://github.com/sindresorhus/pure) prompt with a custom `♥` symbol and timestamp
- [fzf](https://github.com/junegunn/fzf) fuzzy finder with [ripgrep](https://github.com/BurntSushi/ripgrep) and [bat](https://github.com/sharkdp/bat) preview
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [Neovim](https://neovim.io/) with [LazyVim](https://www.lazyvim.org/)
- Git aliases
- Node.js via nvm, Go 1.23, Docker

## Setup

```bash
git clone git@github.com:sxkosone/dotfiles.git ~/dotfiles

# Symlink configs to where they're expected
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/nvim ~/.config/nvim
```

### Dependencies (Homebrew)

```bash
brew install neovim fzf ripgrep bat pure zsh-syntax-highlighting zsh-completions

```

Neovim plugins will install automatically on first launch via [lazy.nvim](https://github.com/folke/lazy.nvim).

### Additional

`brew install the_silver_searcher`

## Git aliases

| Alias      | Command                       |
| ---------- | ----------------------------- |
| `gk`       | `git checkout`                |
| `gaa`      | `git add .`                   |
| `gc`       | `git commit`                  |
| `gb`       | `git branch`                  |
| `gpf`      | `git push --force-with-lease` |
| `gmm`      | `git merge origin/master`     |
| `gp`       | `gh pr list -a@me`            |
| `uncommit` | `git reset --soft HEAD~1`     |
