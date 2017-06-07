" Pathogen, https://github.com/tpope/vim-pathogen
" Disabled in favor of new native plugin loading
" execute pathogen#infect()

" set font
set guifont=DejaVu\ Sans\ Mono\ 10

" Take care of color scheme in console
if !has("gui_running")
    " IMPORTANT: Uncomment one of the following lines to force
    " using 256 colors (or 88 colors) if your terminal supports it,
    " but does not automatically use 256 colors by default.
    set t_Co=256
    "set t_Co=88
    "set t_AB=^[[48;5;%dm
    "set t_AF=^[[38;5;%dm
    let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
    colorscheme koehler
endif
" set background in gvim
if has("gui_running")
    colorscheme wombat
    set guioptions-=m " remove menu, gui tabs, and toolbar
    set guioptions-=T " remove toolbar
    set guioptions-=e " remove gui tabs
    set guioptions-=r " remove right-hand scroll bar
    set guioptions-=L " remove left-hand scroll bar
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" do not treat these chars as word breaks: _-
set iskeyword+=_
set iskeyword+=-

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50	" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set showmode	" show current mode
set incsearch   " do incremental searching
set ignorecase  " case-insensitive search if all lowercase
set smartcase   " case-sensitive search if contains uppercase char
"set guiheadroom=0

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

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

  " For all text files set 'textwidth' to 79 characters.
  autocmd FileType text setlocal textwidth=79

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


" Change to the directory the file in your current buffer is in
if has("autocmd")
    autocmd BufEnter * :lcd %:p:h
endif " has("autocmd") 

" Tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Relative line numbering, with absolute number given for current line
set number
set relativenumber

" Highlight current line (causes major lag in large .tex files)
set cursorline

" Keep an undo file
set undofile

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full
" set wildmenu

" turn off error beeps and visual bell
set noerrorbells
if has('autocmd')
    autocmd GUIEnter * set vb t_vb=
endif 

" mksession options
"set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages

" Java specific
autocmd FileType java setlocal  tabstop=2
autocmd FileType java setlocal  softtabstop=2
autocmd FileType java setlocal  shiftwidth=2
" Text 
autocmd FileType text setlocal  textwidth=79
" autocmd FileType text setlocal  spell
" Python specific
autocmd FileType python setlocal  tabstop=4
autocmd FileType python setlocal  softtabstop=4
autocmd FileType python setlocal  shiftwidth=4
" autocmd FileType python nnoremap <buffer> <leader>ll V:ScreenSend<CR>
" autocmd FileType python nnoremap <buffer> <F4> :'<,'>ScreenSend<CR>

" Use arduino.vim syntax highlighting on .pde files
au BufNewFile,BufRead *.pde setf arduino
autocmd FileType arduino set cindent
autocmd FileType arduino setlocal  tabstop=2
autocmd FileType arduino setlocal  softtabstop=2
autocmd FileType arduino setlocal  shiftwidth=2
autocmd FileType arduino setlocal  textwidth=79

" Statusline
":set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
":set laststatus=2

""""" Keyboard mappings

" Move between split windows more quickly
if has("gui_running")
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
endif

" run current file in Python interpretter
" :map <F5> :w<CR>:!xfce4-terminal -H -e python "%:p:h/%" &<CR>
" :imap <F5> <Esc>:w<CR>:!xfce4-terminal -H -e python "%:p:h/%" &<CR>

" Clear highlighted search items
":map <F3> :let @/=""<CR>  :echo "Highlights Cleared"<CR>
":imap <F3> <Esc>:let @/=""<CR>  :echo "Highlights Cleared"<CR>i

" Press F3 to toggle highlighting on/off, and show current value.
:noremap <F3> :set hlsearch! hlsearch?<CR>

" switch between dark and light background settings
"map <F2> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" toggle the menu and toolbar in gvim
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
                       \set guioptions-=T <Bar>
                       \set guioptions-=m <bar>
                   \else <Bar>
                        \set guioptions+=T <Bar>
                        \set guioptions+=m <Bar>
                   \endif<CR>

" Toggle highlighting of current line
:map <F4> :set cursorline! cursorline?<CR>
:imap <F4> <Esc>:set cursorline! cursorline?<CR>a

" Toggle spell check
nn <F5> :setlocal spell! spell?<CR>

if has("gui_running")
    colorscheme wombat
    set guioptions-=m " remove menu, gui tabs, and toolbar
    set guioptions-=T " remove toolbar
    set guioptions-=e " remove gui tabs
    set guioptions-=r " remove right-hand scroll bar
    set guioptions-=L " remove left-hand scroll bar
endif

""""" Plugins

" Change LocalLeader from \
let maplocalleader = ","

"" UltiSnips configuration
" Change from default "<tab>" to maintain normal tab function
let g:UltiSnipsExpandTrigger = "<c-h>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" User-defined snippets directory
let g:UltiSnipsSnippetsDir = "~/.vim/my_snippets/UltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets/UltiSnips"]

" declare global configuration dictionary so that config options can be added:
let g:UltiSnips = {}
let g:UltiSnips.UltiSnips_ft_filter = {
    \ 'default' : {'filetypes': ["FILETYPE"] },
\ }

let g:UltiSnips.always_use_first_snippet = 1

" Use snipmate snippets too
let g:UltiSnips.snipmate_ft_filter = {
    \ 'default' : {'filetypes': ["FILETYPE"] },
\ }

"" Knitr and r-plugin
" " Highlight chunk headers in knitr .Rnw files as R code
" let rrst_syn_hl_chunk = 1
" let rmd_syn_hl_chunk = 1
" let vimrplugin_assign = 0
" " r-plugin-vim stuff
" " Disable commands in insert mode
" let g:vimrplugin_insert_mode_cmds = 0


""""" Tools

" SyntaxAttr -- http://www.vim.org/scripts/script.php?script_id=383
" Tool for displaying syntax highlighting attributes
map -a :call SyntaxAttr()<CR>

" Writing
" from http://www.drbunsen.org/writing-in-vim/
" func! WordProcessorMode() 
"   setlocal formatoptions=1 
"   setlocal noexpandtab 
"   map j gj 
"   map k gk
"   " setlocal spell spelllang=en_us 
"   " set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
"   set complete+=s
"   set formatprg=par
"   setlocal wrap 
"   setlocal linebreak 
" endfu 
" com! WP call WordProcessorMode()
 
