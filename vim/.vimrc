" Vim settings
" Repo: https://github.com/Maks0u/env

" Files encoding
set encoding=utf-8

" Internal files
silent !mkdir -p ~/.local/state/vim/bak
silent !mkdir -p ~/.local/state/vim/swap
silent !mkdir -p ~/.local/state/vim/undo
set backupdir=~/.local/state/vim/bak//,.,/tmp//
set directory=~/.local/state/vim/swap//,.,/tmp//
set undofile undodir=~/.local/state/vim/undo//,.,/tmp//

" Prompt confirm instead of throwing an error when trying to exit without saving
set confirm

" Indent using spaces
set autoindent expandtab shiftwidth=4 tabstop=4

" Ignore case when searching
set ignorecase

" Show relative line numbers
set number relativenumber

" Show keystrokes in status line
set showcmd

" Scroll offset
set scrolloff=10

" Virtual editing (cursor can move anywhere)
set virtualedit=all

" Don't wrap lines
set nowrap

" Leader key
let mapleader=" "
let maplocalleader=" "
noremap <Space> <Nop>

noremap <Leader>w :w<CR>
" noremap <Leader>wq :wq
noremap <Leader>q :q<CR>

" Escape with ; in visual mode
xnoremap ; <Esc>
" Escape with ;; in insert mode
" inoremap ;; <Esc>

" End of line
noremap - $

" Switch tabs in normal mode
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>

" Indent using tab in visual mode
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv

" Clear highlights on search when pressing <Esc> in normal mode
nnoremap <silent> <Esc> :noh<CR>

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
noremap H 10h
" Down
noremap n j
noremap N 5j
" Up
noremap e k
noremap E 5k
" Right
noremap i l
noremap I 10l

" Move lines up and down
nnoremap <C-e> :m<space>-2<CR>
nnoremap <C-n> :m<space>+1<CR>
xnoremap <C-e> :m '<-2<CR>gv=gv
xnoremap <C-n> :m '>+1<CR>gv=gv

" Center screen when moving
noremap { {zz
noremap } }zz

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

" Before next t{char}
noremap p t
" After previous t{char}
noremap P T
" Repeat latest f or t
noremap b ;
" Repeat latest f or t reversed
noremap B ,
" Repeat latest / or ?
noremap k nzz
" Repeat latest / or ? reversed
noremap K Nzz

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
" Reselect last visual selection
nnoremap ga gv

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
xnoremap <Leader>O U
" Lowercase selection
xnoremap <Leader>o u
" Uppercase
noremap gO gU
" Lowercase
noremap go gu

" Save and quit
noremap J ZZ
" Quit without saving
noremap Q ZQ

" Undo
nnoremap z u
" Redo
nnoremap Z <C-R>
" Undo all latest changes on line
nnoremap gz U
" Cut
nnoremap x vygvx
xnoremap x ygvx
" Cut line
nnoremap X yydd
xnoremap X ygvx
" Copy
nnoremap c y
xnoremap c y
" Copy line
nnoremap cc yy
nnoremap C yy
" Paste
nnoremap v p
nnoremap V P
" Always paste prevously yanked text (not deleted text)
xnoremap v "0P
xnoremap V "0P

" 
nnoremap j z
xnoremap j z

" Lookup
nnoremap gK K
xnoremap gK K
" To line [count] from top of window
nnoremap ge H
xnoremap ge H
" To line [count] from bottom of window
nnoremap gn L
xnoremap gn L

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

"
" Custom surround actions
"
function! Surround(open, close)
    let l:default_register = @"
    execute "normal! gvc" . a:open
    execute "normal! pa" . a:close
    let @" = l:default_register
endfunction

function! SurroundInput()
    let l:chars = input("Surround: ")
    if len(l:chars) != 2
        echo "\nInvalid input"
    else
        call Surround(l:chars[0], l:chars[1])
    endif
endfunction

