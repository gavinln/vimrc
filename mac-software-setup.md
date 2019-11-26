# Setup Mac software

## Preferences

In "System Preferences"

* In the "General" section check "Close windows when quitting an app"

### Keyboard section

* Increase "Key Repeat" to fast
* Change "Delay Until Repeat" to short
* Set "Touch Bar shows" to "F1, F2, etc. Keys"

### Mouse section

* Uncheck "Scroll direction: Natural"

## Command line software utils

### Git utilities

1. git-extras - useful scripts for git
2. lazygit - user-friendly git terminal UI
3. tig - git terminal UI
4. hub - command line tool for Github

### Searching

1. fd - to search files
2. ripgrep - similar to grep

### JSON

1. jq - command line json processor
2. jid - json incremental debugger

### HTTP

1. httpie - user-friendly curl alternative
2. http-prompt - interactive httpie
3. wuzz - interactive tool for HTTP inspection

### Miscellaneous

1. osquery - query operating systems using SQL
2. pandoc - convert documents from one format to another
3. bat - cat with color formatting
4. xsv - command line CSV toolkit
5. [csvtk](https://github.com/shenwei356/csvtk) - go language csv toolkit
6. exa - modern version of ls
7. tldr - documentation and examples of utilities
8. ctags - [Universal ctags](https://github.com/universal-ctags/ctags): a maintained ctags version

## Secrets server

[Vault](https://www.vaultproject.io/) from Hashicorp is a secrets server.

## Use Mac Preview to edit photos

### Tile images

https://www.maketecheasier.com/join-images-vertically-horizontally-mac/

## Software setup

### Setup macvim

```shell
brew install macvim
```

### Setup pyqt5 of jupyter qtconsole

```shell
brew install pyqt5
```

### Setup iterm2

```shell
brew cask install iterm2
```

### Install ripgrep to search within files

```shell
brew install ripgrep
```

### Install exa - a modern version of ls (can also display trees and git status)

```shell
brew install exa
```

#### Usage

1. Display long directory listing

```shell
exa -l
```

2. Display directory tree

```shell
exa -T
```

3. Display git status

```shell
exa -l --git
```

#### Aliases

```
alias lt='exa -T'  # list tree
alias lg='exa -l --git'  # list git status
```

### Install pandoc

```shell
brew install pandoc
```

1. Convert markdown to docx format

```shell
pandoc input.md -o output.docx
```

### Install firefox

```shell
brew cask install firefox
```

### Install tig

```shell
brew install tig
```

### Install lazygit

```shell
brew install lazygit
```

### Install git extras

```shell
brew install git-extras
```

### Install fd to find files

```shell
brew install fd
```

### Install bat to view files in color

```shell
brew install bat
```

### Install vifm

```shell
brew install vifm
```

### Install tree

```shell
brew install tree
```

### Install fzf - a command line fuzzy finder

```shell
brew install fzf
```

### Install tmux

```shell
brew install tmux
```

### Install ncdu to view disk usage

```shell
brew install ncdu
```

### Install tmuxp to manage tmux configurations

```shell
pip install tmuxp
```

### Install bash-it

Follow instructions on the github page:

https://github.com/bash-it/bash-it

### Install jq to filter json

```shell
brew install jq
```

### Install spectacle to arrange windows

```shell
brew install spectacle
```

### Install rclone to sync files to and from remote systems

```
brew install rclone
```

## Python software setup

### Install pipenv

```
pip install pipenv
```

## Links

* [Mac productivity apps][1000]

[1000]: https://medium.com/skynox/the-only-mac-apps-you-need-for-a-productive-2018-5e1d6de787b7
