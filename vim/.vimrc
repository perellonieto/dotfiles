set nocompatible                      " No compatibility with legacy vi
autocmd! bufwritepost .vimrc source % " Automatic reloading of .vimrc

" =========================================================================="
" NeoBundle Scripts                                                         "
" =========================================================================="

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
" when writting the '<url>' it is possible to ommit the https://github.com/
"NeoBundle 'Shougo/neosnippet.vim'               " Snippets implementation
"NeoBundle 'Shougo/neosnippet-snippets'          " Predefined snippets
NeoBundle 'mhinz/vim-signify'                   " Add git diffs
NeoBundle 'tpope/vim-fugitive'                  " Git calls
NeoBundle 'scrooloose/nerdtree'                 " Left panel folder navigator
NeoBundle 'beloglazov/vim-online-thesaurus'     " words from thesaurus.com
NeoBundle 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX' " LaTeX-Suite
"NeoBundle 'davidhalter/jedi-vim'                " Autocompletion library Jedi
"NeoBundle 'Valloric/YouCompleteMe'
"NeoBundle 'ctrlpvim/ctrlp.vim'
"NeoBundle 'flazz/vim-colorschemes'
"NeoBundle 'solarized'                           " Color theme
"NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'solarized/vim-colors-solarized'
"NeoBundle 'wellle/vim-colors-solarized'
NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'akmassey/vim-codeschool'
NeoBundle 'easymotion/vim-easymotion'            " easy motion <Leader>^2 s
"NeoBundle 'vim-scripts/Vim-R-plugin'
"NeoBundle 'jcfaria/Vim-R-plugin'
"NeoBundle 'jalvesaq/VimCom'
" For Python
" TODO need to remove this package
NeoBundle 'ervandew/screen'                " Not working in IPython >= 5
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'nvie/vim-flake8'
"NeoBundle 'vim-scripts/indentpython.vim'
"NeoBundle 'Valloric/YouCompleteMe'
" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
NeoBundle 'Shougo/neocomplete.vim'      " Autocomplete
" Necessary snipets for neocomplete
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'  " Snippets for several programming languages
NeoBundle 'davidhalter/jedi-vim' " Snippets for Python
NeoBundle 'powerline/powerline'     " Better statusline
NeoBundle 'vim-airline/vim-airline' " Better statusline
NeoBundle 'vim-airline/vim-airline-themes'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck

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
" scrooloose/nerdtree Configuration                                         "
" =========================================================================="
map <F2> :NERDTreeToggle<CR>

" =========================================================================="
" vim-scripts/LaTeX-Suite-aka-Vim-LaTeX Configuration                       "
" =========================================================================="
"  remember to add a main.latexmain file next to the main.tex file
"  in this way it is possible to compile from other .tex files

autocmd FileType tex set grepprg=grep\ -nH\ $*       " Grep always generates a file-name
autocmd FileType tex set iskeyword+=:                " auto-completion in references by <C-n>
" Following configuration of LaTeX-Suite needs revision
"set formatoptions=cqt
"set iskeyword+=:
"
" Solve problem with Latex-suite and editing formulas
autocmd FileType tex let g:tex_conceal = ""
autocmd FileType tex let g:Tex_DefaultTargetFormat = 'pdf'
"autocmd FileType tex let g:Tex_MultipleCompileFormats = 'pdf'
"autocmd FileType tex let g:Tex_FormatDependency_pdf = 'pdf'
autocmd FileType tex let g:Tex_CompileRule_pdf = 'latexmk --bibtex --pdf'
autocmd FileType tex let g:Tex_ViewRule_pdf = 'evince'
" TODO Remap the JumpForward from <C-j> to <C-space>
" e.g. \chapter{_}<++>
autocmd FileType tex imap <C-g> <Plug>IMAP_JumpForward

" =========================================================================="
" My configurations                                                          "
" =========================================================================="
set encoding=utf-8
"" keymaps
let mapleader = ","
let maplocalleader = "m"
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

map <Leader>. <esc>:tabnext<CR>     " Next tab
map <Leader>m <esc>:tabprevious<CR> " Previous tab
map <Leader>- <esc>:tabnew<CR>      " New tab

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
au InsertLeave * match ExtraWhitespace /\s\+$/
map <Leader><Space> <esc>:%s/\s\+$//e<CR>   " Remove ending whitespaces

"" Color and Syntax
set t_Co=256                    " Use 256 colors
syntax enable                   " Enable syntax highlight
set background=dark
"let g:solarized_termcolors=256
colorscheme solarized           " default, desert, murphy, peachpuff, solarized
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

function! TmuxIPython(...)
    """ Creates a new split and starts ipython
    silent! exec "!tmux split-window -h"
    silent! exec "!tmux last-pane"
    if !empty($VIRTUAL_ENV)
        silent! exec "!tmux send-keys -t :.1  \"source $VIRTUAL_ENV/bin/activate\" C-m"
    endif
    silent! exec "!tmux send-keys -t :.1 ipython C-m"
endfunction

command! TmuxIPython :call TmuxIPython()

autocmd FileType python map <LocalLeader>pf :TmuxIPython<CR>

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
 autocmd FileType python map <LocalLeader>pq :ScreenQuit<CR>
"" " Send current line to python.
"" autocmd FileType python map <LocalLeader>l V:ScreenSend<CR>
"" " Send visual selection to python.
"" autocmd FileType python map <LocalLeader>se :ScreenSend<CR>
"" " Clear screen.
"" autocmd FileType python map <LocalLeader>pc
""       \ :call g:ScreenShellSend('!clear')<CR>

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
     silent! exec "silent! !chromium-browser \"http://google.com/search?q=" . searchterm . "\" &"
endfunction
vnoremap <F6> "gy<Esc>:call GoogleSearch()<CR>


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

" =========================================================================="
" Shougo/neocomplite.vim Configuration
" =========================================================================="
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Use other snippets
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" =========================================================================="
" Shougo/neocomplite.vim Configuration
" =========================================================================="
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

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
let g:airline_theme='bubblegum'

" =========================================================================="
" MARKDOWN files
" =========================================================================="
" Abbreviations (:ab or :abbreviate)                                                            "
autocmd FileType markdown :ab todo - [ ] **TODO**
" Command to explore actual diary
autocmd FileType markdown map <LocalLeader>de :!diary -e ${PWD\#\#*/}<CR>


