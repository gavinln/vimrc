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

### Setup neovim

```shell
brew install neovim
brew install neovim-qt
```

#### Setup neovide, gui for neovim

```shell
brew install neovide
```

### Setup pyqt5 of jupyter qtconsole

```shell
brew install pyqt5
```

### Setup iterm2

```shell
brew cask install iterm2
```

#### Customize iterm2

1. Open "Session"/"Edit Session"/Keys
2. Change "^Home" to "Load Color Preset Solarized Dark"
3. Change "^End" to "Load Color Preset Solarized Light"

### Setup alacritty

```shell
brew install alacritty
```

#### Setup alacritty color scheme switcher

1. Install the Python utility

```shell
pipx install alacritty-colorscheme
```

2. Clone the color themes repo

```
git clone https://github.com/aarowill/base16-alacritty
```

3. Copy themese form the colors directory to ~/.config/alacritty/colors

4. List available themes

```
alacritty-colorscheme list
```

5. Apply theme

```
alacritty-colorscheme apply $(ls ~/.config/alacritty/colors | fzf)
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

### Install nodejs

```shell
brew install nodejs
```

### Sync utilities

```shell
brew install rsync
brew install watchexec
```

### Git utilities

#### Install tig

```shell
brew install tig
```

#### Install gitui

gitui is a terminal git client in Rust

```shell
brew install gitui
```

#### Install lazygit

```shell
brew install lazygit
```

#### Install git extras

```shell
brew install git-extras
```

#### Install git delta

[git-delta](https://github.com/dandavison/delta) displays code diff side-by-side with syntax
highlights.

```shell
brew install git-delta
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

#### Install ripgrep-all to search pdf, docx and other files with ripgrep

```shell
brew install rga
```
https://github.com/phiresky/ripgrep-all


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

#### Install git extras

```shell
brew install git-extras
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

### Install nnn file manager

```shell
brew install nnn
```

### DO NOT install midnight commander (mc)

mc can view and copy files to and from remote machines over sftp (ssh)
Unusual key combinations and works better with menus.

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

### Install just command runner

https://github.com/casey/just

```shell
brew install just
```

### Install ncdu to view disk usage

```shell
brew install ncdu
```

### Install spectacle to arrange windows

```shell
brew install spectacle
```

### Install amethyst a tiling window manager

https://ianyh.com/amethyst/

### Install a vnc viewer

```
echo https://formulae.brew.sh/cask/vnc-viewer
brew install --cask vnc-viewer
```
### Install Postgres client

```
brew install libpq
```

Find the location of the `psql` utility by searching in the root dir

```
pushd /
find /usr/local -name psql -type f
# /usr/local/Cellar/libpq/13.2/bin/psql
popd
```

Create a symlink

```
ln -s /usr/local/Cellar/libpq/13.2/bin/psql /usr/local/bin/psql
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

### Install nushell

A shell with pipelines and plugins: https://www.nushell.sh/

```
brew install nushell
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

### Install rich-cli to view Jupyter notebooks

```
pipx install rich-cli
# rich notebook.ipynb
```

## Rust setup

Install Rust and the tools using rustup

https://www.rust-lang.org/tools/install

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Add `~/.cargo/bin` to your PATH to run rust binaries

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

## SQL Workbench setup

### Install Java

1. Display the installed version of Java

```
java -version
```

2. Update homebrew

```
brew update
```

3. List tapbs

```
brew list
```

4. Add the casks tap

```
brew tap AdoptOpenJDK/openjdk
```

5. Search for versions

```
brew search jdk
```

6. Install a version

```
brew install --cask adoptopenjdk16
```

7. Chedk the Java version

```
java -version
```

### Install SQL Workbench

For SQL Workbench use the following commands

    1. WbHelp - show a list of commands
    2. WbDefineDriver - to add a new driver
    3. WbListProfiles - to list the profiles
    4. WbConnect -profile=presto - to connect using profile presto

The profiles are stored in ~/.sqlworkbench in the WbProfiles.xml file

https://stackoverflow.com/questions/52524112/how-do-i-install-java-on-mac-osx-allowing-version-switching

http://www.sql-workbench.eu/downloads.html

## Links

* [Mac productivity apps][1000]

[1000]: https://medium.com/skynox/the-only-mac-apps-you-need-for-a-productive-2018-5e1d6de787b7

* [20 tips to help you master your Mac][1010]

[1010]: https://computing.which.co.uk/hc/en-gb/articles/115002557845-20-top-tips-to-help-you-master-your-Mac

* [25 must know MacOS tips][1020]

[1020]: https://www.macrumors.com/guide/useful-mac-tips/

* [Best Mac tips and tricks][1030]

[1030]: https://www.digitaltrends.com/computing/best-mac-tips-tricks/

* [Mac tips and tricks][1040]

[1040]: https://www.cnet.com/how-to/mac-tips-and-tricks-10-things-you-didnt-know-you-could-make-your-laptop-do/



