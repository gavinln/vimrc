# nix package manager

## Install Nix on MacOS

1. Install Nix
curl https://nixos.org/nix/install | sh

## Test a nix package without installing it

1. Find the system  pandoc

    ```
    which pandoc
    ```

2. Try pandoc without installing it

    ```
    nix-shell -p pandoc --run 'which pandoc'
    ```

3. Switch back to the system pandoc

    ```
    which pandoc
    ```

4. Try pandoc without installing it and starting a new shell

    ```
    nix-shell -p pandoc
    ```

5. Display the pandoc in the new shell

    ```
    which pandoc
    ```

6. Exit the new shell

    ```
    exit
    ```

7. Switch back to the system pandoc

    ```
    which pandoc
    ```

8. Clean up the space used

    ```
    nix-collect-garbage
    ```

## Install nix completions

1. Get help on nix-env

    ```
    nix-env --help
    ```

2. List the generations of packages

    ```
    nix-env --list-generations
    ```

3. Find an available package (-a)

    ```
    nix-env -qa 'nix-bash.*'
    ```

4. Install the nix-bash-completions package

    ```
    nix-env -i nix-bash-completions
    ```

5. List the installed packages

    ```
    nix-env -q --installed
    ```

6. Add to your .bashrc file

    ```
    export XDG_DATA_DIRS="$HOME/.nix-profile/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
    ```

7. Restart your shell. Type the following to see the completions

    ```
    nix-env -<TAB>
    ```

## Install nix packages

```
nix-env -i nix-bash-completions  # bash completions for nix

nix-env -i direnv  # directory environments

nix-env -i exa bat pandoc ripgrep fd fselect

nix-env -i vifm tmux tmuxp jq fzf

nix-env -i tig lazygit git-extras hub

nix-env -i jq jid  # JSON utilities

nix-env -i ncdu  # display disk usage

nix-env -i xsv  # csv utilities

nix-env -i ctags  # tags in source files

nix-env -i tldr  # brief documentation on usage

nix-env -i wuzz  # HTTP utilities
```

Add to ~/.bash_profile

```
export XDG_DATA_DIRS="$HOME/.nix-profile/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
```

### Packages that cannot be installed using nix

```
nix-env -i httpie http-prompt
```


## Brew install method

## Install direnv - directory environments

```
brew install direnv
```

Add the following to the end of ~/.bash_profile

```
eval "$(direnv hook bash)"
```

### Install exa - a modern version of ls (can also display trees and git status)

```shell
brew install exa
```

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

### Install bat to view files in color

```shell
brew install bat
```

### Install pandoc

```shell
brew install pandoc
```

1. Convert markdown to docx format

```shell
pandoc input.md -o output.docx
```

### Install ripgrep to search within files

```shell
brew install ripgrep
```

### Install fd to find files

```shell
brew install fd
```

### Install [fselect](https://github.com/jhspetersson/fselect) to find files with SQL like queries

```shell
brew install fselect
```

### Install vifm

```shell
brew install vifm
```

### Install tmux

```shell
brew install tmux
```

### Install tmuxp to manage tmux configurations

```shell
pip install tmuxp
```

### Install jq to filter json

```shell
brew install jq
```

### Install fzf - a command line fuzzy finder

```shell
brew install fzf
```

Example commands

```
# open files in the default editor
fe() {
    local files
    IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# preview files using bat
fzfp() {
    fzf --preview 'bat --style=numbers --color=always {} | head -500'
}

# find in file using ripgrep
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --multi --select-1 --exit-0 --preview "rg --ignore-case --pretty --context 10 '$1' {}"
}

# find in file using ripgrep and edit
fife() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  local files
  IFS=$'\n' files=($(rg --files-with-matches --no-messages "$1" | fzf --multi --select-1 --exit-0 --preview "rg --ignore-case --pretty --context 10 '$1' {}"))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# displays an fzf prompt when autojump run with no arguments
j() {
    if [[ "$#" -ne 0 ]]; then
        cd $(autojump $@)
        return
    fi
    cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info)" 
}
```

## Git utilities

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

### Install hub - command line tool for Github

```
```

## JSON utilities

1. jq - command line json processor
2. jid - json incremental debugger

### HTTP utilities

1. httpie - user-friendly curl alternative
2. http-prompt - interactive httpie
3. wuzz - interactive tool for HTTP inspection

### Miscellaneous utilities 1

1. xsv - command line CSV toolkit
2. ctags - [Universal ctags](https://github.com/universal-ctags/ctags): a maintained ctags version
3. tldr - documentation and examples of utilities

### Miscellaneous utilities 2

1. osquery - query operating systems using SQL

### Install bash-it

Follow instructions on the github page:

https://github.com/bash-it/bash-it

Bash profile additions

```
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
if [ -e /Users/gnoronha/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/gnoronha/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
source "$BASH_IT"/bash_it.sh
```
