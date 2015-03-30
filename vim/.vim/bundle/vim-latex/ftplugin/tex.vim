" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
set textwidth=80
set formatoptions=cqt
set spell spelllang=en

set iskeyword+=:

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
