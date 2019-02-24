" delete on vim insertmode with backspace and <Ctr+h>
set backspace=indent,eol,start

"clipbord copy
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

set wildmenu
set wildmode=longest:full,full

" don not create swp file
:set noswapfile
" do not backup
:set nobackup

" vim 保存時に行末の空白の自動削除
autocmd BufWritePre * :%s/\s\+$//ge

"一回定義したあautocmdを削除する
" autocmd!
set nopaste
"set paste
"imap <C-@> <nop>
":set pastetoggle=<C-@>
nnoremap <C-@> :set invpaste paste?<CR>
:set pastetoggle=<C-@>
set showmode

set number
set incsearch
set nohlsearch
set cursorline
set laststatus=2
set statusline=%F%r%h%=

"tabの設定
set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" visible tab white space break line
set list
" set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set listchars=tab:»-,trail:~,extends:»,precedes:«,nbsp:%
" change =tab:»-,trail:~,extends:»,precedes:«,nbsp:% color
" highlight SpecialKey ctermfg=33

"検索
:set noignorecase
:set smartcase

"カラースキーマを設定
colorscheme molokai
syntax on
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark

"空行を挿入
"改行を入れる時に自動でコメントにならないようにしてる。
nmap O :<C-u>call append(expand('.'), '')<Cr>j

"画面分割系の設定
nnoremap s <Nop> "defaultのSの効果を消す
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

"Use the "black hole register", "_ to really delete something: "_d.
"Use "_dP to paste something and keep it available for further pasting.
"d => "delete"
"leader d => "cut"
"nnoremap <leader>d "_d↲
"nnoremap x "_x↲
"vnoremap <leader>d "_d↲
"vnoremap <leader>p "_dP↲

" copy and paste settings
nnoremap <leader>d "_d
nnoremap x "_x
vnoremap <leader>d "_d
vnoremap <leader>p "_dP
vnoremap <silent> y "yy:let @+ = @y<CR>

" toggle paste, nopaste
" The first line sets a mapping so that pressing F2 in normal mode will invert the 'paste' option, and will then show the value of that option. The second line allows you to press F2 when in insert mode, to toggle 'paste' on and off. The third line enables displaying whether 'paste' is turned on in insert mode.
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" インクリメンタル検索にする。記述無しの場合、例えば「hoge」と検索をかけるとすると「/hoge」まで打ち込んでからEnter押さないとハイライトされないので分からない。これを入れておけば一字打つごとに検索をかけられるのでかなり見やすい。
set incsearch

"インサートモードでも移動
inoremap <C-n>  <down>
inoremap <C-p>  <up>
inoremap <C-b>  <left>
inoremap <C-f>  <right>

" カーソル下の単語をハイライトする
" https://qiita.com/itmammoth/items/312246b4b7688875d023#9delete-backspace
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
" カーソル下の単語をハイライトしてから置換する
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>

