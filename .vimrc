"set number 
"// LAST UPDATED
set autoindent 

syntax on 
 
"This is for auto-completion via tab 
function! Tab_Or_Complete()
	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
		return "\<C-N>"
	else
		return "\<Tab>"
	endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

"''''''''''''''''''''''''''''''''
set selectmode=mouse 

set incsearch 

set mouse=a 

"set showmatch 

command Preview :!firefox %<CR>
"For setting date : 
":r !echo strftime("%c") 
":r! date 
"".!date 

":3 d
":r !echo "// LAST UPDATED" 
":r !date
"dd
"
"
set nu 

" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" " 'Last modified: ' can have up to 10 characters before (they are retained).
" " Restores cursor and window position using save_cursor variable.
function! LastModified()
  if &modified
       let save_cursor = getpos(".")
       let n = min([20, line("$")])
       keepjumps exe '1,' . n . 's#^\(.\{,10}Last modified: \).*#\1' .
		\ strftime('%a %b %d, %Y  %I:%M%p') . '#e'
       call histdel('search', -1)
       call setpos('.', save_cursor)
  endif
endfun
autocmd BufWritePre * call LastModified()

:nnoremap <F5> "=strftime("%c")<CR>P

:au BufWritePre *.c exe "norm mz"|exe '%s/\(<!-- DATE -->\).\{-\}\d\d:\d\d:\d\d/\1'.strftime("%b %d, %Y %X")."/e"|norm `z


"Added for ctags : Fri Feb 24 20:06:19 IST 2012
filetype plugin on

"Select your lines with VISUAL BLOCK (CTRL-V), then press I to insert before all highlighted lines. Next type your comment character, # (for python, shell, etc). Last press ESC.
"
"OR 
":x,y s/^/# /
"
 "
"  if has('cscope') && filereadable('/usr/bin/cscope')
"  	set csprg=/usr/bin/cscope
" 	set csto=0
"  	set cst
"  	set nocsverb
"  	"” add any database in current directory
"  	if filereadable(“cscope.out”)
"  		cs add cscope.out
"  	"	” else add database pointed to by environment
"  	elseif $CSCOPE_DB != “”
"  		cs add $CSCOPE_DB
"  	endif
"  	set csverb
"  	” Using ‘CTRL-\’ then a search type makes the vim window
"  	shell-out”, with search results displayed on the bottom
"  
"  	nmap s :cs find s =expand(“”)
"  	nmap g :cs find g =expand(“”)
"  	nmap c :cs find c =expand(“”)
"  	nmap t :cs find t =expand(“”)
"  	nmap e :cs find e =expand(“”)
"  	nmap f :cs find f =expand(“”)
"  	nmap i :cs find i ^=expand(“”)$
"  	nmap d :cs find d =expand(“”)
"  
"  	” Using ‘CTRL-spacebar’ then a search type makes the vim window
"  	” split horizontally, with search result displayed in
"  	” the new window.
"  
"  	nmap s :scs find s =expand(“”)
"  	nmap g :scs find g =expand(“”)
"  	nmap c :scs find c =expand(“”)
"  	nmap t :scs find t =expand(“”)
"  	nmap e :scs find e =expand(“”)
"  	nmap f :scs find f =expand(“”)
"  	nmap i :scs find i ^=expand(“”)$
"  	nmap d :scs find d =expand(“”)
" 
"  "	” Hitting CTRL-space *twice* before the search type does a vertical
"  "” split instead of a horizontal one
"  "
"  	nmap s :vert scs find s =expand(“”)
"  	nmap g :vert scs find g =expand(“”)
"  	nmap c :vert scs find c =expand(“”)
"  	nmap t :vert scs find t =expand(“”)
"  	nmap e :vert scs find e =expand(“”)
"  	nmap i :vert scs find i ^=expand(“”)$
"  	nmap d :vert scs find d =expand(“”)
"  
" "endif
"
"


"Cscope options : 
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
	    cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    cs add $CSCOPE_DB
	endif
	set csverb
endif

" 
" nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
" nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
" nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Using 'CTRL-spacebar' then a search type makes the vim window
" split horizontally, with search result displayed in
" the new window.

nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

" Hitting CTRL-space *twice* before the search type does a vertical
" split instead of a horizontal one

nmap <C-Space><C-Space>s
	\:vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>g
	\:vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>c
	\:vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>t
	\:vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>e
	\:vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>i
	\:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space><C-Space>d
	\:vert scs find d <C-R>=expand("<cword>")<CR><CR>



"Color texts & backgrounds : 
"hi normal   ctermfg=white  ctermbg=blue guifg=white  guibg=black
"hi nontext  ctermfg=blue   ctermbg=black guifg=blue   guibg=black


