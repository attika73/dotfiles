" <leader>f to startup an ack search
  map <leader>f :Ack<Space>
" NERDTree
  nnoremap <silent> <F9> :NERDTreeToggle <cr>
  inoremap <silent> <F9> <Esc>:NERDTreeToggle <cr>
" Trailing spaces
  nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
  inoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" Hash racket
  imap <C-left> <Space>=><Space>"
" C-s save
  inoremap <C-s> <Esc>:w<CR>a