"括弧の補完
" "inoremap { {}<Left>
" "inoremap {<Enter> {}<Left><CR><ESC><S-o>
" "inoremap ( ()<ESC>i
" "inoremap (<Enter> ()<Left><CR><ESC><S-o>
" "inoremap ' ''<LEFT>
" "inoremap " ""<LEFT>

" nnoremap == gg=G    "=を二回連続入力でバッファ全体をインデント整理


"augroup = group autocmd.
augroup auto_vimrc_loading
        autocmd!
        autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
        autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

"if has('vim_starting')
"        " 初回起動時のみruntimepathにneobundleのパスを指定する
"        set runtimepath+=~/.vim/bundle/neobundle.vim/
"endif

"" NeoBundleを初期化
"call neobundle#begin(expand('~/.vim/bundle/'))
"
" インストールするプラグインをここに記述
"NeoBundle "tyru/caw.vim.git"
"nmap <C-/> <Plug>(caw:i:toggle)
"vmap <C-/> <Plug>(caw:i:toggle)
"
"NeoBundle 'Shougo/unite.vim'
""NeoBundle 'Shougo/vimfiler'
"NeoBundle 'cohama/lexima.vim'
"if neobundle#is_sourced("lexima.vim")
"        let g:lexima_no_default_rules = 1
"        call lexima#set_default_rules()
"endif
"
"NeoBundle 'scrooloose/nerdtree'
"map <C-n> :NERDTreeToggle<CR>
""t: open in a new tab,   s:縦分割で開く, o: open in a current window
"NeoBundle 'tomtom/tcomment_vim'
"" インデントに色を付けて見やすくする
"NeoBundle 'nathanaelkane/vim-indent-guides'
"" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
"
"" 行末の半角スペースを可視化
"NeoBundle 'bronson/vim-trailing-whitespace'
"let g:indent_guides_enable_on_vim_startup = 1
"
"NeoBundle 'editorconfig/editorconfig-vim'
"
"" 文字を囲む
"NeoBundle 'surround.vim'
"
"" browserを開く再mac,windowsで同じ方法で開きたい時に使用
"NeoBundle 'tyru/open-browser.vim'
"
"" vimでマークダウンのプレビュー
"NeoBundle 'kannokanno/previm'
"let g:previm_open_cmd = ''
"augroup PrevimSettings
"  autocmd!
"  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
"augroup END
"nnoremap [previm] <Nop>
"nmap <Space>p [previm]
"nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
"nnoremap <silent> [previm]r :call previm#refresh()<CR>
"
"
"" NeoBundleをNeoBundle自体で管理する
"NeoBundleFetch 'Shougo/neobundle.vim'
"
"call neobundle#end()
"
"" NeoBundleCheck を走らせ起動時に未インストールプラグインをインストールする
"NeoBundleCheck
"" ファイルタイプ別のプラグイン/インデントを有効にする
"filetype plugin indent on

if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

   " インストールするプラグインをここに記述
  call dein#add('Shougo/unite.vim')
   "call dein#add('Shougo/vimfiler')
  call dein#add('cohama/lexima.vim')
  if has("lexima.vim")
     let g:lexima_no_default_rules = 1
     call lexima#set_default_rules()
  endif

  call dein#add('scrooloose/nerdtree')
  "call dein#add('tomtom/tcomment_vim')
  "
  " インデントに色を付けて見やすくする
  call dein#add('nathanaelkane/vim-indent-guides')
  " vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする

  " 行末の半角スペースを可視化
  call dein#add('bronson/vim-trailing-whitespace')
  " let g:indent_guides_enable_on_vim_startup = 1

  call dein#add('editorconfig/editorconfig-vim')

  " 文字を囲む
  call dein#add('vim-scripts/surround.vim')

  " browserを開く再mac,windowsで同じ方法で開きたい時に使用
  call dein#add('tyru/open-browser.vim')

  " vimでマークダウンのプレビュー
  call dein#add('kannokanno/previm')
  let g:previm_open_cmd = ''
  augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
  augroup END
  nnoremap [previm] <Nop>
  nmap <Space>p [previm]
  nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
  nnoremap <silent> [previm]r :call previm#refresh()<CR>


  call dein#add('Shougo/dein.vim', {'rtp': ''})
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
	  call dein#install()
endif

" NerdTree
map <C-n> :NERDTreeToggle<CR>
"t: open in a new tab,   s:縦分割で開く, o: open in a current window

" 行末の半角スペースを可視化
"  call dein#add('bronson/vim-trailing-whitespace')
let g:indent_guides_enable_on_vim_startup = 1


" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
" """"""""""""""""""""""""""""""
" " 挿入モード時、ステータスラインの色を変更
" """"""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
if has('syntax')
        augroup InsertHook
                autocmd!
                autocmd InsertEnter * call s:StatusLine('Enter')
                autocmd InsertLeave * call s:StatusLine('Leave')
        augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
        if a:mode == 'Enter'
                silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
                silent exec g:hi_insert
        else
                highlight clear StatusLine
                silent exec s:slhlcmd
        endif
endfunction

function! s:GetHighlight(hi)
        redir => hl
        exec 'highlight '.a:hi
        redir END
        let hl = substitute(hl, '[\r\n]', '', 'g')
        let hl = substitute(hl, 'xxx', '', '')
        return hl
endfunction


execute pathogen#infect()
syntax on
filetype plugin indent on
autocmd BufWritePost,FileWritePost *.go execute "GoLint" | cwindow
let g:go_hightlight_functions = 1
let g:go_hightlight_methods = 1
let g:go_hightlight_structs = 1
let g:go_hightlight_interfaces = 1
let g:go_hightlight_operators = 1
let g:go_hightlight_build_constraints = 1
let g:go_fmt_command = "goimports"

