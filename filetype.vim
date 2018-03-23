" my filetype file
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.ipy		setfiletype python
    " au! BufRead,BufNewFile *.Rmd		setfiletype rmarkdown
    " au! BufRead,BufNewFile *.rmd		setfiletype rmarkdown
augroup END
