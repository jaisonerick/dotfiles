function! s:plug_gx()
  if getline('.') =~ '^\s*Plug\s'
    let cfile = expand('<cfile>')
    if cfile !~ 'github\.com' && !filereadable(cfile)
      let url = expand((exists("g:netrw_gx")? g:netrw_gx : 'https://github.com/'.cfile))
      call netrw#BrowseX(url, netrw#CheckIfRemote())
      return
    endif
  endif

   call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')), netrw#CheckIfRemote())
endfunction

augroup PlugGx
  nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>
augroup END
