# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#

# zsh settings

# zsh management
alias rez='. ~/.zshrc'
alias editzsh='vim ~/.oh-my-zsh/custom/personal.zsh'
alias t='echo -ne "\e]1;"$(basename $PWD)"\a"'
alias c='cd "$PWD$@" && title'

# directories

# fzf
alias branchf='git co $(git branch | fzf)'
alias logf='git log --oneline | fzf'
alias prof='cd ~/projects/$(ls ~/projects | fzf)'
alias perf='cd ~/personal/$(ls ~/personal | fzf)'

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# git email management
alias workemail='git config --global user.email "matthew.elphick@clock.co.uk"'
alias personalemail='git config --global user.email "matt.a.elphy@gmail.com"'

# git shortcuts
alias s='git status -sb'
alias diff='git dsf'
alias gitmaster='git log ..master'
alias githistory='git reflog'
alias gitrank='git shortlog -sn'

# github shortcuts (npm install -g gh)
alias ghpr='nave use 6.10.0 gh pr -B $(git rev-parse --abbrev-ref HEAD)'

# application shortcuts
alias killsub='ps aux | grep "Sublime Text" | awk "{ print $(2) }" | xargs kill'

# folder shortcuts
alias pro='cd ~/projects'
alias per='cd ~/personal'

# website shortcuts

# dev shortcuts
alias mo='mocha'
alias ist='istanbul cover node_modules/.bin/_mocha'

# mac settings
alias historylist="history | awk '{print $2}' | awk 'BEGIN {FS=\"|\"} {print $1}'|sort|uniq -c|sort -r"

alias mongoclean='mongo --eval "db.getMongo().getDBNames().forEach(function(database) { print(database); if (/^test/.test(database)) { print('\''Dropping database: '\'' + database); db.getMongo().getDB(database).dropDatabase(); } });"'
alias flushmem='echo "flush_all" | nc localhost 11211'

# npm
alias publicnpm='npm config set registry http://registry.npmjs.org ; echo "Using registry http://registry.npmjs.org"'
alias ni='npm install --save'
alias updatenave='sudo sh -c "curl -fsSL https://raw.github.com/isaacs/nave/master/nave.sh > /usr/local/bin/nave && chmod ugo+x /usr/local/bin/nave"'

# reminders
alias remindme='echo "Nothing"'

# tmux
alias tmuxto='tmux attach -t'
alias remux='tmux source-file ~/.tmux.conf'

# git
alias gcmp='npm run lint && npm run test && git push'

