set nocompatible " 关闭兼容模式 or set nocp
syntax on " 开启语法高亮
filetype off " 关闭文件自动识别

" 初始化插件管理:vim-plug
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" 安装插件，在下方输入列表，然后通过 :PlugInstall 安装
Plug 'nathanaelkane/vim-indent-guides' " 对齐线
Plug 'preservim/nerdtree' " 树形目录
Plug 'jistr/vim-nerdtree-tabs' " 树形目录增强插件-可以让文件以多个 tab 方式打开而非覆盖当前文件打开显示
Plug 'Xuyuanp/nerdtree-git-plugin' " 树形目录 Git 插件
Plug 'hotoo/pangu.vim',{ 'for': ['markdown','vimwiki','text'] } " 中文排版优化
Plug 'mattn/emmet-vim'

" 所有插件都必须加在 #end() 这一行之前
call plug#end()
filetype plugin indent on " 重新开启文件类型识别



" ############################################### 插件配置 Start ######################################################
" 配置 indent-guides 插件
let g:indent_guides_enable_on_vim_startup = 0 " VIM 启动时启用
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" 配置 NERDTree 插件
" 从标准输入读取第一个参数并赋值
autocmd StdinReadPre * let s:std_in=1
" 自动开启 NERDTree
" 如果 vi 后指定了打开某个文件，则将光标移动到文件窗口，否则光标定位到 NERDTree 窗口
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" 当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 
let NERDTreeShowHidden = 1 " 开启默认显示隐藏文件 . 开头的文件
let NERDTreeShowBookmarks=1 " 启动插件时自动显示 Bookmarks
let g:NERDTreeShowLineNumbers=1 " 树形插件显示行号
" 定义快捷键 Ctrl + n 快速打开或关闭树形目录
map <C-n> :NERDTreeToggle<CR>

" 配置 NERTree-Tabs 插件
let g:nerdtree_tabs_open_on_console_startup = 1 " 配置 NERDTree Tabs 插件自动启动
let NERDTreeMapOpenInTab='<ENTER>' " 默认打开新文件的时候是以新 Tab 方式打开

" 配置 nerdtree-git 插件
let g:NERDTreeGitStatusIndicatorMapCustom = {
\ 'Modified'  :'✹',
\ 'Staged'    :'✚',
\ 'Untracked' :'✭',
\ 'Renamed'   :'➜',
\ 'Unmerged'  :'═',
\ 'Deleted'   :'✖',
\ 'Dirty'     :'✗',
\ 'Ignored'   :'☒',
\ 'Clean'     :'✔︎',
\ 'Unknown'   :'?',
\ }

" 开启中文排版优化插件
let g:pangu_rule_date = 1
autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing('ALL')

" 开启 emmet-vim
let g:user_emmet_install_global = 0
"let g:user_emmet_mode='n'    "only enable normal mode functions.
"let g:user_emmet_mode='inv'  "enable all functions, which is equal to
"let g:user_emmet_mode='a'    "enable all function in all mode.
"let g:user_emmet_leader_key='<C-Z>' "通过 ctrl + z + , 键入模板
autocmd FileType html,css,xml EmmetInstall

" ############################################### 插件配置 End ########################################################

set shortmess=atI " 不显示援助乌干达儿童提示
set scrolloff=3 " 距离顶部和底部3行
set mouse=a " 启动鼠标
set nu " 设置行号
set nowrap    "不自动折行
set paste " 解决粘贴乱序问题
set ignorecase " 不区分大小写

set encoding=utf-8 " 设置编码
set fenc=utf-8 " 设置默认编码
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,gbk,utf-16,big5

set wildmenu " 增强模式中命令行自动完成操作
set ruler " 设置状态行显示当前光标位置
" 自定义状态行的显示格式
"set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
set background=dark "设置背景
set fileformat=unix " 设置文件格式化为 unix 系统（主要涉及换行符问题）

set history=100 " 设置history文件记录行数
set nobackup " 设置不需要备份文件
set noswapfile " 设置不需要临时交换文件
set nowritebackup " 设置编辑时不需要备份文件

set ts=4 " 设置 tab 键宽度是 4 个空格
set tabstop=4 " 设置指标符宽度
set softtabstop=4 " 设置软制表符宽度
set shiftwidth=4 " 设置缩进空格
set textwidth=79 " 设置行最大宽度
set cc=120 " 设置第120列高亮(colorcolumn)
set autoindent " 设置自动缩进
set expandtab " 设置默认开启tab扩展-将tab转为空格
" 如果是 yaml 文件，更改上述宽度为 2
autocmd Filetype yaml,yml set ai nu ru ts=2 tabstop=2 softtabstop=2 sw=2 et

set cursorline "突出显示光标所在行
highlight CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white " 高亮当前行
set cursorcolumn " 突出显示光标所在列
" 设置与关闭鼠标所在列高亮
function SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction
" 设置快捷键(Color Column Hightline) Ctrl+c+c 调用 SetColorColumn 函数
map <C-c><C-c> :call SetColorColumn()<CR>

" 关闭所有高亮列
function CleanColorColumn()
    let cc_list = split(&cc, ',')
    for c in cc_list
        execute "set cc-=".c
    endfor
endfunction
" 设置快捷键(Clean Column Hightline) ,ch 调用 CleanColorColumn 函数
map ,ch :call CleanColorColumn()<CR>


" ############################################### 注释配置 Start ######################################################
func AppendShellDoc()
    if expand("%:e") == 'sh'
    let cl = line(".")
    call append(cl-1, "#!/bin/bash")
    call append(cl, "")
    call append(cl+1, "#*********************************************")
    call append(cl+2, "# Description: The Test Script")
    call append(cl+3, "# Author: limingshuang")
    call append(cl+4, "# Date: " . strftime("%Y/%m/%d %A %H:%M%S"))
    call append(cl+5, "# HomePage: https://minsonlee.github.io/")
    call append(cl+6, "# Copyright © ".strftime("%Y")." All rights reserved")
    call append(cl+7, "#*********************************************")
    call append(cl+8, "")
    endif
endfunc
" 如果新文件是 .sh 文件，自动执行 AppendShellDoc 函数
autocmd BufNewFile *.sh exec ":call AppendShellDoc()"
" 定义快捷键
map ,ds :call AppendShellDoc()<CR>

" 自动将光标设置到末尾
autocmd BufNewFile * normal G
" ############################################### 注释配置 End   ######################################################
