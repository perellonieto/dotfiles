"" =========================================================================="
"" Shougo/dein.vim configuration                                             "
"" https://github.com/Shougo/dein.vim
"" =========================================================================="
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " My bundles
  call dein#add('altercation/vim-colors-solarized') " Solarized colorscheme
  call dein#add('scrooloose/nerdtree')              " Left folder navigator
  call dein#add('beloglazov/vim-online-thesaurus')  " words from thesaurus.com
  call dein#add('mhinz/vim-signify')                " Add git diffs
  " For Python
  call dein#add('Valloric/YouCompleteMe')           " Autocomplete
  call dein#add('nvie/vim-flake8')
  call dein#add('jpalardy/vim-slime')
  call dein#add('vim-scripts/indentpython.vim')     " PEP8 indentations
  " End of My bundles

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
"" =========================================================================="
"" End of Shougo/dein.vim configuration                                             "
"" =========================================================================="

" =========================================================================="
" Shougo/neosnippet Configuration                                           "
" =========================================================================="

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


" =========================================================================="
" My configurations                                                          "
" =========================================================================="
let language = substitute(system('setxkbmap -query | grep layout | tr --delete \ | cut -d : -f 2'), '\n', '', 'g')

set encoding=utf-8
"" keymaps
nmap ; :
let mapleader = ","
let maplocalleader = "m"
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

map <Leader>. <esc>:tabnext<CR>     " Next tab
map <Leader>m <esc>:tabprevious<CR> " Previous tab
map <Leader>/ <esc>:tabnew<CR>      " New tab

if language == 'es'
    map <Leader>- <esc>:tabnew<CR>      " New tab
    nmap ñ :
    nmap Ñ :
endif

"" Split navigations
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

set number                      " Show line number
set tw=79                       " Maximum number of characters per row
set laststatus=2                " Show a status line
set scrolloff=2                 " Show n lines between border and cursor
"set fo-=t
set spell                       " Spell checking (z= to show proposed words)
set spelllang=en_gb             " Spell checking language
autocmd ColorScheme * highlight SpellBad cterm=underline ctermfg=red

"" White spaces
set nowrap                      " Do not wrap lines
set tabstop=4                   " Number of spaces to visualize a Tab
set shiftwidth=4                " Number of spaces to visualize when indent
set expandtab                   " use spaces instead of tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
" set smartindent               " Smart autoindenting
" smartindent: Solve problem with indentation of hash #
" inoremap # X^H#
set smarttab
" Highligh whitespaces at the end (before Color scheme)
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/
map <Leader><Space> <esc>:%s/\s\+$//e<CR>   " Remove ending whitespaces

"" Color and Syntax
set t_Co=256                    " Use 256 colors
syntax enable                   " Enable syntax highlight
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized           " default, desert, murphy, peachpuff, solarized
set colorcolumn=80              " Paint the column 80
set matchtime=2                 " tenths of a second blink when matching ()

"" Search
set hlsearch                    " Highlight the word to search
set incsearch                   " Searches while typing the word
set ignorecase                  " Search is case insensitive...
set smartcase                   " ... unless it contains a capital letter
noremap <Leader>h :nohl<CR>     " Remove highligh of last search

"" Vim-R-plugin
""set runtimepath=~/.vim/bundle/Vim-R-plugin,~/.vim,$VIMRUNTIME,~/.vim/after
"" to insert <- you need to press _ twice
"let vimrplugin_assign = 0

"" Solving problems with swap file:
"" 1. Recover the file by pressing (R)
"" 2. run :DiffAgainstFileOnDisk
"" 3.a To remove the swapfile :e<Enter>
"" 3.b To overwrite the file :w!
command! DiffAgainstFileOnDisk call DiffAgainstFileOnDisk()

function! DiffAgainstFileOnDisk()
    :w! /tmp/working_copy
    exec "!diff /tmp/working_copy %"
endfunction

" =========================================================================="
" Python files
" =========================================================================="
autocmd FileType python set tabstop=4
autocmd FileType python set softtabstop=4
autocmd FileType python set shiftwidth=4
autocmd FileType python set textwidth=79
autocmd FileType python set expandtab
autocmd FileType python set autoindent
autocmd FileType python set fileformat=unix
" depends on 'ervandew/screen'
" TODO create my own code
" tmux display-message -p
" [test] 1:screenshell, current pane 0 - (11:27 06-Apr-17)
" !tmux split-window -h -t test -d
"function! Newfunction()
"    exec "tmux split-window -h -d"
"endfunction
"let g:ScreenImpl = "Tmux"
" Slime configuration
let g:slime_target = "tmux"
let g:slime_python_ipython=1
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:slime_dont_ask_default = 1
" PEP8 indentations
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
" YouCompleteMe config
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" YouCompleteMe aware of Virtualenv
"python with virtualenv support
" Deleted previous version of python virtualenv
let python_highlight_all=1
syntax on
" ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

