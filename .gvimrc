colorscheme badwolf

" Disable all blinking:
set guicursor+=a:blinkon0

" Overriding the default font for Linux
if has("gui_gtk2")
  set guifont=Source\ Code\ Pro\ for\ Powerline\ Semibold\ 10
  set background=dark
  map <silent> <F11>
  \  :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
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

set guioptions-=T " Disable the toolbar
set guioptions-=m " Disable the menubar
set guioptions-=r " Disable the right scroll bar
set guioptions-=L " Disable the left scroll bar

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

