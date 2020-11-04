alias tmux="TERM=screen-256color-bce tmux"

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