function! TmuxIPython(...)
    """ Creates a new split and starts ipython
    if !exists("g:TmuxIPythonPane")
        let g:TmuxIPythonPane = 0
    endif
    if g:TmuxIPythonPane == 0
        let g:TmuxIPythonPane = 1
        silent! exec "!tmux split-window -h"
        silent! exec "!tmux last-pane"
        if !empty($VIRTUAL_ENV)
            silent! exec "!tmux send-keys -t :.1  \"source $VIRTUAL_ENV/bin/activate\" C-m"
        endif
        silent! exec "!tmux send-keys -t :.1 ipython C-m"
    else
        echoerr "TmuxIPythonPane already exists"
    endif
endfunction

function! TmuxIPythonQuit(...)
    """ Closes a previously opened Tmux split pane with IPython
    if exists("g:TmuxIPythonPane")
        if g:TmuxIPythonPane == 1
            silent! exec "!tmux send-keys -t :.1 exit C-m"
            silent! exec "!tmux send-keys -t :.1 exit C-m"
            let g:TmuxIPythonPane = 0
        endif
    endif
endfunction

command! TmuxIPython :call TmuxIPython()
command! TmuxIPythonQuit :call TmuxIPythonQuit()

autocmd FileType python map <LocalLeader>pf :TmuxIPython<CR>
autocmd FileType python map <LocalLeader>pq :TmuxIPythonQuit<CR>

" Send pharagraph
autocmd FileType python map <LocalLeader>sp <Plug>SlimeParagraphSend
" Send line
autocmd FileType python map <LocalLeader>sl V<Plug>SlimeRegionSend
" Send visual selection to python.
autocmd FileType python map <LocalLeader>se <Plug>SlimeRegionSend
" Send all file
autocmd FileType python map <LocalLeader>sa ggVG<Plug>SlimeRegionSend

"autocmd FileType python map <LocalLeader>f :Newfunction()<CR>
" Tags navigation
" <C-]> goes to definition
" <C-t> jump back from definition
" <C-w> <C-]> Open definition in horizontal split
" Change tags file location
"set tags=~/mytags
" Create tags with f12
autocmd FileType python map <f12> :! ctags -R .<CR>
" Open the definition in a new vertical split
autocmd FileType python map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Open the definition in a new tab
" map <C-[> :sp <CR>:exec("tag ".expand("<cword>"))<CR>
" Open an ipython2 shell.
" :IPython for horizontal split
" :IPython! for vertical split
"" autocmd FileType python let g:ScreenShellSendPrefix = '%cpaste -q'
"" autocmd FileType python let g:ScreenShellSendSuffix = '--'
" TODO need to implement my versions
" autocmd FileType python map <LocalLeader>pf :IPython!<CR>
" Close whichever shell is running.
" autocmd FileType python map <LocalLeader>pq :ScreenQuit<CR>
"" " Send current line to python.
"" autocmd FileType python map <LocalLeader>l V:ScreenSend<CR>
"" " Send visual selection to python.
"" autocmd FileType python map <LocalLeader>se :ScreenSend<CR>
"" " Clear screen.
"" autocmd FileType python map <LocalLeader>pc
""       \ :call g:ScreenShellSend('!clear')<CR>
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar (creates problem with tabnext)
" nnoremap <space> za

" Help function for IPython
function! s:get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction
" TODO: Improve the Help function
" Get ipython help for word under cursor. Complement it with Shift + K.
function! GetHelp()
    if a:firstline==1 && a:lastline==line('$')
        echo "selection"
        let w = s:get_visual_selection() . "??"
    else
        echo "current position"
        let w = expand("<cword>") . "??"
    endif
  :call g:ScreenShellSend(w)
endfunction
autocmd FileType python map <LocalLeader>ph :call GetHelp()<CR>

" Get `dir` help for word under cursor.
function! GetDir()
  let w = "dir(" . expand("<cword>") . ")"
  :call g:ScreenShellSend(w)
endfunction
autocmd FileType python map <LocalLeader>pd :call GetDir()<CR>

