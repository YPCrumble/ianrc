#export PATH=/usr/local/Cellar:$PATH
export PATH="/usr/local/bin:$PATH" 
export PATH="/usr/local/sbin:$PATH" 
export PATH="/usr/local/share/npm/bin:$PATH"
eval "$(rbenv init -)"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENV_PYTHON=/usr/local/bin/python
source /usr/local/bin/virtualenvwrapper.sh
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"
source ~/vimrc/terminus/utils/terminus-completion.bash

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# PATH variables for GO - see 
# https://gist.github.com/vsouza/77e6b20520d07652ed7d

export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Aliases to improve usability
alias youth1="cd ~/Sites/drupal/7/youth1/sites/all/"
alias youth1s="cd ~/Sites/drupal/7/youth1/"
alias y1="cd ~/.kalabox/apps/y1/code/sites/all"
alias y1s="cd ~/.kalabox/apps/y1/code"
alias pmp="python manage.py"

# fasd setup
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# Aliases for fasd
alias v='f -e vim' # quick opening files with vim
alias c='fasd_cd -d'

# Bash completion for homebrew/git
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# Git branch in prompt.
export GIT_PS1_SHOWDIRTYSTATE=1
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

set -o vi

# startbitbucket - creates remote bitbucket repo and adds it as git remote to cwd
function startbitbucket {
    #!/bin/bash
		if [ $BITBUCKET_USER ];
		then
		  username=$BITBUCKET_USER
    else
      echo 'Username?'
      read username
    fi

    if [ $BITBUCKET_PASS ]
    then
      password=$BITBUCKET_PASS
    else
      echo 'Password?'
      read -s password  # -s flag hides password text
    fi
    echo 'Repo name?'
    read reponame

    curl --user $username:$password https://api.bitbucket.org/1.0/repositories/ --data name=$reponame --data is_private='true'
    git remote add origin git@bitbucket.org:$username/$reponame.git
    git push -u origin --all
    git push -u origin --tags
}

# Config for tag library
# see https://github.com/aykamko/tag
if hash ag 2>/dev/null; then
  tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null; }
  alias ag=tag
fi

function dj_secret_key {
    #!/bin/bash
    python -c "from django.utils.crypto import get_random_string; chars = 'abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*(-_=+)'; print get_random_string(50, chars)"
}
PHP_AUTOCONF="/usr/local/bin/autoconf"
source ~/.bash_aliases

eval "$(thefuck --alias)"

# pyenv setup
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
