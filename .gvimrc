colorscheme badwolf

" Disable all blinking:
set guicursor+=a:blinkon0

" Overriding the default font for Linux
if has("gui_gtk2")
  set guifont=Source\ Code\ Pro\ for\ Powerline\ Semibold\ 11
  set background=dark
endif

" Overriding the default font for Mac
if has("gui_macvim")
  set guifont=Monaco:h12
endif

" Use the English menus
set langmenu=none
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Use tiny toolbar icons for Linux
if has("gui_gtk2")
  set toolbariconsize=tiny
endif

" Disable the toolbar
set guioptions-=T

" Disable the menubar
set guioptions-=m

" Disable the scroll bar
set guioptions-=r

" Change the window size
set lines=36
set columns=120

" Set the input method for Mac
if has("gui_macvim")
  set noimdisable
  set imsearch=0
  autocmd! InsertLeave * set imdisable | set iminsert=0
  autocmd! InsertEnter * set noimdisable | set iminsert=0
  autocmd! CompleteDone * set imdisable| set iminsert=0
endif

