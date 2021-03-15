#!/binbash

# open files in the default editor
fe() {
    local files
    IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# preview files using bat
# find python files with search string import and edit selected files
# vim $(rg -l -g '*.py' import | fzfp)
fzfp() {
    fzf -m --preview 'bat --style=numbers --color=always {} | head -500'
}

# find in file using ripgrep
# find files with search string import and edit selected files
# vim $(fif 'import')
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --multi --select-1 --exit-0 --preview "rg --ignore-case --pretty --context 10 '$1' {}"
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

# search for recently changed files
# search files changed within the last 2 days
# vim $(fd_changed 2days | fzfp)
fd_changed() {
    if [ ! "$#" -gt 0 ]; then echo "Usage: fd_changed today or 2days or '2020-05-01 00:00:00')"; return 1; fi
    fd --type file --changed-within "$1"
}

# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}


alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | delta'"

# fshow_preview - git commit browser with previews
fshow_preview() {
    glNoGraph |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview="$_viewGitLogLine" \
                --header "enter to view" \
                --bind "enter:execute:$_viewGitLogLine | less -R"
}


# gmodified - git modified files preview
gmodified() {
  git ls-files -m "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --no-multi \
      --preview='git diff {} | delta | less -R'
}

# guntracked - git untracked files preview
guntracked() {
  git ls-files --others --exclude-standard "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --no-multi \
      --preview='bat --style=plain --color=always {} | head -500'
}
