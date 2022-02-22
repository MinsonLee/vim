set nocompatible " 关闭兼容模式 or set nocp
syntax on " 开启语法高亮
filetype off " 关闭文件自动识别

" 初始化插件管理:vim-plug
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" 安装插件，在下方输入列表，然后通过 :PlugInstall 安装
Plug 'nathanaelkane/vim-indent-guides' " 对齐线
Plug 'preservim/nerdtree' " 树形目录

" 所有插件都必须加在 #end() 这一行之前
call plug#end()

filetype plugin indent on " 重新开启文件类型识别
set shortmess=atI " 不显示援助乌干达儿童提示
set scrolloff=3 " 距离顶部和底部3行
set mouse=a " 启动鼠标
set nu " 设置行号
set nowrap    "不自动折行
set cursorline "突出显示当前行
" highlight CursorLine guibg=lightblue ctermbg=lightgray " 修饰横线
set tabstop=4 " 设置指标符宽度
set softtabstop=4 " 设置软制表符宽度
set shiftwidth=4 " 设置缩进空格
set autoindent " 设置自动缩进
set textwidth=79 " 设置行最大宽度
set encoding=utf-8 " 设置编码
set fenc=utf-8 " 设置默认编码
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,gbk,utf-16,big5
set history=100 " 设置history文件记录行数
set nobackup " 设置不需要备份文件
set noswapfile " 设置不需要临时交换文件
set nowritebackup " 设置编辑时不需要备份文件
set wildmenu " 增强模式中命令行自动完成操作
set ruler " 设置状态行显示当前光标位置
"set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
set background=dark "设置背景
" colorscheme  molokai " 设置颜色主题
set fileformat=unix " 设置文件格式

set cc=120 " 设置第120列高亮
"set cursorcolumn " 设置光标所在列
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
" 配置 indent-guides 插件
let g:indent_guides_enable_on_vim_startup = 1 " VIM 启动时启用
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" 配置 NERDTree 插件
autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:nerdtree_tabs_open_on_console_startup = 1 " 配置 NERDTree Tabs 插件自动启动
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " 当NERDTree为剩下的唯一窗口时自动关闭
" 定义快捷键
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1 " 开启默认显示隐藏文件 . 开头的文件
