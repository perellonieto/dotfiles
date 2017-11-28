" Add a breaking point
noremap <silent> <Leader>b ofrom IPython import embed; embed()<ESC>

"" Scripts
" Run with Python
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

