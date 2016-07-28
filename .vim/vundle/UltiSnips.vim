if exists("g:vundle_install_plugin")
  if has('python') || has('python3')
    Plugin 'SirVer/ultisnips'

    " Set ultisnips triggers
    let g:UltiSnipsExpandTrigger="<Leader>s"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
  endif
endif
