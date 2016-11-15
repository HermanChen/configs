" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" -----------------------------------------------------------------------------
"  < Vundle 插件管理工具配置 >
"
"  -----------------------------------------------------------------------------
" 用于更方便的管理vim插件，具体用法参考 :h vundle 帮助
" Vundle工具安装方法为在终端输入如下命令
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" 如果想在 windows 安装就必需先安装 "git for window"，可查阅网上资料

set nocompatible                                      "禁用 Vi 兼容模式
filetype off                                          "禁用文件类型侦测

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" 使用Vundle来管理插件，这个必须要有。
Bundle 'gmarik/vundle'

" 以下为要安装或更新的插件，不同仓库都有（具体书写规范请参考帮助）
Bundle 'bufexplorer.zip'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'std_c.zip'
Bundle 'taglist.vim'

filetype plugin indent on " required! /** vimrc文件配置结束 **/

filetype on                                           "启用文件类型侦测
filetype plugin on                                    "针对不同的文件类型加载对应的插件



" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

set history=20000
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		    " Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set smartindent		" Do smart indent
set incsearch		" Incremental search
set hlsearch            " Set highlight search result
set autowrite		" Automatically save before commands like :next and :make
set hidden		    " Hide buffers when they are abandoned
set mouse=a		    " Enable mouse usage (all modes)
set cursorline      " display cursor line
set backspace=2
"set backspace=indent,eol,start
set scrolloff=3     " Keep distance to top and bottom
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 不用altkyes映射到窗口列表
set winaltkeys=no
set nopaste         " 粘贴的时候不做缩进
"set fileformats=unix

" 设置代码配色方案
" colorscheme Tomorrow-Night-Eighties               "终端配色方案

" Ctrl + K 插入模式下光标向上移动
"imap <c-k> <Up>
" Ctrl + J 插入模式下光标向下移动
"imap <c-j> <Down>
" Ctrl + H 插入模式下光标向左移动
"imap <c-h> <Left>
" Ctrl + L 插入模式下光标向右移动
"imap <c-l> <Right>


" 使更新 _vimrc 更容易
" 译释：nmap 是绑定一个在normal模式下的快捷键
:nmap ,s :source $HOME/.vimrc<CR>
:nmap ,v :tabe $HOME/.vimrc<CR>
" 译释：在normal模式下，先后按下 ,s 两个键执行_vimrc，而 ,v 则是编辑_vimrc


"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
 
" Gtage configuration
let Gtags_OpenQuickfixWindow = 0
map <C-n> :cn<CR>
map <C-p> :cp<CR>
" 在项目中搜索光标所在位置的单词
" map <C-\> :GtagsCursor<CR>
map <C-\> :Gtags -gi<CR><CR>
" 搜索光标所在函数的定义
map <C-c> :Gtags<CR><CR>
" 搜索光标所在函数的引用
" map <C-x> :Gtags -r<CR><CR>
map <C-x> :GtagsCursor<CR><CR>




" hot keys
" F5 - F8 window/display hot key
" 用f5切换到正在编辑的文件目录
map <F5> :execute "cd" expand("%:h")<CR>
"显示行号：
set number
"为方便复制，用<F2>开启/关闭行号显示:
nnoremap <F6> :set nonumber!<CR>:set foldcolumn=0<CR>
" F7 是在插入模式下查看寄存器内容
imap <F7> <C-o>:reg<CR>
map <F7> :reg<CR>
" F8 打开目录树，使用 nerdtree

" F9 - F12 format hot key

map <F9> :set nu!<CR>
" F10 是菜单快捷键
" F11 是全屏的快捷键
set nowrap
map <F11> :set nowrap!<CR>

" F12 是缩进风格切换
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set tabstop=4
set textwidth=80
set cc=80
map <F12> :call SwitchTab()<CR>
func! SwitchTab()
	if ( &tabstop == 8 )
		set tabstop=4
		set softtabstop=4
		set shiftwidth=4
		set expandtab
		set tabstop=4
		set textwidth=0
	else
		set tabstop=8
		set softtabstop=8
		set shiftwidth=8
		set noexpandtab
		set tabstop=8
		set textwidth=80
	endif
endfunc

" 窗口大小操作
"nmap <C-=>  :resize +3<CR>
"nmap <C-->  :resize -3<CR>
"nmap <C-,>  :vertical resize -3<CR>
"nmap <C-.>  :vertical resize +3<CR>

" -----------------------------------------------------------------------------
"  < MiniBufExplorer 插件配置 >
"
"  -----------------------------------------------------------------------------
" 快速浏览和操作Buffer
" 主要用于同时打开多个文件并相与切换
let g:miniBufExplMapWindowNavArrows = 1         "用Ctrl加方向键切换到上下左右的窗口中去
" let g:miniBufExplMapWindowNavVim = 1          "用<C-k,j,h,l>切换到上下左右的窗口中去
" let g:miniBufExplMapCTabSwitchBufs = 1        "功能增强（不过好像只有在Windows中才有用）
"                                               "<C-Tab>   向前循环切换到每个buffer上,并在但前窗口打开
"                                               "<C-S-Tab> 向后循环切换到每个buffer上,并在当前窗口打开
" 在不使用 MiniBufExplorer 插件时也可用<C-k,j,h,l>切换到上下左右的窗口中去
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" -----------------------------------------------------------------------------
"  < nerdtree 插件配置 >
"
"  -----------------------------------------------------------------------------
" 有目录村结构的文件浏览插件
" 常规模式下输入 F2 调用插件
nmap <F8> :NERDTreeToggle<CR>

" -----------------------------------------------------------------------------
"  < std_c 插件配置 >
"
"  -----------------------------------------------------------------------------
" 用于增强C语法高亮
" 启用 // 注释风格
let c_cpp_comments = 0

" -----------------------------------------------------------------------------
"  < TagList 插件配置 >
"
"  -----------------------------------------------------------------------------
" 高效地浏览源码, 其功能就像vc中的workpace
" 那里面列出了当前文件中的所有宏,全局变量, 函数名等

" 常规模式下输入 tl 调用插件，如果有打开 Tagbar 窗口则先将其关闭
" nmap tl :TagbarClose<CR>:Tlist<CR>
nmap tl :Tlist<CR>

let Tlist_Show_One_File=1                   "只显示当前文件的tags
" let Tlist_Enable_Fold_Column=0              "使taglist插件不显示左边的折叠行
let Tlist_Exit_OnlyWindow=1                 "如果Taglist窗口是最后一个窗口则退出Vim
" let Tlist_File_Fold_Auto_Close=1            "自动折叠
let Tlist_WinWidth=30                       "设置窗口宽度
let Tlist_Use_Right_Window=1                "在右侧窗口中显示

