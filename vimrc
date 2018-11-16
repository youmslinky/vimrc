" youmslinky custom vimrc ----------------------------------------
"-----------------------------------------------------------------
"set colorscheme
colo slate

" based on example vimrc from: http://vim.wikia.com/wiki/Example_vimrc
"
"-----------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Status Line (curly braces just denote all status line commands) {  
        set laststatus=2                             " always show statusbar  
        set statusline=  
        set statusline+=%-10.3n\                     " buffer number  
        set statusline+=%f\                          " filename   
        set statusline+=%h%m%r%w                     " status flags  
        set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type  
        set statusline+=%=                           " right align remainder  
        set statusline+=0x%-8B                       " character value  
        set statusline+=%-14(%l,%c%V%)               " line, character  
        set statusline+=%<%P                         " file position  
"}  

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
"set shiftwidth=4
"set softtabstop=4
"set expandtab
"
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
set shiftwidth=8
set tabstop=8
"
"
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
"
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-/> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-/> :nohl<CR><C-L>
nnoremap <leader>/ :nohl<CR><C-L>

"------------------------------------------------------------

"jdk stuff 2018/9/5
"
"
"navigate between window split panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
"conflicts with <C-L> for normal :noh shortcut
map <C-l> <C-W>l

"use alt+hjkl to resize windows
nnoremap <M-j> <C-w>-
nnoremap <M-k> <C-w>+
nnoremap <M-h> <C-w><
nnoremap <M-l> <C-w>>

"esc from insert mode with jk
inoremap jk <Esc>

"automatically use relative line numbers when in command mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

"set leader to ','
let mapleader=","

"quick save file
nnoremap <leader>w :w<cr>

"quick save file
nnoremap <leader>q :q<cr>

"edit vimrc
nnoremap <leader>ev <C-w><C-s><C-l>:e $MYVIMRC<cr>

"reload vimrc
nnoremap <leader>rv :so $MYVIMRC<cr>

"#######################################################################
"temporary for doing part numbers
map <f2> 0/\<cr>9f\lyt\<C-k>po<esc><C-w>jj

"#######################################################################

"find something in ATL files recursively in current directory
nnoremap <f5> :exec 'vimgrep /'.input('grep what? ').'/ ./**/*.ATL <bar> cw'<cr>
nnoremap <leader>ga :exec 'vimgrep /'.input('grep what? ').'/ ./**/*.ATL <bar> cw'<cr>

"yank and delete all text in file
nnoremap <C-A> <Esc>:%d+<CR>

"yank entire word under cursor to clipboard
"map <C-C> "+yiW

"find what is on windows clipboard
"nnoremap <C-X> /<c-r>+<cr>

"change working directory to the one the open file is in
nnoremap <leader>cd :lcd %:p:h<cr>

" highlight tabs and trailing spaces
set listchars=tab:>-,trail:-
set listchars=eol:¶,tab:>-,trail:.,extends:>,precedes:<,nbsp:_
"toggle viewing tabs and spaces
noremap <f4> :set list!<cr>

"toggle locking cursor in middle of screen
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

"make vim not correct windows/dos eof ^Z character
set nofixendofline

"make it easier to enter ex commands
"nnoremap ; :
nnoremap <space> :
vnoremap <space> :

"goes to next id in atlas code
nnoremap <leader>. /\v^\s*\d+\s<cr>:noh<cr>
nnoremap <leader>m ?\v^\s*\d+\s<cr>:noh<cr>

"switch (y) option (o) fixed (turns on scrollbind)
nnoremap yof :set scrollbind!<cr>

"exit terminal mode using esc
tnoremap jk <C-\><C-n>

"close buffer without closing window
nnoremap Q :bp<bar>bd #<cr>

" Displays buffer list, prompts for buffer numbers and ranges and deletes
" associated buffers. Example input: 2 5,9 12
" Hit Enter alone to exit. 
function! InteractiveBufDelete()
    let l:prompt = "Specify buffers to delete: "

    ls | let bufnums = input(l:prompt)
    while strlen(bufnums)
        echo "\n"
        let buflist = split(bufnums)
        for bufitem in buflist
            if match(bufitem, '^\d\+,\d\+$') >= 0
                exec ':' . bufitem . 'bd'
            elseif match(bufitem, '^\d\+$') >= 0
                exec ':bd ' . bufitem
            else
                echohl ErrorMsg | echo 'Not a number or range: ' . bufitem | echohl None
            endif 
        endfor
        ls | let bufnums = input(l:prompt)
    endwhile 

endfunction

"map above function
nnoremap <silent> <leader>bd :call InteractiveBufDelete()<CR>

"select buffer to switch to
nnoremap <leader>ls :ls<cr>:b<space>

"overide unimpaired plugin next tag, prev tag
nnoremap ]t :tabnext<cr>
nnoremap [t :tabprevious<cr>
"copy and paste to system clipboard
nnoremap <c-c> "+y
nnoremap <c-p> "+p

"escape from terminal
tnoremap jk <c-\><c-n>

"stop running process and run last command in a vim terminal
nnoremap <leader>j :call term_sendkeys(2,"\<c-c>\<up>\<cr>")<cr>
nnoremap <leader>p :call term_sendkeys(2,"ll")<cr>

"###################################################################
"######################### plugins #################################
"###################################################################

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'michaeljsmith/vim-indent-object'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'justinmk/vim-sneak'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
"enable sneak label mode
let g:sneak#label = 1

"map ,, to do default ',' behaviour (also fixes f behaviour)
map ,, <Plug>Sneak_,
