" Base: {{{
set number
set relativenumber
set autoindent
set expandtab
set incsearch
set cursorline
set wildmenu
syntax on
set softtabstop=2
set tabstop=2
set shiftwidth=2
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gbk,ucs-2le,ucs-2be,utf-16
set scrolloff=3
set laststatus=2
set updatetime=100
set mouse=a
" }}}

" Map: {{{
let mapleader = " "
inoremap jk <ESC>

nnoremap <leader>wo <C-w>o
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>wc <C-w>c
nnoremap <leader>H <C-w>H
nnoremap <leader>K <C-w>K
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <F8> :TagbarToggle<CR>
" }}}

" AutoOpenPOS: 自动定位上次关闭时的位置 {{{
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"}}}

" Plug: {{{
call plug#begin('~/.vim/plugged')
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'majutsushi/tagbar'
  Plug 'godlygeek/tabular'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"  Plug 'dgryski/vim-godef'
  Plug 'blackrush/vim-gocode'
  Plug 'mattn/vim-goimports'
  Plug 'jstemmer/gotags'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

  Plug 'junegunn/fzf', {'do': './install --all'}
  Plug 'junegunn/fzf.vim'
  Plug 'w0rp/ale'
  Plug 'ryanoasis/vim-devicons'
call plug#end()
" }}}

" Color: {{{
set t_Co=256
set background=dark
colorscheme gruvbox
hi Comment cterm=italic

" 背景透明
hi Normal ctermbg=NONE
hi LineNr ctermbg=NONE
hi CursorLineNr ctermbg=NONE
" hi CursorLine cterm=underline ctermbg=NONE
hi SignColumn ctermbg=NONE
highlight CursorLine cterm=NONE ctermbg=Black ctermfg=NONE
"}}}

" NERDTree {{{
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
" let g:NERDTreeHidden=0     "不显示隐藏文件
" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1
" }}}

" Airline 配置 {{{
let g:airline_experimental                      = 1
" let g:airline_left_sep                          = '>'
" let g:airline_right_sep                         = '<'
let g:airline_powerline_fonts                   = 1
" let g:airline#extensions#tabline#enabled        = 1
" let g:airline#extensions#tabline#left_sep       = ' '
" let g:airline#extensions#tabline#left_alt_sep   = '|'
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline_detect_modified=1
" let g:airline_detect_paste=1
" let g:airline_detect_crypt=1
" let g:airline_detect_spell=1
" let g:airline_detect_spelllang=1
" let g:airline_inactive_collapse=1
" let g:airline_inactive_alt_sep=1
" }}}
"

" Tagbar {{{
let g:tagbar_sort  = 0 "关闭排序
" let g:tagbar_left  = 1 "设置在左边显示
let g:tagbar_width = 30 "宽度
" }}}

" Go 相关
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions',
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype',
    \ },
    \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n',
    \ },
    \ 'ctagsbin' : 'gotags',
    \ 'ctagsargs' : '-sort -silent',
\ }

" autocmd FileType go nnoremap <buffer> gd :call GodefUnderCursor() <cr>
" autocmd FileType go nnoremap <buffer> <c-]> :call GodefUnderCursor() <cr>
" let g:godef_split=3 "追踪打开新tab
" let g:gogef_same_file_in_same_window=1 "函数在同一个文件中时不需要打开新窗口
" 
" "保存自动goimports
" let g:go_fmt_command = "goimports"
" let g:goimports = 1

" }}}

" ale 配置: {{{

let g:ale_lint_on_text_changed  = 'normal'                      " 代码更改后启动检查
let g:ale_lint_on_insert_leave  = 1                             " 退出插入模式即检查
let g:ale_sign_column_always    = 1                             " 总是显示动态检查结果
let g:ale_sign_error            = '>>'                          " error 告警符号
let g:ale_sign_warning          = '--'                          " warning 告警符号
let g:ale_echo_msg_error_str    = 'E'                           " 错误显示字符
let g:ale_echo_msg_warnning_str = 'W'                           " 警告显示字符
let g:ale_echo_msg_format       = '[%linter%] %s [%serverity%]' " 告警显示格式

" <F9> 触发/关闭代码动态检查
map <F9> :ALEToggle<CR>
nmap <C-k> <Plug>(ale_previous_wrap)
nmap <C-j> <Plug>(ale_next_wrap)
nmap <leader><leader>d :ALEDetail<CR>
" }}}

" FZF: {{{
" 此命令依赖 ripgrep ripgrep 安装请参照 https://github.com/BurntSushi/ripgrep
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview(right:50%:hidden', '?'),
      \   <bang>0)

" 在当前目录搜索文件
nnoremap <Leader>f :Files<CR>
" 切换 Buffer
nnoremap <Leader>b :Buffers<CR>
" 在当前所有加载的 Buffer 中搜索包含目标词的所有行
nnoremap <Leader>l :Lines<CR>
" 在当前 Buffer 中搜索包含目标词的所有行
nnoremap <Leader>bl :BLines<CR>
" 在 Vim 打开的历史文件中搜索，相当于是在 MRU 中搜索
nnoremap <Leader>h :History<CR>
" }}}

" Coc: {{{

 let g:coc_global_extensions = [
  \ 'coc-json', 
  \ 'coc-tsserver',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-phpls',
  \ 'coc-go',
  \ 'coc-python',
  \ 'coc-vimlsp']

"coc keymap
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"}}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
