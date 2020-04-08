setlocal autoindent

" Abbreviations (:ab or :abbreviate)                                                            "
:ab abtodo - [ ] **TODO**
:ab abfig ![]()
:ab ablink [][]
" Command to explore actual diary (last 10)
map <LocalLeader>dy :!diary --last 10 -e ${PWD\#\#*/}<CR>
" Command to explore actual diary (only opened file)
map <LocalLeader>de :!diary -y '%:t' -e ${PWD\#\#*/}<CR>
" 2 spaces instead of tabs
setlocal shiftwidth=2
setlocal tabstop=2
