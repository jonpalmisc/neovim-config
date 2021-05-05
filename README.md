# Jon's Neovim Configuration

This is my (fairly basic) configuration for Neovim. I keep it on GitHub
primarily so I can sync it between computers, but if this is useful to you,
even better! I'm not the world's greatest Vim/Neovim user, so mistakes, etc.
should be expected.

## Prerequisites

The following must be installed for Neovim (and this configuration) to work:

- Node.js
- Python 3
- [fzf](https://github.com/junegunn/fzf)

## Installation

To install, start by cloning this repository into `~/.config/nvim`:

```sh
git clone https://github.com/jonpalmisc/nvim ~/.config/nvim
```

Next, start Neovim. If there are errors, they are likely due to missing
plugins. To install all plugins from inside Neovim, just run `:PlugInstall`.
