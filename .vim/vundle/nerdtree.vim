if exists("g:vundle_install_plugin")
  Plugin 'scrooloose/nerdtree'
  Plugin 'taiansu/nerdtree-ag'
  nnoremap <Leader>n :NERDTreeToggle<CR>
  let NERDTreeChDirMode=1
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif
