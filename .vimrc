NeoBundle 'tpope/vim-rails', { 'autoload' : {
      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}

NeoBundleLazy 'alpaca-tc/vim-endwise.git', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ }}

NeoBundleLazy 'edsono/vim-matchit', { 'autoload' : {
      \ 'filetypes': 'ruby',
      \" 挙動を vi 互換ではなく、Vim のデフォルト設定にする
set nocompatible
" 一旦ファイルタイプ関連を無効化する
filetype off

""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'

" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'
" シングルクオートとダブルクオートの入れ替え等
NeoBundle 'tpope/vim-surround'

" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'
" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'
" 行末の半角スペースを可視化(うまく動かない？)
NeoBundle 'bronson/vim-trailing-whitespace'
" less用のsyntaxハイライト
NeoBundle 'KohPoll/vim-less'

"vim slimのハイライト
NeoBundle 'slim-template/vim-slim'

NeoBundle 'mattn/emmet-vim'
" 余談: neocompleteは合わなかった。ctrl+pで補完するのが便利

" スニペット
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
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

"set snippet file dir
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/,~/.vim/snippets'


call neobundle#end()


" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""
" タグファイルの指定(でもタグジャンプは使ったことがない)
set tags=~/.tags
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" バックアップディレクトリの指定(でもバックアップは使ってない)
set backupdir=$HOME/.vimbackup
" バッファで開いているファイルのディレクトリでエクスクローラを開始する(でもエクスプローラって使ってない)
set browsedir=buffer
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" 暗い背景色に合わせた配色にする
set background=dark
" タブ入力を複数の空白入力に置き換える
set expandtab
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden
" 不可視文字を表示する
set list
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 構文毎に文字色を変化させる
syntax on
" カラースキーマの指定
colorscheme desert
" 行番号の色
highlight LineNr ctermfg=darkyellow

set backspace=indent,eol,start
""""""""""""""""""""""""""""""

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""


let g:user_emmet_leader_key='<c-e>'

" filetypeの自動検出(最後の方に書いた方がいいらしい)
filetype on 'mappings' : ['nx', '%'] }}

" Vim syntax file
" Language: Pug
" Maintainer: Joshua Borton
" Credits: Tim Pope
" Filenames: *.pug




if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'pug'
endif

silent! syntax include @htmlCoffeescript syntax/coffee.vim
unlet! b:current_syntax
silent! syntax include @htmlStylus syntax/stylus.vim
unlet! b:current_syntax
silent! syntax include @htmlCss syntax/css.vim
unlet! b:current_syntax
silent! syntax include @htmlMarkdown syntax/markdown.vim
unlet! b:current_syntax

syn case match

syn region  javascriptParenthesisBlock start="(" end=")" contains=@htmlJavascript contained keepend
syn cluster htmlJavascript add=javascriptParenthesisBlock

syn region  pugJavascript matchgroup=pugJavascriptOutputChar start="[!&]\==\|\~" skip=",\s*$" end="$" contained contains=@htmlJavascript keepend
syn region  pugJavascript matchgroup=pugJavascriptChar start="-" skip=",\s*$" end="$" contained contains=@htmlJavascript keepend
syn cluster pugTop contains=pugBegin,pugComment,pugHtmlComment,pugJavascript
syn match   pugBegin "^\s*\%([<>]\|&[^=~ ]\)\@!" nextgroup=pugTag,pugClassChar,pugIdChar,pugPlainChar,pugJavascript,pugScriptConditional,pugScriptStatement,pugPipedText
syn match   pugTag "+\?[[:alnum:]_-]\+\%(:\w\+\)\=" contained contains=htmlTagName,htmlSpecialTagName nextgroup=@pugComponent
syn cluster pugComponent contains=pugAttributes,pugIdChar,pugBlockExpansionChar,pugClassChar,pugPlainChar,pugJavascript,pugTagBlockChar,pugTagInlineText
syntax keyword pugCommentTodo  contained TODO FIXME XXX TBD
syn match   pugComment '\(\s\+\|^\)\/\/.*$' contains=pugCommentTodo,@Spell
syn region  pugCommentBlock start="\z(\s\+\|^\)\/\/.*$" end="^\%(\z1\s\|\s*$\)\@!" contains=pugCommentTodo,@Spell keepend
syn region  pugHtmlConditionalComment start="<!--\%(.*\)>" end="<!\%(.*\)-->" contains=pugCommentTodo,@Spell
syn region  pugAngular2 start="(" end=")" contains=htmlEvent
syn region  pugJavascriptString start=+"+  skip=+\\\("\|$\)+  end=+"\|$+ contained
syn region  pugJavascriptString start=+'+  skip=+\\\('\|$\)+  end=+'\|$+ contained
syn region  pugAttributes matchgroup=pugAttributesDelimiter start="(" end=")" contained contains=pugJavascriptString,pugHtmlArg,pugAngular2,htmlArg,htmlEvent,htmlCssDefinition nextgroup=@pugComponent
syn match   pugClassChar "\." containedin=htmlTagName nextgroup=pugClass
syn match   pugBlockExpansionChar ":\s\+" contained nextgroup=pugTag,pugClassChar,pugIdChar
syn match   pugIdChar "#[[{]\@!" contained nextgroup=pugId
syn match   pugClass "\%(\w\|-\)\+" contained nextgroup=@pugComponent
syn match   pugId "\%(\w\|-\)\+" contained nextgroup=@pugComponent
syn region  pugDocType start="^\s*\(!!!\|doctype\)" end="$"
" Unless I'm mistaken, syntax/html.vim requires
" that the = sign be present for these matches.
" This adds the matches back for pug.
syn keyword pugHtmlArg contained href title