" Get `dir` help for word under cursor.
function! GetLen()
  let w = "len(" . expand("<cword>") . ")"
  :call g:ScreenShellSend(w)
endfunction
autocmd FileType python map <LocalLeader>le :call GetLen()<CR>

" Search in Google the selected text
function! GoogleSearch()
     let searchterm = getreg("g")
     exec "!google-chrome \"http://google.com/search?q=" . searchterm . "\" >/dev/null 2>&1"
endfunction

" Search in Google Scholar the selected text
function! GoogleScholarSearch()
     let searchterm = getreg("g")
     exec "!google-chrome \"https://scholar.google.es/scholar?q=" . searchterm . "\" >/dev/null 2>&1"
endfunction


"" Yank to clipboard
"" This code needs a vim version compiled with the option +clipboard
if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

" =========================================================================="
"  beloglazov/vim-online-thesaurus Configuration                            "
" =========================================================================="
nnoremap <leader>k :OnlineThesaurusCurrentWord<cr>

" Remap Alt-Space to ESC
imap <Alt><Space> <Esc>

"" " =========================================================================="
"" " Shougo/neocomplite.vim Configuration
"" " =========================================================================="
"" " Disable AutoComplPop.
"" let g:acp_enableAtStartup = 0
"" " Use neocomplete.
"" let g:neocomplete#enable_at_startup = 1
"" " Use smartcase.
"" let g:neocomplete#enable_smart_case = 1
"" " Set minimum syntax keyword length.
"" let g:neocomplete#sources#syntax#min_keyword_length = 3
""
"" " Define dictionary.
"" let g:neocomplete#sources#dictionary#dictionaries = {
""     \ 'default' : '',
""     \ 'vimshell' : $HOME.'/.vimshell_hist',
""     \ 'scheme' : $HOME.'/.gosh_completions'
""         \ }
""
"" " Define keyword.
"" if !exists('g:neocomplete#keyword_patterns')
""     let g:neocomplete#keyword_patterns = {}
"" endif
"" let g:neocomplete#keyword_patterns['default'] = '\h\w*'
""
"" " Plugin key-mappings.
"" inoremap <expr><C-g>     neocomplete#undo_completion()
"" inoremap <expr><C-l>     neocomplete#complete_common_string()
""
"" " Recommended key-mappings.
"" " <CR>: close popup and save indent.
"" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"" function! s:my_cr_function()
""   return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
""   " For no inserting <CR> key.
""   "return pumvisible() ? "\<C-y>" : "\<CR>"
"" endfunction
"" " <TAB>: completion.
"" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" " <C-h>, <BS>: close popup and delete backword char.
"" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"" " Close popup by <Space>.
"" "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
""
"" " AutoComplPop like behavior.
"" "let g:neocomplete#enable_auto_select = 1
""
"" " Shell like behavior(not recommended).
"" "set completeopt+=longest
"" "let g:neocomplete#enable_auto_select = 1
"" "let g:neocomplete#disable_auto_complete = 1
"" "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
""
"" " Enable omni completion.
"" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
""
"" " Enable heavy omni completion.
"" if !exists('g:neocomplete#sources#omni#input_patterns')
""   let g:neocomplete#sources#omni#input_patterns = {}
"" endif
"" "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"" "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"" "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
""
"" " For perlomni.vim setting.
"" " https://github.com/c9s/perlomni.vim
"" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
""
"" " Use other snippets
"" " Enable snipMate compatibility feature.
"" let g:neosnippet#enable_snipmate_compatibility = 1
"" " Tell Neosnippet about the other snippets
"" let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
""
"" " =========================================================================="
"" " Shougo/neocomplite.vim Configuration
"" " =========================================================================="
"" " Plugin key-mappings.
"" " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"" xmap <C-k>     <Plug>(neosnippet_expand_target)
""
"" " SuperTab like snippets behavior.
"" " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"" "imap <expr><TAB>
"" " \ pumvisible() ? "\<C-n>" :
"" " \ neosnippet#expandable_or_jumpable() ?
"" " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
""
"" " For conceal markers.
"" if has('conceal')
""   set conceallevel=2 concealcursor=niv
"" endif

" =========================================================================="
" Configuration to use jedi-vim
" =========================================================================="
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
"let g:neocomplete#force_omni_input_patterns.python ='\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"" alternative pattern: '\h\w*\|[^. \t]\.\w*'

" =========================================================================="
" Configuration to use vim-airline/vim-airline
" =========================================================================="
"let g:airline_theme='bubblegum'

