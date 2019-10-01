" Vim plugin that provides an interface to the reple command-line tool
" Last Change: 2019 September 26
" Maintainer: Comrade SparklePony <comradesparklepony@gmail.com>
" License: Vim License

" RepleSend, the function that does all the work
function! RepleSend()

	" store the current text object in reple_text
	let l:save_clipboard = &clipboard
	set clipboard= 
	let l:save_reg = getreg('"')
	let l:save_regmode = getregtype('"')
	normal! yap
	let l:reple_text = @@
	call setreg('"', l:save_reg, l:save_regmode)
	let &clipboard = l:save_clipboard
	call system("reple-send " . shellescape(reple_text))

endfunction

" RepleSend, wrapper command for the function
command RepleSend :call RepleSend()
