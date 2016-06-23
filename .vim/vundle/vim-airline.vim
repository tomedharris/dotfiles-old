if exists("g:vundle_install_plugin")
  Plugin 'bling/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'

  set laststatus=2
  let g:airline_powerline_fonts = 1
  if has("gui_running")
      let g:airline_theme = 'badwolf'
  else
      let g:airline_theme = 'solarized'
  endif
endif
