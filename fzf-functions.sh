
# open files in the default editor
fe() {
    local files
    IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# preview files using bat
fzfp() {
    fzf -m --preview 'bat --style=numbers --color=always {} | head -500'
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
