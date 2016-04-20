#export PATH=/usr/local/Cellar:$PATH
export PYTHONPATH=`brew --prefix`/lib/python2.7/site-packages:$PYTHONPATH
export PATH="/usr/local/bin:$PATH" 
export PATH="/usr/local/sbin:$PATH" 
export PATH="/usr/local/share/npm/bin:$PATH" # eval "$(rbenv init -)"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Aliases to improve usability
alias youth1="cd ~/Sites/drupal/7/youth1/sites/all/"
alias youth1s="cd ~/Sites/drupal/7/youth1/"
alias y1="cd ~/Sites/drupal/7/y1/sites/all/"
alias y1s="cd ~/Sites/drupal/7/y1/"
alias pmp="python manage.py"
echo "bind -v" >> ~/.editrc
echo "set editing-mode vi" >> ~/.inputrc

# Bash completion for homebrew/git
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

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
