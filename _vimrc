"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> General
"    -> User interface
"    -> Windows and buffers
"    -> Mappings
"    -> Functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $VIMRUNTIME/mswin.vim
behave mswin

" Turn compatible mode off
set nocompatible

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set utf8 as standard encoding
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Use Unix as the standard file type
set fileformats=unix,dos,mac

" Set to auto read when a file is changed from the outside
set autoread

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Auto source when vimrc was modified
autocmd! bufwritepost _vimrc source ~/_vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~

" Always show current position, line number and highlight cursorline
set ruler
set cursorline
set number

" Height of the command bar
set cmdheight=6

" A buffer becomes hidden when it is abandoned
set hidden

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Make sure the cursor line easy to find
set scrolloff=8

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500

" Always show the status line
set laststatus=2

" Enable syntax highlighting
syntax enable
syntax on

" Select a colorscheme
colorscheme desert
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=t
    set guioptions-=L
    set guioptions-=l 
    set guioptions-=M
    set guioptions-=m
    set guioptions+=R
    set guioptions+=r
    set guioptions+=b
    set guioptions+=e    
    set guifont=Courier_New:h12
endif

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set linebreak
set textwidth=500

"Auto indent and Wrap lines
set autoindent 
set smartindent
set wrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=

" winmanager
noremap <silent> <F8> :WMToggle<CR>
vnoremap <silent> <F8> :WMToggle<CR>
inoremap <silent> <F8> <ESC>:WMToggle<CR>

" tlist
noremap <silent> <F9> :TlistToggle<CR>
vnoremap <silent> <F9> :TlistToggle<CR>
inoremap <silent> <F9> <ESC>:TlistToggle<CR>

" buffers
noremap <silent> <C-TAB> :bnext<CR>
vnoremap <silent> <C-TAB> :bnext<CR>
inoremap <silent> <C-TAB> <ESC>:bnext<CR>
noremap <silent> <C-S-TAB> :bprevious<CR>
vnoremap <silent> <C-S-TAB> :bprevious<CR>
inoremap <silent> <C-S-TAB> <ESC>:bprevious<CR>
noremap <silent> <C-F4> :bdelete<CR>:bprevious<CR>
vnoremap <silent> <C-F4> :bdelete<CR>:bprevious<CR>

" quickfix
noremap <silent> <F5> :call QFixToggle()<CR>
vnoremap <silent> <F5> :call QFixToggle()<CR>
inoremap <silent> <F5> <ESC>:call QFixToggle()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd='C:\Program Files\Vim\vim73\ctags.exe'
set tags=tags
set autochdir

let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1
let Tlist_Sort_Type='name'
let Tlist_GainFocus_On_ToggleOpen=1

" Pressing ss will toggle and untoggle spell checking
noremap <silent>ss :setlocal spell!<CR>

" Press CTRL-W for switch foucs
noremap <silent> <C-W> <C-W>w
vnoremap <silent> <C-W> <C-W>w
inoremap <silent> <C-W> <ESC><C-W>w

" Press F4 for grep
noremap <silent> <F4> :Regrep<CR>
vnoremap <silent> <F4> :Regrep<CR>
inoremap <silent> <F4> <ESC>:Regrep<CR>

let Grep_Cygwin_Find = 1
let Grep_Path = 'C:\cygwin\bin\grep.exe'
let Fgrep_Path = 'C:\cygwin\bin\fgrep.exe'
let Egrep_Path = 'C:\cygwin\bin\egrep.exe'
let Grep_Find_Path = 'C:\cygwin\bin\find.exe'
let Grep_Xargs_Path = 'C:\cygwin\bin\xargs.exe'
let Grep_Shell_Quote_Char = "'"
"let Grep_Default_Options = '-rin'
let Grep_Skip_Dirs = '.svn'
let Grep_Skip_Files = '*.bak *.o *.obj *.map *.bin *.elf *.axf'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QFixToggle
function! QFixToggle()
    if exists("g:qfix_win")
        cclose
    else
        copen
    endif
endfunction

augroup QFixToggle
    autocmd!
    autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
    autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END

