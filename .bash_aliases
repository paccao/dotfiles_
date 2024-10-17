# Utils
alias ..='cd ..'
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias mv='mv -i' # Prevent overwrite with mv cmd

alias ls='ls --group-directories-first -CF --color=auto'
alias l='ls --group-directories-first -AlhF'
alias ll='ls -ltr'
alias lt='ll -t'                  	# sort by date
alias lz='ll -rS'                   # sort by size
alias ali='vim ~/.bash_aliases'
alias alis='source ~/.bash_aliases'
alias c='code'
alias todo='vim ~/Documents/TODO_LIST.md'
alias saproling='cd ~/projects/Unity\ Projects/Project\ saproling'

# search all files in system for pattern
sfiles () {
	if [ $# -eq 0 ]
		then
			printf "Missing arguments.\n
	1st: <search_dir_target_path>
	2nd: <pattern>\n
 "
			return
	fi
	
	#if [[ -z $# ]]
	#	then
	#		printf "Input was empty, try again."
	#		return
	#fi

	grep -rnw '$1' -e '$2'
}

mcd () { 																						# create directory and change working dir to that one
        [ -d $1 ] || mkdir $1
        cd $1 && pwd
}

# Git
alias g='git'
alias gp='git pull'
alias gs='git status'
alias get_default_branch="git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'"
alias gsm='git switch `get_default_branch`'
alias ga='git add .'
alias gf='git fetch'
alias gc='git commit' 
alias gbr='git branch -r'
alias gbl='git branch'
alias gcb='git rev-parse --abbrev-ref HEAD'
alias ggsmm='git pull origin $(gcb) --rebase'
alias gsmgs='CURRENT=`gcb` && gsm ; gs && g switch $CURRENT'
alias deletelocalbranch='git branch --delete'
alias gpushu='git push -u origin $(gcb)'