syn match   pugPlainChar "\\" contained
syn region  pugInterpolation matchgroup=pugInterpolationDelimiter start="[#!]{" end="}" contains=@htmlJavascript
syn match   pugInterpolationEscape "\\\@<!\%(\\\\\)*\\\%(\\\ze#{\|#\ze{\)"
syn match   pugTagInlineText "\s.*$" contained contains=pugInterpolation,pugTextInlinePug,@Spell
syn region  pugPipedText matchgroup=pugPipeChar start="|" end="$" contained contains=pugInterpolation,pugTextInlinePug nextgroup=pugPipedText skipnl
syn match   pugTagBlockChar "\.$" contained nextgroup=pugTagBlockText,pugTagBlockEnd skipnl
syn region  pugTagBlockText start="\%(\s*\)\S" end="\ze\n" contained contains=pugInterpolation,pugTextInlinePug,@Spell nextgroup=pugTagBlockText,pugTagBlockEnd skipnl
syn region  pugTagBlockEnd start="\s*\S" end="$" contained contains=pugInterpolation,pugTextInlinePug nextgroup=pugBegin skipnl
syn region  pugTextInlinePug matchgroup=pugInlineDelimiter start="#\[" end="]" contains=pugTag keepend

syn region  pugJavascriptFilter matchgroup=pugFilter start="^\z(\s*\):javascript\s*$" end="^\%(\z1\s\|\s*$\)\@!" contains=@htmlJavascript
syn region  pugMarkdownFilter matchgroup=pugFilter start=/^\z(\s*\):\%(markdown\|marked\)\s*$/ end=/^\%(\z1\s\|\s*$\)\@!/ contains=@htmlMarkdown
syn region  pugStylusFilter matchgroup=pugFilter start="^\z(\s*\):stylus\s*$" end="^\%(\z1\s\|\s*$\)\@!" contains=@htmlStylus
syn region  pugPlainFilter matchgroup=pugFilter start="^\z(\s*\):\%(sass\|less\|cdata\)\s*$" end="^\%(\z1\s\|\s*$\)\@!"

syn match  pugScriptConditional "^\s*\<\%(if\|else\|else if\|elif\|unless\|while\|until\|case\|when\|default\)\>[?!]\@!"
syn match  pugScriptStatement "^\s*\<\%(each\|for\|block\|prepend\|append\|mixin\|extends\|include\)\>[?!]\@!"
syn region  pugScriptLoopRegion start="^\s*\(for \)" end="$" contains=pugScriptLoopKeywords
syn keyword  pugScriptLoopKeywords for in contained

syn region  pugJavascript start="^\z(\s*\)script\%(:\w\+\)\=" end="^\%(\z1\s\|\s*$\)\@!" contains=@htmlJavascript,pugJavascriptTag,pugCoffeescriptFilter keepend

syn region  pugCoffeescriptFilter matchgroup=pugFilter start="^\z(\s*\):coffee-\?script\s*$" end="^\%(\z1\s\|\s*$\)\@!" contains=@htmlCoffeescript contained
syn region  pugJavascriptTag contained start="^\z(\s*\)script\%(:\w\+\)\=" end="$" contains=pugBegin,pugTag
syn region  pugCssBlock        start="^\z(\s*\)style" nextgroup=@pugComponent,pugError  end="^\%(\z1\s\|\s*$\)\@!" contains=@htmlCss keepend

syn match  pugError "\$" contained

hi def link pugPlainChar              Special
hi def link pugScriptConditional      PreProc
hi def link pugScriptLoopKeywords     PreProc
hi def link pugScriptStatement        PreProc
hi def link pugHtmlArg                htmlArg
hi def link pugAttributeString        String
hi def link pugAttributesDelimiter    Identifier
hi def link pugIdChar                 Special
hi def link pugClassChar              Special
hi def link pugBlockExpansionChar     Special
hi def link pugPipeChar               Special
hi def link pugTagBlockChar           Special
hi def link pugId                     Identifier
hi def link pugClass                  Type
hi def link pugInterpolationDelimiter Delimiter
hi def link pugInlineDelimiter        Delimiter
hi def link pugFilter                 PreProc
hi def link pugDocType                PreProc
hi def link pugCommentTodo            Todo
hi def link pugComment                Comment
hi def link pugCommentBlock           Comment
hi def link pugHtmlConditionalComment pugComment
hi def link pugJavascriptString       String

let b:current_syntax = "pug"

if main_syntax == "pug"
  unlet main_syntax
endif
