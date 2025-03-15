# VIM config

## .vimrc

[.vimrc](.vimrc)

## Updating .vimrc

```bash
mv ~/.vimrc ~/.vimrc.bak ; curl -fsSL https://raw.githubusercontent.com/Maks0u/env/refs/heads/main/vim/.vimrc --output ~/.vimrc
```

## Plugins

### AnsiEsc

Clone repo

```bash
git clone --depth=1 https://github.com/powerman/vim-plugin-AnsiEsc.git ~/.vim/pack/vendor/start/AnsiEsc
```

Open vim and generate help tags

```vim
:helptags ~/.vim/pack/vendor/start/AnsiEsc/doc
```