function! DeleteSurround(char)
    let l:default_register = @"
    if a:char == "'" || a:char == '"' || a:char == "`"
        execute "normal! vi" . a:char . "yva" . a:char . "h\"_dP"
    else
        execute "normal! vi" . a:char . "yva" . a:char . "\"_dP"
    endif
    let @" = l:default_register
endfunction

function! ChangeSurround(char, open, close)
    let l:default_register = @"
    if a:char == "'" || a:char == '"' || a:char == '`'
        execute "normal! vi" . a:char . "yva" . a:char . "h\"_d"
    else
        execute "normal! vi" . a:char . "yva" . a:char . "\"_d"
    endif
    execute "normal! i" . a:open
    execute "normal! p"
    execute "normal! a" . a:close
    let @" = l:default_register
endfunction

xnoremap <Leader>s :<C-u>call SurroundInput()<CR>

xnoremap <Leader>b :<C-u>call Surround('(',')')<CR>
xnoremap <Leader>( :<C-u>call Surround('(',')')<CR>
xnoremap <Leader>) :<C-u>call Surround('( ',' )')<CR>
xnoremap <Leader>B :<C-u>call Surround('{','}')<CR>
xnoremap <Leader>{ :<C-u>call Surround('{','}')<CR>
xnoremap <Leader>} :<C-u>call Surround('{ ',' }')<CR>
xnoremap <Leader>[ :<C-u>call Surround('[',']')<CR>
xnoremap <Leader>] :<C-u>call Surround('[ ',' ]')<CR>
xnoremap <Leader>' :<C-u>call Surround("'","'")<CR>
xnoremap <Leader>" :<C-u>call Surround('"','"')<CR>
xnoremap <Leader>` :<C-u>call Surround('`','`')<CR>

nnoremap <Leader>db :<C-u>call DeleteSurround('(')<CR>
nnoremap <Leader>d( :<C-u>call DeleteSurround('(')<CR>
nnoremap <Leader>d) :<C-u>call DeleteSurround('(')<CR>
nnoremap <Leader>dB :<C-u>call DeleteSurround('{')<CR>
nnoremap <Leader>d{ :<C-u>call DeleteSurround('{')<CR>
nnoremap <Leader>d} :<C-u>call DeleteSurround('{')<CR>
nnoremap <Leader>d[ :<C-u>call DeleteSurround('[')<CR>
nnoremap <Leader>d] :<C-u>call DeleteSurround('[')<CR>
nnoremap <Leader>d' :<C-u>call DeleteSurround("'")<CR>
nnoremap <Leader>d" :<C-u>call DeleteSurround('"')<CR>
nnoremap <Leader>d` :<C-u>call DeleteSurround('`')<CR>

