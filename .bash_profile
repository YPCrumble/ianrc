#export PATH=/usr/local/Cellar:$PATH
echo "start aliases"
export PATH="/usr/local/bin:$PATH" 
export PATH="/usr/local/sbin:$PATH" 
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/usr/local/opt/php55/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/bin:$PATH"

export PYTHONSTARTUP=$HOME/.pythonstartup.py

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh" &

# PATH variables for GO - see 
# https://gist.github.com/vsouza/77e6b20520d07652ed7d

export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
echo "end aliases"


# Rbenv homebrew updates
echo "rbenv"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
eval "$(rbenv init -)" &
echo "end rbenv"

echo "pyenv"
export PYENV_ROOT=/usr/local/var/pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export PYENV_VIRTUALENVWRAPPER_PREFER_PYENV="true"
pyenv virtualenvwrapper
echo "end pyenv"

# Aliases to improve usability
alias y1s="cd ~/Projects/y1/"
alias y1="cd ~/Projects/y1/sites/all/"
alias bw="cd ~/Projects/cra/bookclubz-create-react-app/"
alias ba="cd ~/Projects/bookclubz-app/"
alias ci="cd ~/Projects/carbon-inferno/"
alias dooms="cd ~/Projects/carbondoomsday/"
alias pmp="python manage.py"
alias pmpr="python manage.py runserver"
alias pmpm="python manage.py migrate"
alias dl="cd ~/Downloads/"

# fasd setup
echo "fasd setup"
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache
echo "end fasd setup"

# Aliases for fasd
alias v='f -e vim' # quick opening files with vim
alias c='fasd_cd -d'

# Bash completion for homebrew/git
echo "bash completion"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# Git branch in prompt.
echo "git branch"
export GIT_PS1_SHOWDIRTYSTATE=1
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
# color/layout customization for terminal
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\] \[\033[33;1m\]\w\[\033[m\] (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) \$ "
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\[\033[33;1m\]\W \[\033[32m\](\$(git branch 2>/dev/null | grep '^*' | colrm 1 2))\[\033[00m\] \$ "

echo "vim"
set -o vi
set editing-mode vi

# Config for tag library
# see https://github.com/aykamko/tag
alias tag="$GOPATH/src/github.com/YPCrumble/tag/release/tag"
if hash ag 2>/dev/null; then
  tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null; }
  alias ag=tag
fi

function dj_secret_key {
    #!/bin/bash
    python -c "from django.utils.crypto import get_random_string; chars = 'abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*(-_=+)'; print(get_random_string(50, chars))"
}
PHP_AUTOCONF="/usr/local/bin/autoconf"

eval "$(thefuck --alias)"

function agd {
  #!/bin/bash
  ag -l "$1" | xargs sed -i '' -e "/$1/d";
}
function ags {
  #!/bin/bash
  ag -l "$1" | xargs sed -i '' -e "s/$1/$2/g";
}

echo "iterm shell integration"
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# React-native
export EDITOR=vim

#export LDFLAGS="-L/usr/local/opt/readline/lib"
#export CPPFLAGS="-I/usr/local/opt/readline/include"

# Fixes for openssl to work with pip per `brew info openssl`
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

wait
