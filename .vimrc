" Set Defaults ----------------------{{{
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
" }}}

" Global Variables ----------------------{{{
let mapleader = ","
let g:polyglot_disabled = ['sensible']
let g:everforest_background = 'hard'
let g:everforest_enable_italic = 1
let g:onedark_terminal_italics = 1
let g:sonokai_enable_italic = 1
let g:srcery_italic = 1
let g:srcery_italic_types = 1
" }}}

" YouCompleteMe ----------------------{{{
"let g:ycm_semantic_triggers = {'vim,html,css,javascript': ['re!\w{2,}'] }
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0
nmap <leader>y :YcmCompleter GoTo<CR>
nmap <leader>Y <Plug>(YCMFindSymbolInWorkspace)
" }}}

" ALE ----------------------{{{
let g:ale_enabled = 0
let g:ale_completion_enabled = 0
let g:ale_fixers = {
  \ '*':          ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint'],
  \ }
nnoremap <F5> :ALEToggle<CR>
nnoremap <F6> :ALEFix<CR>
nnoremap <F7> :ALEDetail<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}}

" vim-fugitive ----------------------{{{
nnoremap <F9> :0Git<CR>
nnoremap <F10> :Gvdiffsplit<CR>
nnoremap <F12> :Git log<CR>
nnoremap <leader>C :Git commit<CR>
nnoremap <leader>G :Git<CR>
nnoremap <leader>S :Gwrite<CR>
inoremap <leader>S :Gwrite<CR>
" }}}

" vim-gitgutter ----------------------{{{
nnoremap <F8> :GitGutterToggle<CR>
nmap <leader>, <Plug>(GitGutterStageHunk)
nmap <leader>. <Plug>(GitGutterUndoHunk)
nnoremap <leader>F :GitGutterFold<CR>
" }}}

" fern.vim ----------------------{{{
let g:fern#default_hidden = 1
let g:fern#hide_cursor = 1
nnoremap <silent> <C-N> :Fern . -drawer -reveal=% -toggle<CR>
" }}}

" vim-airline ----------------------{{{
let g:airline_section_c = '%m%r %F'
let g:airline_section_y = '#%n'
let g:airline_section_z = '%p%% %l/%L : %v'
" }}}

" vim-plug ----------------------{{{
call plug#begin('~/.vim/plugged')

Plug 'ycm-core/YouCompleteMe'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/fern.vim'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/everforest'
Plug 'sainnhe/sonokai'
Plug 'srcery-colors/srcery-vim'
Plug 'vim-airline/vim-airline'

call plug#end()
" }}}

" Global Options ----------------------{{{
set autoread
set background=dark
set completeopt=popup,menuone
set cursorcolumn
set cursorline
set directory=$HOME/.vim/swap//
set expandtab
set hidden
set history=1000
set hlsearch
set ignorecase
set iskeyword+=-
set laststatus=2
set linebreak
set listchars=space:_,tab:>~
set mouse=a
set noerrorbells
set noshowmode
set number
set scrolloff=4
set shiftwidth=2
set shortmess+=FA
set smartcase
set splitright
set splitbelow
set switchbuf=usetab
set tabstop=2
set termguicolors
set title
set updatetime=100
set visualbell
set wildignore+=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*
set wildmode=longest,full
"colorscheme everforest
colorscheme onedark
"colorscheme sonokai
"colorscheme srcery
" }}}

