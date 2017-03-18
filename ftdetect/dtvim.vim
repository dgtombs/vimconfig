" Customized filetype detections for David.

autocmd BufRead,BufNewFile *.md set filetype=markdown

" Go ahead and treat all text files as asciidoc. Shouldn't do any harm.
autocmd BufRead,BufNewFile *.txt set filetype=asciidoc

