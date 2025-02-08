" Colemak remap
" Inspired by https://github.com/jooize/vim-colemak

" Legend
" <C-X>     Ctrl-X
" (c     )  Command-line mode
" ( i    )  Insert mode
" (  n   )  Normal mode
" (   o  )  Operator pending
" (    v )  Visual+Select mode
" (     x)  Visual mode

"    e    |    k
"  h   i  |  h   l
"    n    |    j

" Left
noremap h h
" Down
noremap n j
" Up
noremap e k
" Right
noremap i l

" Back word
noremap l b
" Back WORD
noremap L B
" Forward end of word
noremap u e
" Forward end of WORD
noremap U E
" Forward word
noremap y w
" Forward WORD
noremap Y W

" Visual
nnoremap a v
" Cycle Visual bloc
xnoremap a <C-V>
" Visual line
nnoremap A V
xnoremap A V
" Visual bloc
nnoremap <C-A> <C-V>
xnoremap <C-A> <C-V>

" Replace
nnoremap r r
xnoremap r r
" Replace
nnoremap R R
xnoremap R R

" Insert
nnoremap s i
" Inner operator (operator pending & visual mode)
" Example: dip -> dsp (Delete inner paragraph)
" Example: viw -> asw (Select inner word)
onoremap s i
xnoremap s i
" onoremap s i
" Insert start of line
nnoremap S I
xnoremap S I

" Append
nnoremap t a
" Outer operator (operator pending & visual mode)
onoremap t a
xnoremap t a
" Append at end of line
nnoremap T A
xnoremap T A

" Change
nnoremap w c
xnoremap w c
" Change to end of line
nnoremap W C
" Change line
nnoremap ww cc

" Insert line before
nnoremap O O<Esc>
" Insert line after
nnoremap o o<Esc>

" Uppercase selection
xnoremap O U
" Lowercase selection
xnoremap o u
" Uppercase
noremap gO gU
" Lowercase
noremap go gu

" Escape with ; in visual mode
xnoremap ; <Esc>
" Escape with ;; in insert mode
inoremap ;; <Esc>

" Enter command mode with <space>
nnoremap <space> :
xnoremap <space> :

" Undo
nnoremap z u
" Redo
nnoremap Z <C-R>
" Undo all latest changes on line
nnoremap gz U
" Cut
nnoremap x x
xnoremap x x
" Cut line
nnoremap X dd
xnoremap X dd
" Copy
nnoremap c y
xnoremap c y
" Copy line
nnoremap cc yy
nnoremap C yy
" Paste
nnoremap v p
xnoremap v p
nnoremap V P
xnoremap V P
nnoremap gv gp
xnoremap gv gp
nnoremap gV gP
xnoremap gV gP

" Before next t{char}
noremap p t
" After previous t{char}
noremap P T
" Repeat latest f or t
noremap b ;
" Repeat latest f or t reversed
noremap B ,
" Repeat latest / or ?
noremap k n
" Repeat latest / or ? reversed
noremap K N

" Reselect last visual selection
nnoremap ga gv
" Lookup
nnoremap gK K
xnoremap gK K
" To line [count] from top of window
nnoremap ge H
xnoremap ge H
" To line [count] from bottom of window
nnoremap gn L
xnoremap gn L

" 
nnoremap j z
xnoremap j z
" Quit
nnoremap J Z
xnoremap J Z

" Next fold
nnoremap jn zj
xnoremap jn zj
nnoremap jj zj
xnoremap jj zj
" Previous fold
nnoremap je zk
xnoremap je zk
nnoremap jk zk
xnoremap jk zk

" Window left
nnoremap <C-W>h <C-W>h
xnoremap <C-W>h <C-W>h
" Window down
nnoremap <C-W>n <C-W>j
xnoremap <C-W>n <C-W>j
" Window up
nnoremap <C-W>e <C-W>k
xnoremap <C-W>e <C-W>k
" Window right
nnoremap <C-W>i <C-W>l
xnoremap <C-W>i <C-W>l
