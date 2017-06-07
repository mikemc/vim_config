" Forward searching with evince
" Modified from
" http://blog.wuzzeb.org/posts/2013-05-11-vim-latex-forward-search.html 
function! SyncTex()
	let filename = bufname("%")
	let lineno = line(".")
    for syncfile in split(system('zgrep -l "' . filename . '" *.synctex.gz'), "\n")
		let pdffile = substitute(syncfile, ".synctex.gz$", ".pdf", "")
		exec 'silent ! evince_dbus.py ' .
			\ '"' . pdffile . '" ' . lineno . ' "' . filename . '"'
	endfor
	" let pdffile = filename . '.pdf'
    " exec 'silent ! evince_dbus.py ' . '"' . pdffile . '" ' . lineno . ' "' . filename . '"'
endfunction
map <buffer> <LocalLeader>e :call SyncTex()<CR>

" Surround.vim shortcuts
" Color magenta using on letter m
let b:surround_109 = "{\\color{magenta} \r }"

" All this copied from vimrc, with 
" 'autocmd FileType tex' removed

" Latex specific
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=79
" setlocal spell

" " Lines added for VIM-LaTeX
" " REQUIRED. This makes vim invoke latex-suite when you open a tex file.
" "filetype plugin on
" " IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a single file. This will confuse latex-suite. Set your grep
" " program to alway generate a file-name.
" set grepprg=grep\ -nH\ $*
" let g:tex_flavor='latex'
" " to get around dvi files being opened in firefox
" let g:Tex_ViewRule_dvi = 'xdvi -watchfile 2 -editor "gvim --remote-wait"'
" let g:Tex_ViewRule_pdf = 'evince'
" " Compile to pdf by default
" let g:Tex_DefaultTargetFormat = 'pdf'
" " Compile rules to add parser friendly errors
" let g:Tex_CompileRule_pdf = 'rubber --pdf --warn refs $*'
"let g:Tex_CompileRule_dvi = '/home/michael/bin/vimlatex.sh latex -interaction=nonstopmode $*'
"let g:Tex_CompileRule_pdf = '/home/michael/bin/vimlatex.sh pdflatex -interaction=nonstopmode $*'

" Latex-box, see http://stackoverflow.com/questions/3723493/latex-and-vim-usage
" Make latexmk continuously recompile on file updates
let g:LatexBox_latexmk_async=0
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_latexmk_options = "-pdf"
" Folding: 0, off; 1, on.
let g:LatexBox_Folding = 1
" let g:LatexBox_fold_automatic = 1
" Adds paragraph and subparagraph to folding sections; not folded by default
let g:LatexBox_fold_sections=[ "part", "chapter", "section", "subsection",
            \ "subsubsection", "paragraph", "subparagraph" ]

" create a "latex-search" mapping (<Leader>ls) in your ~/.vimrc: >
map <silent> <Leader>ls :silent
        \ !/Applications/Skim.app/Contents/SharedSupport/displayline
        \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>"
        \ "%:p" <CR>

