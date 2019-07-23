case "$0" in
          -sh|sh|*/sh)	modules_shell=sh ;;
       -ksh|ksh|*/ksh)	modules_shell=ksh ;;
       -zsh|zsh|*/zsh)	modules_shell=zsh ;;
    -bash|bash|*/bash)	modules_shell=bash ;;
esac
#module() { eval `/usr/Modules/$MODULE_VERSION/bin/modulecmd $modules_shell $*`; }
module() { eval `/usr/bin/modulecmd $modules_shell $*`; }
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\[\t \u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\]\$ '
    #PS2='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\[\t \u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\]\$ '
    #PS1='\[\033[01;32m\]\[\t \u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
    #PS2='\[\033[01;32m\]\[\t \u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='[\t \u:\[\033[01;34m\]\W\[\033[00m\]]\$ '
else
    PS1='\u:\W\$ '
    PS2='[\t \u@\h:\w]\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\]$PS1"
#    ;;
#*)
#    ;;
#esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Load private modules
#. /etc/profile.d/modules.sh
#module use-append ${HOME}/privatemodules

#TZ='Europe/Helsinki'
#export TZ

#export PATH="$PATH:$HOME/bin:/usr/local/cuda/bin"
#export LD_LIBRARY_PATH="/usr/local/cuda/lib64/:/media/DATA2/opt/intel/composer_xe_2013_sp1.0.080/compiler/lib:/media/DATA2/opt/intel/composer_xe_2013_sp1.0.080/mkl/lib:/usr/local/lib:/usr/lib:/lib:/media/DATA2/opt/intel/mkl/lib/intel64"
#export LIBRARY_PATH="$LIBRARY_PATH:/usr/lib/openmi/lib:/opt/intel/composer_xe_2013_sp1.0.080/mkl/lib/intel64/"
#export MKL_DIR="/media/DATA2/opt/intel/composer_xe_2013_sp1.0.080"
#export DYLD_LIBRARY_PATH="$MKL_DIR/compiler/lib:$MKL_DIR/mkl/lib"
#export THEANO_FLAGS="floatX=float32,device=gpu"
#export PYLEARN2_DATA_PATH="${HOME}/data"

PROMPT_DIRTRIM=2

set -o vi

# Vim-R-plugin vim needs to be compiled with the +clientserver flag
#alias vim="vim --servername VIM"

alias info="info --vi-keys"

export VISUAL=vim
export EDITOR="$VISUAL"

alias matlab_no_gui="matlab -nodesktop -nosplash -nodisplay -nojvm -r"

# Print json files in a nice format
# source http://stackoverflow.com/questions/352098/how-can-i-pretty-print-json?page=1&tab=votes#tab-top
alias prettyjson='python -m json.tool'

# Needs a function and an export in order to create dynamic functions
function echo_time() {
  echo `date +%H:%M:%S`
}
export -f echo_time

function cd_last() {
    cd `ls -td ./*/ | head -1`
}
export -f cd_last

if [ -f ".bashrc_${HOSTNAME}" ]; then
    source ".bashrc_${HOSTNAME}"
fi

alias tmux="TERM=screen-256color-bce tmux"
