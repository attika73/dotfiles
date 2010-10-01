" Who needs .gvimrc?
  if has('gui_running')
    set encoding=utf-8
    set guifont=Consolas\ 11
    "set guioptions+=e
    "set tb=icons
    "set guioptions-=T
    colorscheme vividchalk
    set lines=60
    set columns=120
    function! GuiTabLabel()
	" add the tab number
	let label = '['.tabpagenr()

	" modified since the last save?
	let buflist = tabpagebuflist(v:lnum)
	for bufnr in buflist
	    if getbufvar(bufnr, '&modified')
		    let label .= '*'
		    break
	    endif
	endfor

	" count number of open windows in the tab
	let wincount = tabpagewinnr(v:lnum, '$')
	if wincount > 1
	    let label .= ', '.wincount
	endif
	let label .= '] '

	" add the file name without path information
	let n = bufname(buflist[tabpagewinnr(v:lnum) - 1])
	let label .= fnamemodify(n, ':t')

	return label
    endfunction
  set guitablabel=%{GuiTabLabel()}
  else
    colorscheme vividchalk
  end
