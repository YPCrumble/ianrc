#export PATH=/usr/local/Cellar:$PATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export PATH="/usr/local/bin:$PATH" 
export PATH="/usr/local/sbin:$PATH" 
export PATH="/usr/local/share/npm/bin:$PATH" # eval "$(rbenv init -)"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Additions for vim
export PATH=/usr/local/Cellar/python/2.7.10_2/bin:$PATH
export PATH=/usr/local/Cellar/git/2.6.1/bin:$PATH
alias vim=/usr/local/Cellar/vim/7.4.891/bin/vim

# Aliases to improve usability
alias youth1="cd ~/Sites/drupal/7/youth1/sites/all/"
alias youth1s="cd ~/Sites/drupal/7/youth1/"
alias pmp="python manage.py"
alias wo="workon"
echo "bind -v" >> ~/.editrc
echo "set editing-mode vi" >> ~/.inputrc

# Bash completion for homebrew/git
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

set -o vi