" =========================================================================="
" MARKDOWN files
" =========================================================================="
" Abbreviations (:ab or :abbreviate)                                                            "
autocmd FileType markdown :ab todo - [ ] **TODO**
" Command to explore actual diary (all year)
autocmd FileType markdown map <LocalLeader>dy :!diary -e ${PWD\#\#*/}<CR>
" Command to explore actual diary (only opened file)
autocmd FileType markdown map <LocalLeader>de :!diary -y '%:t' -e ${PWD\#\#*/}<CR>
" 2 spaces instead of tabs
autocmd FileType markdown set tabstop=4
autocmd FileType markdown set shiftwidth=4

" =========================================================================="
" vim-scripts/LaTeX-Suite-aka-Vim-LaTeX Configuration                       "
" =========================================================================="
"  remember to add a main.latexmain file next to the main.tex file
"  in this way it is possible to compile from other .tex files
autocmd FileType tex set grepprg=grep\ -nH\ $*       " Grep always generates a file-name
autocmd FileType tex set iskeyword+=:                " auto-completion in references by <C-n>
" Following configuration of LaTeX-Suite needs revision
set formatoptions=cqt
set iskeyword+=:
"
" Solve problem with Latex-suite and editing formulas
" TODO investigate why adding autocmd FileType tex before following lines do
" not work
let g:tex_conceal = ""
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf, aux'
"autocmd FileType tex let g:Tex_FormatDependency_pdf = 'pdf'
"autocmd FileType tex let g:Tex_CompileRule_pdf = 'latexmk --bibtex --pdf'
"autocmd FileType tex let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode -synctex=1 $*'
autocmd FileType tex let g:Tex_ViewRule_pdf = 'evince'
autocmd FileType tex let g:Tex_IgnoredWarnings =
    \'Underfull'."\n".
    \'Overfull'."\n".
    \'specifier changed to'."\n".
    \'You have requested'."\n".
    \'Missing number, treated as zero.'."\n".
    \'There were undefined references'."\n".
    \'Citation %.%# undefined'."\n".
    \'Double space found.'."\n".
    \'Package fmtcount Warning: \\ordinal already defined use \\FCordinal instead.'."\n".
    \'Package tikz Warning: Snakes have been superseded by decorations.'."\n"
let g:Tex_IgnoreLevel = 10
" FIXME There is no function called SetTeXTarget
"autocmd FileType tex :call SetTeXTarget('pdf')
" TODO Remap the JumpForward from <C-j> to <C-space>
" e.g. \chapter{_}<++>
autocmd FileType tex imap <C-g> <Plug>IMAP_JumpForward

autocmd FileType tex set tabstop=2                   " Number of spaces to visualize a Tab
autocmd FileType tex set shiftwidth=2                " Number of spaces to visualize when indent
autocmd FileType tex set nowrap                      " Do not wrap lines
autocmd FileType tex set expandtab                   " use spaces instead of tabs

" Avoid ussing vim-latex and just use the following line
"map <Leader>ll :!pdflatex %:p <CR>

set conceallevel=0

" Create visual diff on two blocks of text (buffer a and buffer b)
let g:diffed_buffers=[]
function! DiffText(a, b, diffed_buffers)
    enew
    setlocal buftype=nowrite
    call add(a:diffed_buffers, bufnr('%'))
    call setline(1, split(a:a, "\n"))
    diffthis
    vnew
    setlocal buftype=nowrite
    call add(a:diffed_buffers, bufnr('%'))
    call setline(1, split(a:b, "\n"))
    diffthis
endfunction
function! WipeOutDiffs(diffed_buffers)
    for buffer in a:diffed_buffers
        execute 'bwipeout! '.buffer
    endfor
endfunction

nnoremap <special> <F8> :call DiffText(@a, @b, g:diffed_buffers)<CR>
nnoremap <special> <F9> :call WipeOutDiffs(g:diffed_buffers) & let g:diffed_buffers=[]<CR>

" Function mappings Mappings
" =========================================================================="
" scrooloose/nerdtree Configuration                                         "
" =========================================================================="
map <F2> :NERDTreeToggle<CR>
" My own functions to access google-chrome
vnoremap <F3> "gy<Esc>:call GoogleSearch()<CR>
vnoremap <F4> "gy<Esc>:call GoogleScholarSearch()<CR>


" Function to Toggle navigation on wrapped lines
" =========================================================================="
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function! ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction
