# VIM config

## .vimrc

[.vimrc](.vimrc)

## Updating .vimrc

```bash
mv ~/.vimrc ~/.vimrc.bak
curl -fsSL https://raw.githubusercontent.com/Maks0u/env/refs/heads/main/vim/.vimrc --output ~/.vimrc
```

## Plugins

### AnsiEsc

Clone repo and generate help tags

```bash
git clone --depth=1 https://github.com/powerman/vim-plugin-AnsiEsc.git ~/.vim/pack/vendor/start/AnsiEsc
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/AnsiEsc/doc" -c q
```

### vim-surround

Clone repo and generate help tags

```bash
git clone --depth=1 https://github.com/tpope/vim-surround.git ~/.vim/pack/vendor/start/vim-surround
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/vim-surround/doc" -c q
```
