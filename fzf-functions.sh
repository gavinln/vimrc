#!/binbash

# open files in the default editor
fe() {
    local files
    IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

fzfp() {
    # preview files using bat
    # find python files with search string import and edit selected files
    # vim $(rg -l -g '*.py' import | fzfp)
    fzf -m --preview 'bat --style=numbers --color=always {} | head -500'
}

# find in file using ripgrep
# find files with search string import and edit selected files
# vim $(fif 'import')
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

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# displays an fzf prompt when autojump run with no arguments
j() {
    if [[ "$#" -ne 0 ]]; then
        cd "$(autojump $@)" || exit
        return
    fi
    cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info)" 
}

# file search for recently modified files
# search files modified since last Monday and edit them
# vim $(fsm 'last monday' | fzfp)
fsm() {
    if [ ! "$#" -gt 0 ]; then echo "Usage: fsm 'last monday' or fsm 2020-05-01)"; return 1; fi
    fselect "path from . gitignore where created gte '$1' and is_file=true"
}
