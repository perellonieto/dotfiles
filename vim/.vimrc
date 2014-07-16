set encoding=utf-8
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
" Setup Pathogen to manage your plugins
" " mkdir -p ~/.vim/autoload ~/.vim/bundle
" " curl -so ~/.vim/autoload/pathogen.vim
" https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" " Now you can install any plugin into a .vim/bundle/plugin-name/ folder

" Setup Bundle Support
" next two lines ensure that ~/.vim/bundle system works
runtime! autoload/pathogen.vim
silent! call pathogen\#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()

" indent : this enables automatic indentation as you type.
" plugin : this makes vim invoke latex-suite when you open a tex file.
filetype plugin indent on
syntax on
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Vim UI
set cursorline
" if has('cmdline_info')
"     set ruler
"     set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
"     set showcmd
" endif

" Better copy paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed
" Minimum lines to keep above and below cursor
set scrolloff=3
set splitright     " Puts new vsplit windows to the right of the current
set splitbelow     " Puts new split windows to the bottom of the current
" Paste into the next line
map <Leader>p o<ESC>p

" Mouse and backspace
if has('mouse')
    set mouse=a " on OSX press ALT and click
endif
" Copy to clipboard
" With the mouse it is also possible holding Shift and dragging
vmap <C-c> "+y
set bs=2    " make backspace behave like normal again

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Bind nohl
" Removes highlight of your last search
" ``<C>`` sCands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <Leader>h :nohl<CR>

" Quicksave command
noremap <Leader>w :update<CR>
vnoremap <Leader>w <C-C>:update<CR>
" inoremap <Leader>w <C-O>:update<CR>

" quickexit command
noremap <Leader>e :quit<CR>

" movement between tabs
map <Leader>. <esc>:tabnext<CR>
map <Leader>, <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnew<CR>

" easier moving of code blocks
" " Try to go into visual mode (v), thenselect several lines of code here and
" " then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation
map <Leader>a ggVG " select all

" Show whitespace
" " MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
map <Leader>s <esc>:%s/\s\+$//e<CR>


" Color scheme
set t_Co=256
color wombat256mod

" line number
set number
set tw=79
set nowrap
set fo-=t
if v:version >= 730
    set colorcolumn=80
    highlight ColorColumn ctermbg=Black
    " show the filename on bottom
endif
set ls=2

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=1000
set undolevels=1000
" Spell checking
" set spell

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" highlight the word to search
" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

set foldenable                  " Auto fold code

" Settings for NerdTree
" cd ~/.vim/bundle
" git clone https://github.com/scrooloose/nerdtree.git
map <F2> :NERDTreeToggle<CR>

" Settings for Fugitive
" cd ~/.vim/bundle
" git clone git://github.com/tpope/vim-fugitive.git

" ============================================================================
" VIM-LATEX Setup
" ============================================================================

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" remap for <C-j> to jump to the next <++> symbol
map <C-i> <Plug>IMAP_JumpForward
nmap <C-i> <Plug>IMAP_JumpForward

" ============================================================================
" Python IDE Setup
" ============================================================================

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
" let g:jedi#related_names_command = "<leader>z"
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
inoremap <silent><C-K> <C-R>=OmniPopup('k')<CR>
inoremap <silent><C-J> <C-R>=OmniPopup('j')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" Store swap files in fixed location, not current directory.
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

" My own maps
" ===========
" bind ctrl+<movement> keys to move around the windows, instead of using
" ctrl+w + <movement>
" remove <C-W>_ for not folding the other splits
" example:     folding : nnoremap <C-H> <C-W>h<C-W>_
"          not folding : nnoremap <C-H> <C-W>h<C-W>
nnoremap <C-H> <C-W>h<C-W>
nnoremap <C-J> <C-W>j<C-W>
nnoremap <C-K> <C-W>k<C-W>
nnoremap <C-L> <C-W>l<C-W>

" Gitcommit help
" autocmd Filetype gitcommit setlocal spell textwidth=72
