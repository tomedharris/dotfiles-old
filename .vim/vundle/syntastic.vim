if exists("g:vundle_install_plugin")
  Plugin 'scrooloose/syntastic'
  let g:syntastic_php_checkers = ['php', 'phpcs']
  let g:syntastic_javascript_checkers = ['jshint']
  let g:syntastic_php_phpcs_args="--standard=psr2"
endif
