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
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching block delimiter
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

set background=dark     " dark UI
colorscheme badwolf

if $TERM == "xterm-256color"
    set t_Co=256        " yes I use a 256 color terminal
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
Plug 'xsbeats/vim-blade'
Plug 'vim-scripts/BufOnly.vim'
Plug 'csscomb/vim-csscomb'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'groenewege/vim-less'
Plug 'fatih/vim-go'
Plug 'leafo/moonscript-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Lokaltog/vim-easymotion'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'shawncplus/phpcomplete.vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'evidens/vim-twig'

Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<Leader>s"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

Plug 'kien/ctrlp.vim'
    map <C-p> :CtrlP<cr>

Plug 'Raimondi/delimitMate'
    let delimitMate_expand_cr = 1
    let g:delimitMate_expand_space = 1

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

Plug 'taiansu/nerdtree-ag'
    nnoremap <Leader>n :NERDTreeToggle<CR>
    nnoremap <Leader>f :NERDTreeFind<CR>
    let NERDTreeChDirMode=1
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plug 'tobyS/pdv'
    let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
    nnoremap <Leader>pd :call pdv#DocumentWithSnip()<CR>

Plug 'scrooloose/syntastic'
    let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
    let g:syntastic_php_phpcs_args = "--standard=psr2"
    let g:syntastic_php_phpmd_post_args = "codesize,design,unusedcode,naming"
    let g:syntastic_javascript_checkers = ['jsl']

Plug 'joonty/vdebug'
    let g:vdebug_options = {
    \    'break_on_open': 0,
    \    'continuous_mode': 1
    \  }
    set laststatus=2
    let g:airline_powerline_fonts = 1
    let g:airline_theme = 'distinguished'

Plug 'embear/vim-localvimrc'
    let g:localvimrc_ask = 0

Plug 'tobyS/vmustache'
    call plug#end()

filetype plugin indent on    " required

" ========================================================================
" End Plugins
" ========================================================================

" ========================================================================
" Functions
" ========================================================================

for file in split(glob('~/.vim/functions/*.vim'), '\n')
    exe 'source' file
endfor

" ========================================================================
" End functions
" ========================================================================

set exrc                            " enable per-directory .vimrc files
set secure                          " disable unsafe commands in local .vimrc files
set directory=$HOME/.vim/backups/   " Default directory for backups
