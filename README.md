# vimrc
Vimrc file for Vim that includes useful plugins and keyboard shortcuts

## How to install the vimrc file?
Just copy the vimrc.vim file into your ~/.vimrc file on Linux or MacOS or to
your %USERPROFILE%/\_vimrc file on Windows.

## How to install the Plugins?
There are a lot of plugins, configurations and color schemes that make Vim
a lot better. To install the plugins first install
[Vundle](https://github.com/gmarik/Vundle.vim).

## Included Plugins

The following list describes the plugins.

* [vim-fugitive](https://github.com/tpope/vim-fugitive): A Git wrapper so awesome, it should be illegal
* [NERD Tree](https://github.com/scrooloose/nerdtree): A tree explorer plugin for vim
* [vim-airline](https://github.com/bling/vim-airline): Lean & mean status/tabline for vim that's light as air (replacing powerline)
* [syntastic](https://github.com/scrooloose/syntastic): Syntax checking hacks for vim
* [mru.vim](https://github.com/vim-scripts/mru.vim): Plugin to manage Most Recently Used (MRU) files.
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors): Sublime Text style multiple selections for Vim using CTRL+N.

## Included color schemes

* [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)

## Miscellaneous changes

## Using dotbot

The Python utility [dotbot](https://github.com/anishathalye/dotbot) can be used
to install dotfiles to your home directory

### Running dotbot

1. Install dotbot

```bash
pip install dotbot
```

2. Install the dotfiles using the install.conf.yaml configuration file

```bash
dotbot -c install.conf.yaml
```

## Links

[Command line tools: new vs old](https://hacker-tools.github.io/command-line/)
[Useful shell aliases](https://news.ycombinator.com/item?id=18898523)
