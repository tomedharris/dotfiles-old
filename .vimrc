let mapleader=","

syntax enable           " enable sytax processing
set tabstop=4           " number of visual spaces per tab
set shiftwidth=4		" when indenting with '>', use 4 spaces width
set expandtab 			" tabs are spaces

set backspace=2         " Make backspace work like other apps
set mouse=a             " use mouse
set number 			    " show line numbers

filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matchi block delimiter
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

set background=dark     " dark UI
colorscheme badwolf

if $TERM == "xterm-256color"
    set t_Co=256            " yes I use a 256 color terminal
endif

" show whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" set foldenable          " enable folding
" set foldlevelstart=10   " open most folds by default
" set foldnestmax=10      " 10 nested fold max
" set foldmethod=indent   " fold based on indent level

" -- Movement --
" move vertically by visual line
nnoremap j gj
" move vertically by visual line
nnoremap k gk

" exit inset mode with jj
imap jj <Esc>

" highlight last inserted text
nnoremap gV `[v`]

" Remap the change window keys to Ctrl (direction)
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" disable ex mode binding
nnoremap Q <nop>

" show undo tree
nnoremap <leader>u :GundoToggle<CR>

" Remove whitespace
command RemoveWhiteSpace :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl
cnoreabbrev rws RemoveWhiteSpace

cnoreabbrev vres vertical resize

" Compile sass
command Sassc :!sass % %:h/%:t:r.css

" map :W to :w
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

" map Ctrl-S to save
nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>a

" allow sass file treatment for .scss files
au BufRead,BufNewFile *.scss set filetype=scss.css

" invisibles
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" ==============================================================================
" Vundle & plugins config
" ==============================================================================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My plugins
" Source all of the .vim files in ~/.vim/vundle directory
" install plugins.
let g:vundle_install_plugin = 1
for file in split(glob('~/.vim/vundle/*.vim'), '\n')
    exe 'source' file
endfor
unlet g:vundle_install_plugin


" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required


" Config my plugins
" Source all of the .vim files in ~/.vim/vimrc.d/vundle directory
" config plugins.
for file in split(glob('~/.vim/vundle/*.vim'), '\n')
    exe 'source' file
endfor

" ==============================================================================
" End vundle
" ==============================================================================

" ==============================================================================
" Functions
" ==============================================================================

for file in split(glob('~/.vim/functions/*.vim'), '\n')
    exe 'source' file
endfor

" ==============================================================================
" End functions
" ==============================================================================

set exrc                            " enable per-directory .vimrc files
set secure                          " disable unsafe commands in local .vimrc files
set directory=$HOME/.vim/backups/   " Default directory for backups
