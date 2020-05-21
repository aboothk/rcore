set number
set foldmethod =marker
let $v=$HOME.('/.vim')
"PLug{{{1
let s:bundle_dir = $v.'/plugged'

let g:plug_shallow = 0
let g:plug_window  = 'enew'
let g:plug_pwindow = 'vertical rightbelow new'
let g:deoplete#enable_at_startup = 1
call plug#begin('~/.vim/plugged')
"reference{{{2
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'tpope/vim-surround'
Plug 'tweekmonster/helpful.vim', {'on': 'MANUALLY'}
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-surround'

Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'rhysd/rust-doc.vim', {'for': 'rust'}
Plug 'lifepillar/pgsql.vim', {'for': 'sql'}
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'AndrewRadev/tagalong.vim', {'for': 'html'}
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-tree'
Plug 'mhinz/vim-grepper'
Plug 'junegunn/vim-easy-align', {'on': '<plug>(LiveEasyAlign)'}
Plug 'easymotion/vim-easymotion', {'on': '<plug>(easymotion-s2)'}
Plug 'chrisbra/unicode.vim'  ", {'on': ['UnicodeName', 'UnicodeTable']}
Plug 'mbbill/undotree'

Plug 'rhysd/committia.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-scriptease'
Plug 'junegunn/gv.vim', {'on': 'GV'}
Plug 'junegunn/vader.vim'
Plug 'mhinz/vim-crates'
Plug 'mhinz/vim-halo'
Plug 'mhinz/vim-lookup'
Plug 'mhinz/vim-mix-format'
Plug 'mhinz/vim-tree'
Plug 'godlygeek/csapprox', {'for': 'fugitiveblame' }
Plug 'AndrewRadev/splitjoin.vim'

"myself{{{
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

"statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'janko/vim-test'
Plug 'Konfekt/FastFold'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-speeddating'
"check code and completion
Plug 'dense-analysis/ale'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete-clangx'

Plug 'preservim/nerdtree'
Plug 'justinmk/vim-dirvish'
"theme
Plug 'tomasr/molokai'
Plug 'rakr/vim-one'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
call plug#end()
"}}}1
"init
"{{{1
if has('nvim')
  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
  let $ELIXIR_EDITOR = 'nvr -l +__LINE__ __FILE__'
  if v:progpath =~# 'build/bin/nvim$'
    " for build/runtime/syntax/vim/generated.vim
    let &runtimepath .= ','.$VIM.'/build/runtime'
  endif
else
  filetype plugin indent on
  syntax on
  packadd! matchit
endif

let g:vimsyn_folding = 'f'
let g:is_bash        = 1
let g:lisp_rainbow   = 1

let g:markdown_fenced_languages = ['vim']

let g:loaded_2html_plugin     = 1
let g:loaded_getscriptPlugin  = 1
let g:loaded_gzip             = 1
let g:loaded_logipat          = 1
" let g:loaded_matchparen       = 1
let g:loaded_rrhelper         = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_tarPlugin        = 1
let g:loaded_vimballPlugin    = 1
let g:loaded_zipPlugin        = 1

augroup vimrc
  autocmd!
augroup END
"}}}1
"theme
"{{{1
let g:airline_theme='one'
colorscheme one   "one | molokai
set background=light " for the dark version
" set background=light " for the light version
"}}}1
"Option
"{{{1
"indent setting 
set autoindent
set cinoptions    =l1,p0,)50,*50,t0
set expandtab
set smarttab
set softtabstop   =2
set shiftwidth    =2
set shiftround
" better navigation
"set cursorline
set foldmethod    =marker
set foldopen     -=hor
set foldopen     +=jump
set foldtext      =mhi#foldy()
set hlsearch
set incsearch
"set mouse         =a
set scrolloff     =4
set sidescroll    =5
set ignorecase
set smartcase
set tagcase       =match

" misc settings
set autoread
set backspace     =indent,eol,start
set clipboard     =unnamed
set complete     -=i
set completeopt  +=noselect
set diffopt      +=vertical,foldcolumn:0,indent-heuristic,algorithm:patience
set fileformats   =unix,dos,mac
set hidden
set history       =1000
set lazyredraw
set more
"set mousemodel    =popup
set noautowrite
set noautowriteall
set noequalalways
set noerrorbells
set nofsync
set nojoinspaces
set wrapscan
set nrformats     =hex
set pastetoggle   =<F5>
set norelativenumber
set report        =0
set sessionoptions-=options
set sessionoptions+=localoptions
set showfulltag
set showtabline   =1
set splitbelow
set splitright
set switchbuf     =
set synmaxcol     =200
set tags         ^=./.git/tags;
set timeout
set timeoutlen    =1000
set titlestring   =VIM:\ %f
set ttimeout
set ttimeoutlen   =10
set ttyfast
set virtualedit   =onemore,block
set whichwrap     =h,l

