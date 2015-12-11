" David Tombs's vim settings, based originally on Bram's example vimrc
" included with vim.

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" ### My General Options ###

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup            " I prefer version control
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
" Bram's example sets incsearch, but it messes with my mind too much.
set scrolloff=1
" 03-Jun-2015, used to be 80 but screens are wider now!
set textwidth=90
set diffopt+=iwhite     " Ignore whitespace in diffs.
set wildmenu

set background=dark     " My backgrounds are usually dark.

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" 18-Sep-2015, avoid slowness on very long lines
set synmaxcol=200

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
let &guioptions = substitute(&guioptions, "t", "", "g")

" ### Preferred behavior changes ###

" Don't use Ex mode, use Q for formatting
map Q gq

" Make Y consistent with C and D.
nnoremap Y y$

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" ### Filetype-specific options ###

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" ### Extensions ###

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

runtime! macros/matchit.vim

" 17-Dec-2011
iabbrev <expr> HDATE strftime("%d-%b-%Y")

" 12-feb-2011
command SvnDiff new | set bt=nofile | r !svn diff #

" dgt 27 nov 2009
" generates a OmniCppComplete ctags database for current directory
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"  A few ideas from derekwyatt.org
nmap <silent> ,ev :e $MYVIMRC<cr>
nmap <silent> ,sv :so $MYVIMRC<cr>

" Move the cursor to the window left of the current one
noremap <silent> ,h :wincmd h<cr>

" Move the cursor to the window below the current one
noremap <silent> ,j :wincmd j<cr>

" Move the cursor to the window above the current one
noremap <silent> ,k :wincmd k<cr>

" Move the cursor to the window right of the current one
noremap <silent> ,l :wincmd l<cr>

