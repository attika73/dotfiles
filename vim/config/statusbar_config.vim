" Change the status line based on mode
  if version >= 700
    au InsertEnter * hi StatusLine    gui=reverse
    au InsertLeave * hi StatusLine    gui=NONE
  endif
  
" Nice statusbar
  set laststatus=2
  set statusline=
  set statusline+=%2*%-3.3n%0*                    " buffer number
  set statusline+=%f                              " file name
  set statusline+=%h%1*%m%r%w%0*                  " flags
  set statusline+=[%{strlen(&ft)?&ft:'none'},     " filetype
  set statusline+=%{&encoding},                   " encoding
  set statusline+=%{&fileformat}]                 " file format
  set statusline+=%=                              " right align
  set statusline+=%2*0x%-8B                       " current char
  set statusline+=%-14.(%l,%c%V%)                 " offset