" wild stuff
set suffixes     +=.a,.1,.class
set wildignore   +=*.o,*.so,*.zip,*.png
set wildmenu
set wildoptions   =tagfile
if has('nvim-0.4.0')
  set wildoptions+=pum
else
  set wildmode=list:longest,full
endif

" display settings
set display      +=lastline
"set laststatus    =2
set list
set modeline
set modelines     =1
set nostartofline
set numberwidth   =1
set ruler
set shortmess     =aoOTI
set showcmd
set showmatch
set showmode

" spelling
set spellfile     =~/.vim/spell/en.utf-8.add,~/.vim/spell/de.utf-8.add
set spelllang     =en,de

" breaking
set wrap
set nolinebreak
set breakindent
set breakindentopt=min:40
"set highlight    +=@:SpecialKey

set cpoptions     =aABcefFqsZ
set formatoptions =tcrqnj

if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
  let &fillchars = 'vert: ,diff: '  " ▚
  let &showbreak = '↪ '
  highlight VertSplit ctermfg=242
  augroup vimrc
    autocmd InsertEnter * set listchars-=trail:⣿
    autocmd InsertLeave * set listchars+=trail:⣿
  augroup END
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
  let &fillchars = 'vert: ,stlnc:#'
  let &showbreak = '-> '
  augroup vimrc
    autocmd InsertEnter * set listchars-=trail:.
    autocmd InsertLeave * set listchars+=trail:.
  augroup END
endif
"}}}1
" Mapping
" {{{1
let mapleader = ';'
nnoremap \ ;

inoremap jf <esc>

nnoremap gh :call mhi#github_open_issue()<cr>
nnoremap gH :call mhi#github_open_slug()<cr>

inoremap <expr> <tab> mhi#tab_yeah()
inoremap <expr> <c-]> mhi#close_bracket()

nnoremap <expr> n  'Nn'[v:searchforward].'zvzz'
nnoremap <expr> N  'nN'[v:searchforward].'zvzz'

nnoremap <silent> <tab> <c-w>w
nnoremap <silent> <c-p> :call mhi#switch_buffer('bprevious')<cr>
nnoremap <silent> <c-n> :call mhi#switch_buffer('bnext')<cr>
nnoremap <silent> [b    :call mhi#switch_buffer('bprevious')<cr>
nnoremap <silent> ]b    :call mhi#switch_buffer('bnext')<cr>
nnoremap <silent> [q    :cprevious<cr>
nnoremap <silent> ]q    :cnext<cr>
nnoremap <silent> [l    :lprevious<cr>
nnoremap <silent> ]l    :lnext<cr>
nnoremap <silent> [t    :tabprevious<cr>
nnoremap <silent> ]t    :tabnext<cr>

nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

" switch comma-separated arguments
nnoremap [w  :normal F,h]w2w<cr>
nnoremap ]w  :let s=&isk \| setl isk+=\",' \| exe "norm diwmmebgPdw'mP" \| let &isk=s<cr>

