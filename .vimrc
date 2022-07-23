" Set Defaults ----------------------{{{
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
" }}}

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'ycm-core/YouCompleteMe'
Plug 'lambdalisue/fern.vim'

call plug#end()

" User Defined Global Options
set hidden
set number
set directory=$HOME/gdrive/coding/swap//
let g:ycm_semantic_triggers = { 'html,css,vim': ['re!.'] }

" User Defined Global Maps
nmap <silent> <C-N> :Fern . -drawer -reveal=% -toggle<CR>
nmap ,- 5<C-W><
nmap ,= 5<C-W>>
nmap ,0 <C-W>=
nmap ,<Left> <C-W><Left>
nmap ,<Right> <C-W><Right>
nmap ,<Up> <C-W><Up>
nmap ,<Down> <C-W><Down>
nmap ,v :vs<Space>
nmap ,h :sp<Space>
nmap ,n :ene<CR>
nmap ,f :sp<CR>
nmap ,d :vs<CR>
nmap ,e :e<Space>
nmap ,b :buffers<CR>
nmap ,g :b<Space>
nmap ,w :bw<CR>
nmap ,j <C-6>
nmap ,i 1<C-G>
nmap ,l Go
nmap ,k Go<CR>
nmap ,s :w<CR>
nmap ,a :x<CR>
nmap ,u :u0<CR>
imap ,s <ESC>:w<CR>
imap ,a <ESC>:x<CR>
imap ,q <ESC>
imap ,o <ESC>o
imap ,O <ESC>O
imap ,k <ESC>Go<CR>
imap ,p <C-R>"

" templates augroup
augroup templates
	autocmd!
	autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
augroup END

" filetype augroups
augroup filetype_html
	autocmd!
	autocmd FileType html setl tabstop=2
	autocmd FileType html setl shiftwidth=2
	autocmd FileType html setl expandtab
	autocmd FileType html nmap <buffer> ,x I<!--<Esc>A--><Esc>
	autocmd FileType html nmap <buffer> ,z ^xxxx$xxx
	autocmd FileType html imap <buffer> ,c <!--<Space><Space>--><Esc>F<Space>i
	autocmd FileType html imap <buffer> ,, <Esc>A></<C-X><C-O><Esc>F<i
	autocmd FileType html imap <buffer> ,. ><Esc>o<C-D></<C-X><C-O><Esc>O
	autocmd FileType html imap <buffer> ,/ </<C-X><C-O><Esc>
	autocmd FileType html imap <buffer> ,m <Space>/><Esc>
	autocmd FileType html imap <buffer> ,' ""<Esc>i
	autocmd FileType html imap <buffer> ,9 ()<Esc>i
	autocmd FileType html nmap <buffer> ,t :0read ~/.vim/templates/skeleton.html<CR>
augroup END

augroup filetype_css
	autocmd!
	autocmd FileType css setl tabstop=2
	autocmd FileType css setl shiftwidth=2
	autocmd FileType css setl expandtab
	autocmd FileType css setl formatoptions-=c formatoptions-=r formatoptions-=o
	autocmd FileType css nmap <buffer> ,x I/*<Esc>A*/<Esc>
	autocmd FileType css nmap <buffer> ,z ^xx$xx
	autocmd FileType css imap <buffer> ,c /*<Space><Space>*/<Esc>F<Space>i
	autocmd FileType css imap <buffer> ,, <Space>;<Esc>i
	autocmd FileType css imap <buffer> ,. <Space>{<Esc>o}<Esc>O
	autocmd FileType css imap <buffer> ,m <Esc>A;<Esc>
	autocmd FileType css imap <buffer> ,' ""<Esc>i
	autocmd FileType css imap <buffer> ,9 ()<Esc>i
augroup END
