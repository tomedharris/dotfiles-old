if exists("g:vundle_install_plugin")
  Plugin 'tobyS/pdv'
    let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
    nnoremap <Leader>pd :call pdv#DocumentWithSnip()<CR>
endif
