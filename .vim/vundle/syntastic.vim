if exists("g:vundle_install_plugin")
  Plugin 'scrooloose/syntastic'
  let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
  let g:syntastic_php_phpcs_args = "--standard=psr2"
  let g:syntastic_php_phpmd_post_args = "codesize,design,unusedcode,naming"
  let g:syntastic_javascript_checkers = ['jshint']
endif
