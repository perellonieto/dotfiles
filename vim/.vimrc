set nocompatible                      " No compatibility with legacy vi
autocmd! bufwritepost .vimrc source % " Automatic reloading of .vimrc

" =========================================================================="
" NeoBundle Scripts                                                         "
" =========================================================================="

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
NeoBundle 'Shougo/neosnippet.vim'               " Snippets implementation
NeoBundle 'Shougo/neosnippet-snippets'          " Predefined snippets
NeoBundle 'tpope/vim-fugitive'                  " Git calls
NeoBundle 'scrooloose/nerdtree'                 " Left panel folder navigator
NeoBundle 'beloglazov/vim-online-thesaurus'     " words from thesaurus.com
NeoBundle 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX' " LaTeX-Suite
"NeoBundle 'ctrlpvim/ctrlp.vim'
"NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'solarized'                           " Color theme

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

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
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" =========================================================================="
" scrooloose/nerdtree Configuration                                         "
" =========================================================================="

map <F2> :NERDTreeToggle<CR>

" =========================================================================="
"  beloglazov/vim-online-thesaurus Configuration                            "
" =========================================================================="

nnoremap <leader>k :OnlineThesaurusCurrentWord<cr>

" =========================================================================="
" My configuratios                                                          "
" =========================================================================="
set encoding=utf-8
"" keymaps
let mapleader = ","
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

map <Leader>. <esc>:tabnext<CR>     " Next tab
map <Leader>, <esc>:tabprevious<CR> " Previous tab
map <Leader>m <esc>:tabnew<CR>      " New tab

set number                      " Show line number
set tw=79                       " Maximum number of characters per row
set laststatus=2                " Show a status line
set scrolloff=2                 " Show n lines between border and cursor
"set fo-=t
set spell                       " Spell checking (z= to show proposed)

"" White spaces
set nowrap                      " Do not wrap lines
set tabstop=4 shiftwidth=4      " Number of spaces to visualize a Tab
set expandtab                   " use spaces instead of tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
" Highligh whitespaces at the end (before Color scheme)
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
map <Leader><Space> <esc>:%s/\s\+$//e<CR>   " Remove ending whitespaces

"" Color and Syntax
set t_Co=256                    " Use 256 colors
syntax enable                   " Enable syntax highlight
set background=dark
colorscheme solarized
set colorcolumn=80              " Paint the column 80
set matchtime=2                 " tenths of a second blink when matching ()

"" Search
set hlsearch                    " Highlight the word to search
set incsearch                   " Searches while typing the word
set ignorecase                  " Search is case insensitive...
set smartcase                   " ... unless it contains a capital letter
noremap <Leader>h :nohl<CR>     " Remove highligh of last search
