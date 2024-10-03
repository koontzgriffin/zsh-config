#################
## on start up ##
#################
cd ~/dev

##############
## nvm stuff ##
##############

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

############
## Prompt ##
############

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo ' ['$branch']'
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst

MACNAME='macbook'

PS1='%F{cyan}%n@$MACNAME%f ' # current user
PS1+='%F{42}~/%1~%f' # directory
# git branch
PS1+='%F{184}$(git_branch_name)%f'
PS1+='%B > %b' # command deliminator
# right side prompt
RPROMPT='%F{245}%D @ %T%f'


#############
## aliases ##
#############

alias fd='cd "$(find * -maxdepth 2 -type d | fzf)"' # find and go to a directory (max search depth is 2)
alias la='ls -aF'
alias c='clear' 
alias fcp='/Users/griffinkoontz/dev/scripts/fuzzy_cp.zsh'
