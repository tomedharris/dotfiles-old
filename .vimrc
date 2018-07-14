let mapleader=","

syntax enable           " enable sytax processing
set tabstop=4           " number of visual spaces per tab
set shiftwidth=4		" when indenting with '>', use 4 spaces width
set expandtab 			" tabs are spaces

set backspace=2         " make backspace work more naturally to me
set mouse=a             " use mouse
set number 			    " show line numbers

set splitright          " vertical splits open on the right

filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching block delimiter
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

set background=dark     " dark UI
colorscheme badwolf

if $TERM == "xterm-256color"
    set t_Co=256        " yes I use a 256 color terminal
endif

" set termguicolors

" show trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
let s:activatedhltrailingws = 1
function! ToggleHighlightTrailingWhitespace()
    if s:activatedhltrailingws == 0
        let s:activatedhltrailingws = 1
        match ExtraWhitespace /\s\+$/
    else
        let s:activatedhltrailingws = 0
        match ExtraWhitespace /^---------- YES OK THIS SUCKS ----------$/
    endif
endfunction
nnoremap <leader>k :call ToggleHighlightTrailingWhitespace()<CR>
call ToggleHighlightTrailingWhitespace()

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

" allow sass file treatment for .scss files
au BufRead,BufNewFile *.scss set filetype=scss.css

" invisibles
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" ========================================================================
" Terminal mappings
" ========================================================================
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif

" ========================================================================
" Plugins
" ========================================================================

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')


Plug 'mileszs/ack.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
    nnoremap <Leader>n :NERDTreeToggle<CR>
    let NERDTreeChDirMode=1

Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'

Plug 'kien/ctrlp.vim'
    map <C-p> :CtrlP<cr>

Plug 'Raimondi/delimitMate'
    let delimitMate_expand_cr = 1
    let g:delimitMate_expand_space = 1

Plug 'vim-airline/vim-airline-themes'
    set laststatus=2
    let g:airline_powerline_fonts = 1
    let g:airline_theme = 'distinguished'

Plug 'airblade/vim-gitgutter'
    let g:gitgutter_sign_modified = '┄'


Plug 'Xuyuanp/nerdtree-git-plugin'
    let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ "Unknown"   : "?"
        \ }
    let g:NERDTreeMinimalUI = 1

call plug#end()

filetype plugin indent on    " required

" ========================================================================
" End Plugins
" ========================================================================

set exrc                            " enable per-directory .vimrc files
set secure                          " disable unsafe commands in local .vimrc files
set directory=$HOME/.vim/backups/   " Default directory for backups
