[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob \!.git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_fzf_compgen_path() {
  rg --files "$1" | with-dir "$1"
}

_fzf_compgen_dir() {
  rg --files "$1" | only-dir "$1"
}

# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# pure prompt init must happen at the end of path settings
autoload -U promptinit; promptinit
prompt pure

PURE_PROMPT_SYMBOL="♥"
PROMPT='[%D{%f/%m/%y} %D{%L:%M:%S}] '$PROMPT

alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

# Khan aliases
# datastore emulator
alias dsadmin='npx dsadmin --project=khan-academy --datastore-emulator-host=localhost:8201'

# git aliases
alias gk='git checkout'
alias gaa='git add .'
alias gc='git commit'
alias gb='git branch'
alias gpf='git push --force-with-lease'
alias gmm='git merge origin/master'
alias gp='gh pr list -a@me'
alias uncommit='git reset --soft HEAD~1'

# zsh-syntax-highlighting
# must be sourced at the end of the .zshrc file
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# export PATH="/opt/homebrew/bin:/opt/homebrew/opt/node@20/bin:$PATH"
# previous PATH definition
# export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
#
#
# This line will:
# Put /opt/homebrew/bin first (for general Homebrew commands including nvim)
# Then /opt/homebrew/opt/node@20/bin (for Node.js)
# export PATH="/opt/homebrew/bin:/opt/homebrew/opt/node@20/bin:$PATH"
# Then /Applications/Docker.app/Contents/Resources/bin to add docker
export PATH="/opt/homebrew/bin:/opt/homebrew/opt/node@20/bin:/Applications/Docker.app/Contents/Resources/bin:$PATH"
export PATH="/opt/homebrew/opt/go@1.23/bin:$PATH"

# Add OpenJDK 21 to PATH for gcloud datastore emulator
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
