# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/sample-bashrc.html (in the package bash-docs)

#------- Interactive Mode ----------------------------------------------------
# If not running interactively, do nothing.
case $- in
    *i*) ;;
      *) return;;
esac


#-----------------------------------------------------------------------------
# Window 
#-----------------------------------------------------------------------------

#------- X Server -----------------------------------------------------------

xhost +local:root > /dev/null 2>&1

#------- Size ----------------------------------------------------------------

# Check the window size after each command, then, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#------- Title ---------------------------------------------------------------

# Change the window title of X terminals to user@host:dir.
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\033\\"'
		;;
esac


#-----------------------------------------------------------------------------
# Colors
#-----------------------------------------------------------------------------

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi
fi

unset safe_term match_lhs sh


#-----------------------------------------------------------------------------
# Prompt 
#-----------------------------------------------------------------------------

# If the Git Prompt repository is available, use it to set the prompt.
# It can be cloned from https://github.com/magicmonty/bash-git-prompt
if [ -d ~/.bash_git_prompt ]; then
    GIT_PROMPT_THEME=Solarized_Ubuntu
    source ~/.bash_git_prompt/gitprompt.sh
else
    # Use the default prompt that comes with the distribution.

    if ${use_color} ; then
        if [[ ${EUID} == 0 ]] ; then
            PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
        else
            PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
        fi
    else
        if [[ ${EUID} == 0 ]] ; then
            # show root@ when we don't have colors
            PS1='\u@\h \W \$ '
        else
            PS1='\u@\h \w \$ '
        fi
    fi
fi


#-----------------------------------------------------------------------------
# Globs 
#-----------------------------------------------------------------------------
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar


#-----------------------------------------------------------------------------
# History 
#-----------------------------------------------------------------------------
# Append to the history file; do not overwrite it.
shopt -s histappend

# The maximum number of commands to remember in the command history. 
HISTSIZE=10000

# The maximum number of lines contained in the history file. (A command may
# span multiple lines.)
HISTFILESIZE=2000


#-----------------------------------------------------------------------------
# Bash Completion 
#-----------------------------------------------------------------------------

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile.
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

#------- Sudo Command -------------------------------------------------------

complete -cf sudo


#-----------------------------------------------------------------------------
# Environment Variables 
#-----------------------------------------------------------------------------

export EDITOR=vim

#------- PATH ----------------------------------------------------------------

# Personal Shell Scripts 
export PATH=$HOME/bin:$PATH

# Composer: Dependenccy manager for PHP
export PATH=$HOME/.composer/vendor/bin:$PATH

#------- Package Management -------------------------------------------------

export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

#------- Version Control ----------------------------------------------------

export GIT_ASKPASS=/usr/bin/ksshaskpass

export PATH=$HOME/.npm_global/bin:$PATH

#-----------------------------------------------------------------------------
# Commands
#-----------------------------------------------------------------------------

#------- less ----------------------------------------------------------------

# Make less more friendly for nontext input files.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


#-----------------------------------------------------------------------------
# Aliases 
#-----------------------------------------------------------------------------

shopt -s expand_aliases

# Add an "alert" alias for long running commands.  Use like so:
# $ sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#------- ls Command ----------------------------------------------------------

if [ "$use_color" = true ]; then
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
fi

#------- grep Command --------------------------------------------------------

if [ "$use_color" = true ]; then
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

unset use_color 

#------- PHP Development -----------------------------------------------------

# Accessing Laravel Homestead virtual machine from any directory.
alias vm="ssh vagrant@127.0.0.1 -p 2222"

# Laravel Artisan command.
alias artisan="php artisan"

#------- Other aliases definitions ---------------------------------------------------

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


#-----------------------------------------------------------------------------
# Functions 
#-----------------------------------------------------------------------------

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

colors() 
{
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}
