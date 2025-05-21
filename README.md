# dotfiles

## Requirements

-   Git
-   [GNU stow](https://www.gnu.org/software/stow/manual/stow.html)

## Install

Simply clone the repo in your $HOME directory and run `stow` to create symlinks.

```
git clone --depth=1 https://github.com/Maks0u/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow .
```

It is possible to "force" stow on existing config files using the `adopt` flag.  
Make sure there is no uncommited changes you want to keep as it will override repo files with existing config files.

```
stow --adopt .
```

You can "dry-run" stow using

```
stow --simulate --verbose .
```

Ignore files and directories using [.stow-local-ignore](./.stow-local-ignore)

For full manual see: https://www.gnu.org/software/stow/manual/stow.html

## Inspirations

-   [Stow has forever changed the way I manage my dotfiles (YouTube)](https://www.youtube.com/watch?v=y6XCebnB9gs)
-   [StephenGunn/dotfiles](https://github.com/StephenGunn/dotfiles)