nnoremap <Leader>cbB :<C-u>call ChangeSurround('(','{','}')<CR>
nnoremap <Leader>cb{ :<C-u>call ChangeSurround('(','{','}')<CR>
nnoremap <Leader>cb} :<C-u>call ChangeSurround('(','{','}')<CR>
nnoremap <Leader>cb[ :<C-u>call ChangeSurround('(','[',']')<CR>
nnoremap <Leader>cb] :<C-u>call ChangeSurround('(','[',']')<CR>
nnoremap <Leader>cb' :<C-u>call ChangeSurround('(',"'","'")<CR>
nnoremap <Leader>cb" :<C-u>call ChangeSurround('(','"','"')<CR>
nnoremap <Leader>cb` :<C-u>call ChangeSurround('(','`','`')<CR>

nnoremap <Leader>cBb :<C-u>call ChangeSurround('{','(',')')<CR>
nnoremap <Leader>cB( :<C-u>call ChangeSurround('{','(',')')<CR>
nnoremap <Leader>cB) :<C-u>call ChangeSurround('{','(',')')<CR>
nnoremap <Leader>cB[ :<C-u>call ChangeSurround('{','[',']')<CR>
nnoremap <Leader>cB] :<C-u>call ChangeSurround('{','[',']')<CR>
nnoremap <Leader>cB' :<C-u>call ChangeSurround('{',"'","'")<CR>
nnoremap <Leader>cB" :<C-u>call ChangeSurround('{','"','"')<CR>
nnoremap <Leader>cB` :<C-u>call ChangeSurround('{','`','`')<CR>

nnoremap <Leader>c[b :<C-u>call ChangeSurround('[','(',')')<CR>
nnoremap <Leader>c[( :<C-u>call ChangeSurround('[','(',')')<CR>
nnoremap <Leader>c[) :<C-u>call ChangeSurround('[','(',')')<CR>
nnoremap <Leader>c[B :<C-u>call ChangeSurround('[','{','}')<CR>
nnoremap <Leader>c[{ :<C-u>call ChangeSurround('[','{','}')<CR>
nnoremap <Leader>c[} :<C-u>call ChangeSurround('[','{','}')<CR>
nnoremap <Leader>c[' :<C-u>call ChangeSurround('[',"'","'")<CR>
nnoremap <Leader>c[" :<C-u>call ChangeSurround('[','"','"')<CR>
nnoremap <Leader>c[` :<C-u>call ChangeSurround('[','`','`')<CR>

nnoremap <Leader>c'b :<C-u>call ChangeSurround("'",'(',')')<CR>
nnoremap <Leader>c'( :<C-u>call ChangeSurround("'",'(',')')<CR>
nnoremap <Leader>c') :<C-u>call ChangeSurround("'",'(',')')<CR>
nnoremap <Leader>c'B :<C-u>call ChangeSurround("'",'{','}')<CR>
nnoremap <Leader>c'{ :<C-u>call ChangeSurround("'",'{','}')<CR>
nnoremap <Leader>c'} :<C-u>call ChangeSurround("'",'{','}')<CR>
nnoremap <Leader>c'[ :<C-u>call ChangeSurround("'",'[',']')<CR>
nnoremap <Leader>c'] :<C-u>call ChangeSurround("'",'[',']')<CR>
nnoremap <Leader>c'" :<C-u>call ChangeSurround("'",'"','"')<CR>
nnoremap <Leader>c'` :<C-u>call ChangeSurround("'",'`','`')<CR>

nnoremap <Leader>c"b :<C-u>call ChangeSurround('"','(',')')<CR>
nnoremap <Leader>c"( :<C-u>call ChangeSurround('"','(',')')<CR>
nnoremap <Leader>c") :<C-u>call ChangeSurround('"','(',')')<CR>
nnoremap <Leader>c"B :<C-u>call ChangeSurround('"','{','}')<CR>
nnoremap <Leader>c"{ :<C-u>call ChangeSurround('"','{','}')<CR>
nnoremap <Leader>c"} :<C-u>call ChangeSurround('"','{','}')<CR>
nnoremap <Leader>c"[ :<C-u>call ChangeSurround('"','[',']')<CR>
nnoremap <Leader>c"] :<C-u>call ChangeSurround('"','[',']')<CR>
nnoremap <Leader>c"' :<C-u>call ChangeSurround('"',"'","'")<CR>
nnoremap <Leader>c"` :<C-u>call ChangeSurround('"','`','`')<CR>

nnoremap <Leader>c`b :<C-u>call ChangeSurround('`','(',')')<CR>
nnoremap <Leader>c`( :<C-u>call ChangeSurround('`','(',')')<CR>
nnoremap <Leader>c`) :<C-u>call ChangeSurround('`','(',')')<CR>
nnoremap <Leader>c`B :<C-u>call ChangeSurround('`','{','}')<CR>
nnoremap <Leader>c`{ :<C-u>call ChangeSurround('`','{','}')<CR>
nnoremap <Leader>c`} :<C-u>call ChangeSurround('`','{','}')<CR>
nnoremap <Leader>c`[ :<C-u>call ChangeSurround('`','[',']')<CR>
nnoremap <Leader>c`] :<C-u>call ChangeSurround('`','[',']')<CR>
nnoremap <Leader>c`' :<C-u>call ChangeSurround('`',"'","'")<CR>
nnoremap <Leader>c`" :<C-u>call ChangeSurround('`','"','"')<CR>
