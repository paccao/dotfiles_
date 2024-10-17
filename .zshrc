# Profile bottlenecks
#zmodload zsh/zprof

export PATH="/c/Program Files/Git/usr/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=( 
    git
#		gh
		zsh-syntax-highlighting
#    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

source ~/.bash_aliases.zsh

