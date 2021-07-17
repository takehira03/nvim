" 環境パス設定
let g:python_host_prog = expand('~/.venv/neovim2/Scripts/python.exe')
let g:python3_host_prog = expand('~/.venv/neovim3/Scripts/python.exe')

" マップリーダーの設定
let mapleader = ' '

" プラグイン {{{

let g:dein#auto_recache = 1
let s:dein_dir = expand('<sfile>:p:h') . '/dein'
let s:dein_repos_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath^=' . s:dein_repos_dir

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	call dein#load_toml(expand('<sfile>:p:h').'/plugin.toml')

	call dein#end()
	call dein#save_state()
endif

" }}} プラグインここまで

" カラースキーマ
colorscheme molokai

"シンタックスを有効
syntax enable

" タブ
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0

"番号の表示
set number

" 検索
set ignorecase
set smartcase

" バックアップ系ファイル不要
set nobackup
set noswapfile
set noundofile
set clipboard=unnamed
set shortmess+=I

" 行頭/行末でカーソルを止めない
set whichwrap=b,s,h,l,<,>,[,],~
set completeopt=preview
set autoread

" IME
set iminsert=0
set imsearch=0

" 読んだファイルにEOLがなければそれを維持
set nofixeol

" ウィンドウのタイトルにファイル名を表示
set title

" ノーマルモードでも改行
nnoremap <CR> :execute "normal o"<CR>
nnoremap <S-CR> :execute "normal O"<CR>
autocmd FileType qf nnoremap <buffer> <CR> <CR>

" Esc代行
imap <C-j> <Esc>
vmap <C-j> <Esc>
inoremap <Esc> <Esc>:set iminsert=0<CR>

" 強調表示解除
nnoremap <C-n> :noh<CR>

" Include展開
nnoremap gh :wincmd f<CR>
nnoremap gv :vertical wincmd f<CR>

" タグジャンプ
nnoremap <C-]> g<C-]>

" コマンドラインでの貼り付け
cmap <S-Insert> <C-R>*

" ファイルタイプ設定
autocmd BufNewFile,BufRead *.xaml setf xaml

" QuickFixを下に表示する
autocmd FileType qf wincmd J

" 改行時にコメントを続けない
augroup not_keep_comment
	autocmd!
	autocmd BufEnter * setlocal formatoptions-=ro
augroup END

" 今開いているファイルのディレクトリに移動
com! Cdpwd cd %:h

" 現在のファイパスをクリップボードにコピー
com! Copyfilepath let @* = expand('%:p') | echo @*
com! Copyfilename let @* = expand('%:t') | echo @*

" xml、htmlなどのタグジャンプ
source $VIMRUNTIME/macros/matchit.vim

" vim:set foldmethod=marker:
