" Add a breaking point
noremap <silent> <Leader>b ofrom IPython import embed; embed()<ESC>

"" Scripts
" Run with Python
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

map <LocalLeader>pf :TmuxIPython<CR>
map <LocalLeader>pq :TmuxIPythonQuit<CR>

" Send pharagraph
map <LocalLeader>sp <Plug>SlimeParagraphSend
" Send line
map <LocalLeader>sl V<Plug>SlimeRegionSend
" Send visual selection to python.
map <LocalLeader>se <Plug>SlimeRegionSend
" Send all file
map <LocalLeader>sa ggVG<Plug>SlimeRegionSend

