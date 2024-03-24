set nocompatible " 关闭兼容模式 or set nocp
syntax on " 开启语法高亮
filetype off " 关闭文件自动识别

" 初始化插件管理:vim-plug
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" 安装插件，在下方输入列表，然后通过 :PlugInstall 安装
Plug 'nathanaelkane/vim-indent-guides' " 对齐线
Plug 'preservim/nerdtree' " 树形目录
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
"autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:nerdtree_tabs_open_on_console_startup = 1 " 配置 NERDTree Tabs 插件自动启动
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " 当NERDTree为剩下的唯一窗口时自动关闭
" 定义快捷键 Ctrl + n
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1 " 开启默认显示隐藏文件 . 开头的文件

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
set cursorline "突出显示当前行
" highlight CursorLine guibg=lightblue ctermbg=lightgray " 修饰横线

set ts=4 " 设置 tab 键宽度是 4 个空格
set tabstop=4 " 设置指标符宽度
set softtabstop=4 " 设置软制表符宽度
set shiftwidth=4 " 设置缩进空格
set textwidth=79 " 设置行最大宽度
set cc=120 " 设置第120列高亮
set expandtab " 设置默认开启tab扩展-将tab转为空格


set encoding=utf-8 " 设置编码
set fenc=utf-8 " 设置默认编码
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,gbk,utf-16,big5

set history=100 " 设置history文件记录行数
set nobackup " 设置不需要备份文件
set noswapfile " 设置不需要临时交换文件
set nowritebackup " 设置编辑时不需要备份文件

set autoindent " 设置自动缩进
set wildmenu " 增强模式中命令行自动完成操作
set ruler " 设置状态行显示当前光标位置
"set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
set background=dark "设置背景
" colorscheme  molokai " 设置颜色主题
set fileformat=unix " 设置文件格式化为 unix 系统（主要涉及换行符问题）

set cursorcolumn " 设置光标所在列
" 设置快捷键 ,ch 调用 SetColorColumn 函数
map ,ch :call SetColorColumn()<CR>
" 设置与关闭鼠标所在列高亮
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction


" ############################################### 注释配置 Start ######################################################
" 如果新文件是 .sh 文件，自动执行 AddShellDoc 函数
func AddShellDoc()
    if expand("%:e") == 'sh'
    call setline(1, "#!/bin/bash")
    call setline(2, "")
    call setline(3, "#*********************************************")
    call setline(4, "# Description: The Test Script")
    call setline(5, "# Author: limingshuang")
    call setline(6, "# Date: " . strftime("%Y/%m/%d %H:%i%s"))
    call setline(7, "# HomePage: https://minsonlee.github.io/")
    call setline(8, "# Copyright © ".strftime("%Y")." All rights reserved")
    call setline(9, "#*********************************************")
    call setline(10, "")
    endif
endfunc
autocmd BufNewFile *.sh exec ":call AddShellDoc()"
" 定义快捷键
map ,asd :call AppendShellDoc()<CR>
func AppendShellDoc()
    normal 2
    call append(line(".")+2, "hhhhhhhhhhhhhh")
endfunc

" 自动将光标设置到末尾
autocmd BufNewFile * normal G
" ############################################### 注释配置 End   ######################################################