" Global Normal Maps ----------------------{{{
nnoremap n nzz
nnoremap N Nzz
nnoremap za zazt
nnoremap zM zMgg
nnoremap zR zRgg
nnoremap <F2> :source $MYVIMRC<CR>
nnoremap <LEFT> <C-W>h
nnoremap <RIGHT> <C-W>l
nnoremap <UP> <C-W>k
nnoremap <DOWN> <C-W>j
nnoremap - 5<C-W><
nnoremap = 5<C-W>>
nnoremap <leader>0 <C-W>=
nnoremap <leader>d' di'p2F'xx
nnoremap <leader>d" di"p2F"xx
nnoremap <leader>d` di`p2F`xx
nnoremap <leader>d[ di[pF[xx
nnoremap <leader>d{ di{pF{xx
nnoremap <leader>d( di(pF(xx
nnoremap <leader>' ciw'<C-R><C-P>"'<ESC>
nnoremap <leader>" ciw"<C-R><C-P>""<ESC>
nnoremap <leader>` ciw`<C-R><C-P>"`<ESC>
nnoremap <leader>[ ciw[<C-R><C-P>"]<ESC>
nnoremap <leader>{ ciw{<C-R><C-P>"}<ESC>
nnoremap <leader>( ciw(<C-R><C-P>")<ESC>
nnoremap <leader>a l%%a
nnoremap <leader>b :buffers<CR>
nnoremap <leader>d ^i<C-D><ESC>
nnoremap <leader>D ^d0
nnoremap <leader>e :edit<SPACE>
nnoremap <leader>E :edit $MYVIMRC<CR>
nnoremap <leader>f :xall<CR>
nnoremap <leader>g :buffer<SPACE>
nnoremap <leader>h :split<SPACE>
nnoremap <leader>H :split<CR>
nnoremap <leader>i i<CR><ESC>
nnoremap <leader>j Go<CR>
nnoremap <leader>J Go
nnoremap <leader>k ggO
nnoremap <leader>K ggO<ESC>O
nmap 	 <leader>l <C-6>
nnoremap <leader>L :set list!<CR>
nnoremap <leader>n :nohlsearch<CR>
nnoremap <leader>N :set number! number?<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>r <C-R>
nnoremap <leader>R :%s/
nnoremap <leader>s :write<CR>
nnoremap <leader>u u
nnoremap <leader>U :undo0<CR>
nnoremap <leader>v :vsplit<SPACE>
nnoremap <leader>V :vsplit<CR>
nnoremap <leader>w :bdelete<CR>
nnoremap <leader>W :bwipeout<CR>
nnoremap <leader>X ggVGc
nnoremap <leader><CR> A,<CR>
nnoremap <leader><ESC> :confirm qall<CR>
nnoremap <leader><SPACE> i,<SPACE>
nnoremap <leader><TAB> I<TAB><ESC>
" }}}

" Global Insert Maps ----------------------{{{
inoremap hj <RIGHT>,<SPACE>
inoremap jh ,<LEFT>
inoremap jj <ESC>o<CR>
inoremap jk <ESC>jA
inoremap kj <ESC>
inoremap kk <ESC>jo
inoremap hh <SPACE><SPACE><LEFT>
inoremap <leader>a <ESC>la
inoremap <leader>A <ESC>A
inoremap <leader>b <ESC>:buffers<CR>
inoremap <leader>d <ESC>o<C-D>
inoremap <leader>D <ESC>o<CR><C-D>
inoremap <leader>e <ESC>:edit<SPACE>
inoremap <leader>E <ESC>:edit $MYVIMRC<CR>
inoremap <leader>f <ESC>:xall<CR>
inoremap <leader>F <ESC>ggVGc
nnoremap <leader>g <ESC>:buffer<SPACE>
inoremap <leader>I <ESC>I
inoremap <leader>j <ESC>Go<CR>
inoremap <leader>J <ESC>Go
inoremap <leader>K <ESC>ggO<ESC>O
imap     <leader>l <ESC><C-6>
inoremap <leader>L <ESC>:set list!<CR>
inoremap <leader>n <ESC>:nohlsearch<CR>
inoremap <leader>N <ESC>:set number! number?<CR>li
inoremap <leader>o <ESC>o
inoremap <leader>O <ESC>O
inoremap <leader>p <C-R><C-P>"
inoremap <leader>q <ESC>:q<CR>
inoremap <leader>Q <ESC>:q!<CR>
inoremap <leader>r <ESC><C-R>
inoremap <leader>s <ESC>:write<CR>
inoremap <leader>u <ESC>u
inoremap <leader>U <ESC>:undo0<CR>
inoremap <leader><CR> <ESC>A,<CR>
inoremap <leader><TAB> <ESC>I<TAB><ESC>
" }}}

" Global Visual Maps ----------------------{{{
vnoremap <leader>kj <ESC>
vnoremap <leader>R :s/
vnoremap <leader><TAB> I<TAB>
vnoremap <leader>' c'<C-R><C-P>"'<ESC>
vnoremap <leader>" c"<C-R><C-P>""<ESC>
vnoremap <leader>` c`<C-R><C-P>"`<ESC>
vnoremap <leader>[ c[<C-R><C-P>"]<ESC>
vnoremap <leader>{ c{<C-R><C-P>"}<ESC>
vnoremap <leader>( c(<C-R><C-P>")<ESC>
" }}}

" Global Insert Abbreviations ----------------------{{{
iabbrev accomodate accommodate
iabbrev acommodate accommodate
iabbrev acomodate accommodate
iabbrev accommadate accommodate
iabbrev acommadate accommodate
iabbrev accomadate accommodate
iabbrev acomadate accommodate
iabbrev acknowledgement acknowledgment
iabbrev aquire acquire
iabbrev accessable accessible
iabbrev acessible accessible
iabbrev accesible accessible
iabbrev accesable accessible
iabbrev acessable accessible
iabbrev accross across
iabbrev agression aggression
iabbrev aler alert
iabbrev adn and
iabbrev apparant apparent
iabbrev aparent apparent
iabbrev apparrent apparent
iabbrev aparrent apparent
iabbrev apparantly apparently
iabbrev aparantly apparently
iabbrev aparently apparently
iabbrev aparrently apparently
iabbrev apparrently apparently
iabbrev baloon balloon
iabbrev beautifull beautiful
iabbrev beutiful beautiful
iabbrev beutifull beautiful
iabbrev butiful beautiful
iabbrev calender calendar
iabbrev chagne change
iabbrev cahnged change
iabbrev collaegue colleague
iabbrev collegue colleague
iabbrev coleague colleague
iabbrev consciencious conscientious
iabbrev concensus consensus
iabbrev delet delete
iabbrev delte delete
iabbrev deleet delete
iabbrev dlete delete
iabbrev desciption description
iabbrev embarressed embarrassed
iabbrev embarassed embarrassed
iabbrev emberrassed embarrassed
iabbrev emberessed embarrassed
iabbrev entrepeneur entrepreneur
iabbrev entreprenur entrepreneur
iabbrev entreperneur entrepreneur
iabbrev experiance experience
iabbrev flase false
iabbrev fro for
iabbrev fulfil fulfill
iabbrev jist gist
iabbrev goverment government
iabbrev guranteed guaranteed
iabbrev guidence guidance
iabbrev indentifier identifier
iabbrev idiosyncracy idiosyncrasy
iabbrev independant independent
iabbrev indispensible indispensable
iabbrev liasion liaison
iabbrev liason liaison
iabbrev licence license
iabbrev lisence license
iabbrev lollypop lollipop
iabbrev lolipop lollipop
iabbrev lolypop lollipop
iabbrev maintainance maintenance
iabbrev maintnance maintenance
iabbrev miscelaneous miscellaneous
iabbrev misscellaneous miscellaneous
iabbrev misscelaneous miscellaneous
iabbrev mispelled misspelled
iabbrev necesary necessary
iabbrev neccessary necessary
iabbrev necessery necessary
iabbrev occassion occasion
iabbrev ocassion occasion
iabbrev occured occurred
iabbrev occurrance occurrence
iabbrev ocurrence occurrence
iabbrev occurence occurrence
iabbrev occurance occurrence
iabbrev ocurrance occurrence
iabbrev particualr particular
iabbrev pasttime pastime
iabbrev perseverence perseverance
iabbrev persaverance perseverance
iabbrev persaverence perseverance
iabbrev persistant persistent
iabbrev presedence precedence
iabbrev privelege privilege
iabbrev priviledge privilege
iabbrev propoganda propaganda
iabbrev phsycology psychology
iabbrev psycology psychology
iabbrev publically publicly
iabbrev recieve receive
iabbrev recomend recommend
iabbrev reccommend recommend
iabbrev referance reference
iabbrev refered referred
iabbrev relevent relevant
iabbrev revelant relevant
iabbrev rember remember
iabbrev remeber remember
iabbrev reminice reminisce
iabbrev reminise reminisce
iabbrev restaraunt restaurant
iabbrev restaraunts restaurants
iabbrev seperate separate
iabbrev shiping shipping
iabbrev seige siege
iabbrev solider soldier
iabbrev soliders soldiers
iabbrev substitue substitute
iabbrev succesful successful
iabbrev successfull successful
iabbrev sucessful successful
iabbrev supercede supersede
iabbrev truely truly
iabbrev underate underrate
iabbrev unforseen unforeseen
iabbrev unfortunatly unfortunately
iabbrev unnecesary unnecessary
iabbrev unneccessary unnecessary
iabbrev unnecessery unnecessary
iabbrev untill until
iabbrev withold withhold
iabbrev tatoo tattoo
iabbrev teh the
iabbrev tehn then
iabbrev theif thief
iabbrev tommorrow tomorrow
iabbrev tommorow tomorrow
iabbrev tomorow tomorrow
iabbrev ture true
iabbrev vairiable variable
iabbrev varaible variable
iabbrev vairable variable
iabbrev vairiables variables
iabbrev varaibles variables
iabbrev vairables variables
iabbrev waht what
iabbrev wich which
iabbrev wierd weird
" }}}

" BufNewFile ----------------------{{{
augroup newfiles
  autocmd!
  autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
  autocmd BufNewFile * :write
augroup END
" }}}

" FileType ----------------------{{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal nowrap
  autocmd FileType vim nnoremap <buffer> <leader>x I"<ESC>
  autocmd FileType vim nnoremap <buffer> <leader>z ^x
  autocmd FileType vim inoremap <buffer> <leader>c "<SPACE>
  autocmd FileType vim inoremap <buffer> <leader>C "<CR> }}}<UP> ----------------------{{{<ESC>F"a<SPACE>
  autocmd FileType vim inoremap <buffer> < <><LEFT>
  autocmd FileType vim inoremap <buffer> ' ''<LEFT>
  autocmd FileType vim inoremap <buffer> { {}<LEFT>
  autocmd FileType vim inoremap <buffer> [ []<LEFT>
  autocmd FileType vim inoremap <buffer> ( ()<LEFT>
augroup END

augroup filetype_html
  autocmd!
  autocmd FileType html set nowrap
  autocmd FileType html nnoremap <buffer> <leader>t :0read ~/.vim/templates/skeleton.html<CR>
  autocmd FileType html nnoremap <buffer> <leader>x I<!--<ESC>A--><ESC>
  autocmd FileType html nnoremap <buffer> <leader>z ^xxxx$xxx
  autocmd FileType html inoremap <buffer> <leader>c <!--  --><ESC>F i
  autocmd FileType html inoremap <buffer> <leader>, <ESC>A></<C-X><C-O><ESC>F<i
  autocmd FileType html inoremap <buffer> <leader>. ><ESC>o<C-D></<C-X><C-O><ESC>O
  autocmd FileType html inoremap <buffer> <leader>/ </<C-X><C-O><ESC>
  autocmd FileType html inoremap <buffer> <leader>m <ESC>A /><ESC>
  autocmd FileType html inoremap <buffer> <leader>= =""<LEFT>
  autocmd FileType html inoremap <buffer> ( ()<LEFT>
augroup END

augroup filetype_css
  autocmd!
  autocmd FileType css setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd FileType css setlocal nowrap
  autocmd FileType css nnoremap <buffer> <leader>x I/*<ESC>A*/<ESC>
  autocmd FileType css nnoremap <buffer> <leader>z ^xx$xx
  autocmd FileType css nnoremap <buffer> <leader>m A;<ESC>
  autocmd FileType css inoremap <buffer> <leader>c /*  */<ESC>F i
  autocmd FileType css inoremap <buffer> <leader>,  ;<LEFT>
  autocmd FileType css inoremap <buffer> <leader>.  {<ESC>o}<ESC>O
  autocmd FileType css inoremap <buffer> <leader>m <ESC>A;
  autocmd FileType css inoremap <buffer> ( ()<LEFT>
augroup END

augroup filetype_javascript
  autocmd!
  autocmd FileType javascript setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd FileType javascript setlocal nowrap
  autocmd FileType javascript nnoremap <buffer> <leader>x I//<ESC>
  autocmd FileType javascript nnoremap <buffer> <leader>z ^xx
  autocmd FileType javascript nnoremap <buffer> <leader>m A;
  autocmd FileType javascript nnoremap <buffer> <leader>? A<SPACE>?<CR>
  autocmd FileType javascript nnoremap <buffer> <leader>m A;<ESC>
  autocmd FileType javascript nnoremap <buffer> <leader>M A;<CR>
  autocmd FileType javascript nnoremap <buffer> <leader>; jA;<ESC>
  autocmd FileType javascript inoremap <buffer> <leader>c //<SPACE>
  autocmd FileType javascript inoremap <buffer> <leader>C /*<CR>*/<ESC>kA<SPACE>
  autocmd FileType javascript inoremap <buffer> <C-c> /**<CR><SPACE>*/<ESC>O*<SPACE>
  autocmd FileType javascript inoremap <buffer> <leader>, ;<LEFT>
  autocmd FileType javascript inoremap <buffer> <leader>. <ESC>A {<ESC>o}<ESC>O
  autocmd FileType javascript inoremap <buffer> <leader>/ <SPACE>{<CR>}<ESC>O
  autocmd FileType javascript inoremap <buffer> <leader>m <ESC>A;
  autocmd FileType javascript inoremap <buffer> <leader>M <ESC>A;<CR>
  autocmd FileType javascript inoremap <buffer> <leader>; <ESC>jA;
  autocmd FileType javascript inoremap <buffer> <leader>? <ESC>$i<SPACE>?<CR>
  autocmd FileType javascript inoremap <buffer> <leader>: <ESC>$i<SPACE>:<CR>
  autocmd FileType javascript inoremap <buffer> <leader>9 (<CR>)<ESC>O
  autocmd FileType javascript inoremap <buffer> <leader>` `<CR>`<ESC>O<TAB>
  autocmd FileType javascript inoremap <buffer> <leader>{ {<CR>}<ESC>O
  autocmd FileType javascript inoremap <buffer> <BAR> <BAR><BAR>
  autocmd FileType javascript inoremap <buffer> & &&
  autocmd FileType javascript inoremap <buffer> ( ()<LEFT>
  autocmd FileType javascript inoremap <buffer> [ []<LEFT>
  autocmd FileType javascript inoremap <buffer> { {}<LEFT>
  autocmd FileType javascript inoremap <buffer> ' ''<LEFT>
  autocmd FileType javascript inoremap <buffer> " ""<LEFT>
  autocmd FileType javascript inoremap <buffer> ` ``<LEFT>
  autocmd FileType javascript inoremap <buffer> <leader>' '
  autocmd FileType javascript inoremap <buffer> <leader>" "
augroup END
" }}}