nnoremap }   }zz
nnoremap {   {zz
nnoremap ]]  ]]zz
nnoremap [[  [[zz
nnoremap []  []zz
nnoremap ][  ][zz

nnoremap g;  g;zvzz
nnoremap g,  g,zvzz

"nnoremap <left>   <c-w>>
"nnoremap <right>  <c-w><
"nnoremap <up>     <c-w>-
"nnoremap <down>   <c-w>+

nnoremap <silent><a-h>  :<c-u>call mhi#tmux_navigate('h')<cr>
nnoremap <silent><a-j>  :<c-u>call mhi#tmux_navigate('j')<cr>
nnoremap <silent><a-k>  :<c-u>call mhi#tmux_navigate('k')<cr>
nnoremap <silent><a-l>  :<c-u>call mhi#tmux_navigate('l')<cr>

xnoremap <  <gv
xnoremap >  >gv

onoremap gv  :<c-u>normal! gv<cr>

nnoremap Q  gqap

nnoremap <leader>ev  :edit $MYVIMRC<cr>
nnoremap <leader>em  :edit ~/.vim/autoload/mhi.vim<cr>

nnoremap <leader>si  :echo mhi#syninfo()<cr>
nnoremap <leader>ss  :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<cr>

nnoremap <leader>m  :Messages<cr>
nnoremap <leader>M  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
" nnoremap <leader>o  :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<cr> \| xargs open<cr><cr>
nnoremap <leader>o  :silent !open <c-r>=fnameescape('<c-r><c-a>')<cr><cr>
nnoremap <leader>w  :update<cr>
nnoremap <leader>x  :xit<cr>
nnoremap <leader>l  :noh<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
nnoremap <leader>v  :Runtime<cr>
nnoremap <leader>t  :Tree<cr>
nnoremap <silent> <leader>d  :exe 'sil !open' fnameescape(printf('https://devdocs.io/#q=%s%%20%s', &ft, expand('<cword>')))<cr>

nnoremap <silent><leader>b  :call mhi#git_blame_current_line()<cr>

nnoremap '  `
nnoremap `  '

nnoremap <bs>  <c-t>
nnoremap <silent><cr>  :call mhi#jump()<cr>

"cnoremap <c-n>  <down>
"cnoremap <c-p>  <up>

cnoremap <leader>r   $VIMRUNTIME/
cnoremap <leader>ft  ~/.vim/after/ftplugin/

xnoremap *          :<c-u>call mhi#search()<cr>//<cr>
xnoremap #          :<c-u>call mhi#search()<cr>??<cr>
xnoremap <leader>*  :<c-u>silent! execute mhi#search_all()<cr>

if has('nvim')
  nnoremap <leader>T      :vsplit +terminal<cr>
  tnoremap <esc>          <c-\><c-n>
  tnoremap <silent><a-h>  <c-\><c-n>:<c-u>call mhi#tmux_navigate('h')<cr>
  tnoremap <silent><a-j>  <c-\><c-n>:<c-u>call mhi#tmux_navigate('j')<cr>
  tnoremap <silent><a-k>  <c-\><c-n>:<c-u>call mhi#tmux_navigate('k')<cr>
  tnoremap <silent><a-l>  <c-\><c-n>:<c-u>call mhi#tmux_navigate('l')<cr>
endif

if !has('nvim')
  if empty($TMUX)
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  else
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  endif
endif
"}}}1
"Autazocmd
"{{{1
  " foldopen=hor sucks
  autocmd BufWinEnter * normal! zvzz

  if has('nvim')
    autocmd TermOpen,BufEnter term://* startinsert
  endif

  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   execute 'normal! g`"' |
        \ endif

"  autocmd WinEnter    * set cursorline
"  autocmd WinLeave    * set nocursorline
"  autocmd InsertEnter * set nocursorline
"  autocmd InsertLeave * set cursorline

  autocmd CompleteDone * pclose
augroup END

" Command {{{2
command! -nargs=1 -complete=command Scratch call mhi#scratch(<f-args>)
"command! CleanSpell  runtime! spell/cleanadd.vim
command! Cd call mhi#cd()
" command! Evo exe printf('GV -L :%s:%s', expand('<cword>'), expand('%:p'))
command! Changed exe 'args' join(map(systemlist('git diff --name-only --relative "$@" 2>/dev/null'), 'fnameescape(v:val)'))
command! -nargs=1 -bang T call mhi#terminal(<bang>0, <f-mods>, <f-args>)
"}}}1
" Filetype
" {{{1
augroup vimrc
  " Filetype: Assembly {{{2
  let g:asmsyntax = 'nasm'
  " vim-commentary uses 'commentstring', not 'comments'
  autocmd FileType nasm let &commentstring = '; %s'

  " Filetype: C {{{2
  autocmd BufLeave *.{c,cpp} mark C
  autocmd BufLeave *.h       mark H

  " -> after/ftplugin/c.vim

  " Filetype: cmake {{{2
  autocmd FileType cmake setlocal commentstring=#\ %s

  " Filetype: crontab {{{2
  autocmd FileType crontab setlocal nobackup nowritebackup

  " Filetype: Erlang {{{2
  autocmd FileType erlang setl com-=:%

  " Filetype: Go {{{2
  let g:go_bin_path    = $v.'/vendor/go'
  let g:go_fmt_command = 'goimports'
  let g:gofmt_on_save  = 0

  autocmd FileType go setlocal noet sts& sw& com-=:// isk-=. lcs+=tab:\ \ 

  " Filetype: Help {{{2
  autocmd FileType help
        \  setl noet
        \| execute 'silent wincmd' 'TL'[winnr('$') == 2]

  " Filetype: HTML {{{2
  autocmd FileType html setl et sts=2 sw=2

  " Filetype: Lua {{{2
  autocmd FileType lua setl com-=:# sts=2 sw=2

  " Filetype: Perl {{{2
  let perl_include_pod = 1

  autocmd FileType perl
        \  setlocal com-=:# kp=perldoc\ -f
        \| compiler perl

  " Filetype: Python {{{2
  let python_highlight_all = 1

  autocmd FileType python
        \  setlocal kp=pydoc mp=./%
        \| compiler pyunit

  " Filetype: Ruby {{{2
  let g:ruby_operators                 = 1
  let g:ruby_space_errors              = 1
  let g:rubycomplete_buffer_loading    = 1
  let g:rubycomplete_classes_in_global = 1
  let g:rubycomplete_rails             = 1

  function! s:ruby()
    command! -buffer -bang Rubocop exe 'Grepper -tool rubocop -noprompt' ['-buffer',''][<bang>0]
    command! -buffer -nargs=* -bang Rspec exe '<mods> T clear; bundle exec rspec <args>' expand('%:p').['', ':'.line('.')][<bang>0]
    nnoremap <buffer> <leader>rs :vertical Rspec!<cr>
  endfunction

  autocmd BufNewFile *.rb call append(0, ['#!/usr/bin/env ruby', ''])
  autocmd FileType ruby call s:ruby()

  " -> after/ftplugin/ruby.vim

  " Filetype: Rust {{{2
  if has('nvim')
    autocmd BufRead Cargo.toml call crates#toggle()
  endif

  " Filetype: Sh, Zsh {{{2
  au FileType zsh,sh setl com-=:# sts=4 sw=4
        \| com! -buffer Lint Grepper -noprompt -buffer -grepprg shellcheck -fgcc

  " Filetype: Text, Mail, Markdown {{{2
  let g:instant_markdown_autostart = 0
  let g:instant_markdown_slow      = 1

  autocmd FileType mail     setl tw=72 wrap lbr
  autocmd FileType markdown setl tw=80 mp=gomali\ %
  autocmd FileType text     setl tw=80 fo+=t

  " Filetype: VCS {{{2
  autocmd FileType git,gitcommit setl tw=80 fo+=t

  " fugitive
  autocmd BufReadPost fugitive:// setlocal bufhidden=delete
  autocmd FileType fugitiveblame nmap q gq
  autocmd User fugitive
        \  if get(b:, 'fugitive_type', '') =~# '\v^%(tree|blob)$'
        \|   nnoremap <buffer> .. :edit %:h<cr>
        \| endif

  " gv
  autocmd FileType GV
        \  set foldlevel=1
        \| nnoremap <buffer> q :qa<cr>
        \| nmap     <buffer> j ]]<cr>
        \| nmap     <buffer> k [[<cr>
        \| nmap     <buffer> <LeftRelease> o

  highlight link diffAdded     DiffAdd
  highlight link diffRemoved   DiffDelete
  highlight link diffFile      Directory
  highlight link diffLine      Comment
  highlight link diffIndexLine Comment
  highlight link diffSubname   Comment

  " signify
  let g:signify_sign_show_text = 0
  omap ic <plug>(signify-motion-inner-pending)
  xmap ic <plug>(signify-motion-inner-visual)
  omap ac <plug>(signify-motion-outer-pending)
  xmap ac <plug>(signify-motion-outer-visual)
  nnoremap <silent><leader>p :SignifyHunkDiff<cr>
  nnoremap <silent><leader>u :SignifyHunkUndo<cr>
  autocmd User SignifyAutocmds autocmd! signify CursorHold,CursorHoldI

  " Filetype: Vim, Vader {{{2
  autocmd FileType vim nnoremap <buffer><silent> <bs> :call lookup#pop()<bar>call halo#run()<cr>
  autocmd FileType vim setl sts=2 sw=2 isk-=#
  autocmd BufRead *.{vader,vim} command! -buffer Test call mhi#run_exercism_tests()
" }}}2
augroup END
" }}}1
"PLugins
"{{{1
" Plugin: committia {{{2
let g:committia_open_only_vim_starting = 0

" Plugin: exception {{{2
nnoremap <silent><leader>E :call exception#trace()<cr>
" Plugin: helpful {{{2
function! s:helpful()
  if plug#load('helpful.vim')
    autocmd! help_versions
    augroup! help_versions
  endif
  call helpful#cursor_word()
endfunction
autocmd FileType help nnoremap <buffer><silent> <leader>h :call <sid>helpful()<cr>
" Plugin: surround {{{2
let g:surround_indent = 1
let g:surround_{char2nr('k')} = "<kbd>\r</kbd>"

" Plugin: tagbar {{{2
nnoremap <f2> :TagbarToggle<cr>

let g:tagbar_width     = 35
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact   = 1

"Plugin: undotree {{{2
nnoremap <f3>  :UndotreeToggle<cr>

" Plugin: vim-easy-align {{{2
map <cr> <plug>(LiveEasyAlign)

" Plugin: vim-easymotion {{{2
let g:EasyMotion_do_mapping        = 0
let g:EasyMotion_do_shade          = 1
let g:EasyMotion_inc_highlight     = 0
let g:EasyMotion_landing_highlight = 0
let g:EasyMotion_off_screen_search = 0
let g:EasyMotion_smartcase         = 0
let g:EasyMotion_startofline       = 0
let g:EasyMotion_use_smartsign_us  = 1
let g:EasyMotion_use_upper         = 0
let g:EasyMotion_skipfoldedline    = 0

map <silent><space> <plug>(easymotion-s2)

"Plugin: vim-grepper {{{2
nnoremap <leader>g :Grepper<cr>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

highlight GrepperSideFile ctermfg=161 cterm=reverse
highlight Conceal ctermfg=NONE ctermbg=250

let g:grepper = {}
let g:grepper.dir = 'repo,filecwd'
let g:grepper.tools = ['git', 'rg', 'rubocop']
let g:grepper.rubocop = {
      \ 'grepprg': 'rubocop -femacs',
      \ 'grepformat': '%f:%l:%c: %t: %m' }

command! Todo Grepper -noprompt -tool rg -query '(TODO|FIX|FIXME|XXX|NOTE|HACK|OPTIMIZE):'

" Plugin: vim-sayonara {{{2
nnoremap <silent><leader>q  :Sayonara<cr>
nnoremap <silent><leader>Q  :Sayonara!<cr>

let g:sayonara_confirm_quit = 0

" Plugin: vim-startify {{{2
nnoremap <leader>st :Startify<cr>

let g:startify_change_to_dir       = 0
let g:startify_custom_header       = 'startify#pad(startify#fortune#boxed())'
let g:startify_enable_special      = 0
let g:startify_fortune_use_unicode = 1
let g:startify_update_oldfiles     = 1
let g:startify_use_env             = 1

" Plugin key-mappings.{{{2
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"Statusline(airline)
"{{{2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
"let g:Powerline_symbols = 'DejaVu Sans Mono Oblique'
"let g:airline_sysbols='Ubuntu Mono'
set encoding=utf-8
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {} 
"endif
" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.maxlinenr = '㏑'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.spell = 'Ꞩ'
"let g:airline_symbols.notexists = 'Ɇ'
"let g:airline_symbols.whitespace = 'Ξ'
" powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.dirty='⚡' 
 " old vim-powerline symbols
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '


"test{{{2
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" make test commands execute using dispatch.vim
"let test#strategy = "dispatch"
""more info https://github.com/vim-test/vim-test"
let test#python#runner = 'pytest'

"fastfold{{{2
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1

"vim-IndentLIne{{{2
let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_enabled = 1

"ALE{{{2
let g:ale_fixers = {
\   'c': ['clang'],
\   'c++':['clang'],
\   'javascript': ['eslint','prettier'],
\}
let g:ale_completion_tsserver_autoimport = 1
call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
let g:ale_java_javac_options = '-encoding UTF-8  -J-Duser.language=en'

"Deoplete
set pyxversion=3
let g:python3_host_prog = "/usr/bin/python3"

"nedtree
map <F1> :NERDTreeMirror<CR>
map <F1> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 20 "设定 NERDTree 视窗大小
autocmd vimenter * if !argc()|NERDTree|endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
"let g:NERDTreeShowLineNumbers=1  " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
"Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" 过滤: 所有指定文件和文件夹不显示
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']
"恢复显示隐藏的文件的命令，在Nerdtree中按Ctrl-I，其中I是大写。
let NERDTreeDirArrows=1 
"dirvish
autocmd FileType dirvish nmap <buffer> <c-o> -
autocmd VimEnter * if &ft == 'dirvish' | exe 'lcd' expand('%') | endif
nnoremap <expr> <f7> (&ft == 'dirvish' ? ':close' : ':leftabove 40vs +Dirvish')."\<cr>"
"leadf{{{2
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
"let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gh :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap og :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
"}}}1
