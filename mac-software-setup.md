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

### hosts file on a Mac

The hosts file on a Mac is '/etc/private/hosts'

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

### Install watch to periodically run software

```
brew install watch
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

### Git utilities

#### Install tig

```shell
brew install tig
```

#### Install lazygit

```shell
brew install lazygit
```

#### Install git extras

```shell
brew install git-extras
```

### Search utilities

#### Install fd to find files

```shell
brew install fd
```

#### Install fselect to find files with SQL like queries

```
https://github.com/jhspetersson/fselect
```

```shell
brew install fselect
```

#### Install ripgrep to search within files

```shell
brew install ripgrep
```


#### Install fzf - a command line fuzzy finder

```shell
brew install fzf
```

Example command with preview

```
fzf --preview 'head -100 {}'
```

```
fzf --preview '[[ $(file --mime {}) =~ binary ]] &&
                 echo {} is a binary file ||
                 (bat --style=numbers --color=always {} ||
                  cat {}) 2> /dev/null | head -500'
```

#### Install fpp - path picker

```shell
brew install fpp
```

### Install bat to view files in color

```shell
brew install bat
```

### Code style utilities

1. Install shellcheck to check bash scripts

```
brew install shellcheck
```

### Install vifm

```shell
brew install vifm
```

### Install midnight commander (mc)

mc can view and copy files to and from remote machines over sftp (ssh)

```shell
brew install mc
```

### Install tree

```shell
brew install tree
```

### Install tmux

```shell
brew install tmux
```

### Install ncdu to view disk usage

```shell
brew install ncdu
```

### Install spectacle to arrange windows

```shell
brew install spectacle
```

### JSON

#### Install jq to filter json

```shell
brew install jq
```

#### JSON incremental debugger

```
brew install jid  # jid - json incremental debugger
```

### HTTP

```
pip install httpie  # user-friendly curl alternative
```

### Install rclone

```
brew install rclone
```

Configure using `rclone config`

    * s3
    * sftp for the datascience box using ubuntu username and ~/.ssh/id_rsa private key

### Install minio client

```
# do not install as clashes with midnight commander (mc)
# brew install minio/stable/mc
```

### Install bash-it (Mac OS Catalina 10.15 and later use zsh as default)

Follow instructions on the github page:

https://github.com/bash-it/bash-it

### Install direnv

```
brew install direnv
```

Add the following to the end of the .bashrc or .zshrc files

```
eval "$(direnv hook bash)"  # in ~/.bashrc
eval "$(direnv hook zsh)"  # in ~/.zshrc
```

### Install pastel to display colors in the terminal

```
brew install pastel
```

## Shell utilities

### Install oh-my-zsh

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install oh-my-zsh plugins by editing ~/.zshrc

```
plugins=(git autojump)
```


### Install autojump

```
brew install autojump
```

### Csv utilities

1. Install xsv to search csv files

```
brew install xsv
```

## Profile files

In .zshrc

```
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"  # in ~/.zshrc

source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
```

## Upgrade bash

The Catalina version of Mac OS sets the default shell to zsh. The version of
bash shipped with MacOS is very old - 3.2.57.

```
bash --version
```

```
https://itnext.io/upgrading-bash-on-macos-7138bd1066ba
```

## Python environment setup

### Install pipx

Setup a [Python environment][1000]

[1000]: https://sourcery.ai/blog/python-best-practices/

```
brew install pipx
pipx ensurepath
```

Add to ~/.zshrc to [enable completions][1010]

[1010]: https://stackoverflow.com/questions/3249432/can-a-bash-tab-completion-script-be-used-in-zsh

```
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
bashcompinit

eval "$(register-python-argcomplete pipx)"
```

### Install cookiecutter

```
pipx install cookiecutter
```

### Install tmuxp to manage tmux configurations

```
pipx install tmuxp
```

### Stormssh to manage ssh configurations

```
pipx install stormssh
```

### Install pipenv to manage virtual environments

```
pipx install pipenv
```

### Install httpie a user-friendly curl alternative

```
pipx install httpie
```

## Example Python project

### Setup a new Python project by running the following

```
pipenv install isort --dev
pipenv install flake8 --dev
pipenv install mypy --dev
pipenv install pytest --dev
pipenv install pytest-cov --dev
pipenv install black --pre --dev
```

## Command line software utils

Investigate these utilities

### Git utilities

1. hub - command line tool for Github

### HTTP

1. http-prompt - interactive httpie
2. wuzz - interactive tool for HTTP inspection

### Miscellaneous

1. osquery - query operating systems using SQL
2. [csvtk](https://github.com/shenwei356/csvtk) - go language csv toolkit
3. tldr - documentation and examples of utilities
4. ctags - [Universal ctags](https://github.com/universal-ctags/ctags): a maintained ctags version

## Use Mac Preview to edit photos

### Tile images

```
https://www.maketecheasier.com/join-images-vertically-horizontally-mac/
```

### Parquet tools

Command line tools to display information about a parquet file

```
# https://github.com/apache/parquet-mr/tree/master/parquet-tools
brew install parquet-tools
```

1. Display the schema

```
parquet-tools schema -d file1.parq
```

2. Display metadata

```
parquet-tools meta file1.parq
```

### Tex tools

Tools to create pdf files from Latex

```
# https://superuser.com/questions/1038612/where-do-i-get-the-pdflatex-program-for-mac
brew cask install basictex
```

1. Use pandoc to create slides

```
pandoc -t beamer autojump-slides.md -o autojump-slides.pdf
```


## Other software

Investigate

* [git-delta][https://github.com/dandavison/delta] which displays syntax colored git delta

## Links

* [Mac productivity apps][1000]

[1000]: https://medium.com/skynox/the-only-mac-apps-you-need-for-a-productive-2018-5e1d6de787b7

