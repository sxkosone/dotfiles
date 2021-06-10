autoload -U promptinit; promptinit
prompt pure

PURE_PROMPT_SYMBOL="♥"

. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit
compinit

export VISUAL="nvim"
export EDITOR=$VISUAL

export NODEJS_CHECK_SIGNATURES=no

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

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

# Rails alias
alias migrate="bundle exec rails db:migrate db:rollback && bundle exec rails db:migrate db:test:prepare"
alias schema_fixup="rails db:drop db:create db:schema:load && rails db:migrate"
alias total_seed="rails db:drop db:create db:schema:load && rails db:seed"

# Git aliases
alias gp="git pull"
alias gk="git checkout"
alias gkb="git checkout -b"
alias gaa="git add ."
alias gs="git status"
alias gb="git branch -vv"
alias gd="git diff"
alias grm="git rebase -i origin/trunk"
alias gpf="git push --force-with-lease"
alias gbd="git branch -d"
alias uncommit="git reset --soft HEAD^"
alias empty="git commit --allow-empty -m '[rebuild]'"
alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias push_new="git push --set-upstream origin"
alias yarn_install="curl --compressed -o- -L https://yarnpkg.com/install.sh | bash"

# zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
