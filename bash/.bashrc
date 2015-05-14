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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
#force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

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

#TZ='Europe/Helsinki'
#export TZ

alias R_gui="/usr/local/lib/R/site-library/JGR/scripts/run"
alias max_bright="sudo setpci -s 00:02.0 f4.b=ff"
alias aisoy_connect="sudo ifconfig usb0 10.34.65.88 netmask 255.255.255.0"
alias environment_ros="source ~/ros/setup.bash"
alias gcalcli="/usr/bin/gcalcli --pw=`cat ~/.gcalclirc-pw`"
alias tmux="tmux -2"
alias diskusage="du -sch .[!.]* * | sort -h"

PS1="[\t \u@\h:\W ] $ "

export PATH="$PATH:$HOME/bin:/usr/local/cuda/bin"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64/:/media/DATA2/opt/intel/composer_xe_2013_sp1.0.080/compiler/lib:/media/DATA2/opt/intel/composer_xe_2013_sp1.0.080/mkl/lib:/usr/local/lib:/usr/lib:/lib:/media/DATA2/opt/intel/mkl/lib/intel64"
export LIBRARY_PATH="$LIBRARY_PATH:/usr/lib/openmi/lib:/opt/intel/composer_xe_2013_sp1.0.080/mkl/lib/intel64/"
export MKL_DIR="/media/DATA2/opt/intel/composer_xe_2013_sp1.0.080"
export DYLD_LIBRARY_PATH="$MKL_DIR/compiler/lib:$MKL_DIR/mkl/lib"
export THEANO_FLAGS="floatX=float32,device=gpu"
export PYLEARN2_DATA_PATH="${HOME}/data"

source ~/.bashrc_private
alias android-connect="mtpfs -o allow_other /media/jose_motorola"
alias android-disconnect="fusermount -u /media/jose_motorola"
alias android-connect="mtpfs -o allow_other /media/jose_motorola"
alias android-disconnect="fusermount -u /media/jose_motorola"

alias mount_james="sshfs perellm1@james.ics.hut.fi:/ ${HOME}/james"
