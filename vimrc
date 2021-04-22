""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""vim-plug: Vim plugin manager"""""""""""""""""""""""""""""""""""""""""
" Download plug.vim and put it in ~/.vim/autoload
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""" Specify a directory for plugins""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Install plugin: :PlugInstall
" delete plugin:  :PlugClean
" check status:   :PlugStatus

" Any valid git URL is allowed

" 1.自动补全插件
Plug 'https://github.com/codota/tabnine-vim'

" 2.自动补全引号、圆括号、花括号等插件
Plug 'https://github.com/jiangmiao/auto-pairs'

" 3.if/end/endif/endfunction补全插件
Plug 'https://github.com/tpope/vim-endwise'

" 4.代码资源管理器插件
Plug 'https://github.com/preservim/nerdtree'

" 5.状态栏美化插件
Plug 'https://github.com/vim-airline/vim-airline'

" 6. 跳转函数调用插件
"Plug 'https://github.com/brookhong/cscope.vim'
Plug 'https://github.com/ruben2020/codequery'

" 7. 显示当前文件的函数名和变量的插件
Plug 'https://github.com/vim-scripts/taglist.vim'

" 8. 主题颜色插件
Plug 'https://github.com/flazz/vim-colorschemes.git'

" 9.切换主题颜色插件 
Plug 'https://github.com/chxuan/change-colorscheme'

"Initialize plugin system
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""vimrc configuration"""""""""""""""""""""""""""""""""""
set backspace=2 ""#解决插入模式下delete/backspce键失效问题
set nu          "设置行号
set autoindent  "自动缩进

set tabstop=4   "tab 键为4个空格
set shiftwidth=4 "设置自动缩进长度为4个空格
set expandtab
set smarttab

syntax on       "语法高亮
set hlsearch    "高亮查找匹配
set cursorline  "光标所在的当前行高亮"

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Show matching brackets when text indicator is over them
set showmatch

" Ignore case when searching
set ignorecase

" Makes search act like search in modern browsers
set incsearch

" Set to auto read when a file is changed from the outside
set autoread
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""general configuration"""""""""""""""""""""""""""""""""""""
" map leader to comma ,
let mapleader = "," 

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /

" Set the h and l commands move out of the current line
set ww=<,>,[h,l] 

" set Crtl+up/down to adjust window
"nmap <C-Up>    :resize +5<CR>
"nmap <C-Down>  :resize -5<CR>
nmap <C-Left>  :vertical resize-5<CR>
nmap <C-Right> :vertical resize+5<CR>

" 编码设置
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""NERDTree代码资源管理器快捷键""""""""""""""""""""""""""""""""""
" toggle NERDTree
nnoremap <C-l> :NERDTreeToggle<cr>

" 定位当前文件
nnoremap <C-k> :NERDTreeFind<cr>
" 打开vim时启动NERDTree并将光标放置另一窗口
"autocmd VimEnter * NERDTreeFind | wincmd p
" autocmd VimEnter * NERDTree | wincmd p
" 当NERDTree是最后一个窗口,关闭NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" 设置代码资源管理器在右边窗口
let NERDTreeWinPos="right" 
" 自动显示书签
"let NERDTreeShowBookmarks=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""主题颜色插件设置默认颜色"""""""""""""""""""""""""""""""""""""""
"colorscheme morning
"colorscheme simplewhite
"colorscheme solarized8_dark_high
"colorscheme solarized8_dark_low
"colorscheme solarized
"set background=dark
"colorscheme solarized8_dark
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""change-colorscheme切换主题插件快捷键""""""""""""""""""""""""""""""
nnoremap <silent> <F9> :PreviousColorScheme<cr>
nnoremap <silent> <F10> :NextColorScheme<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""taglist显示文件的函数名和变量快捷键"""""""""""""""""""""""""""""""""
"map <F2> :TlistOpen <CR>
map <C-h> :TlistToggle<CR>
let Tlist_Auto_Open= 0
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的 
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 0 "在右侧窗口中显示taglist窗口 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""cscope快捷键""""""""""""""""""""""""""""""""""""""""""""
"在ws目录下执行以下命令 or 把以下命令定义在~/.bashrc
"find ./dcts/ -name "*.h" -o -name "*.c" -o -name "*.cpp" > cscope.files
"find ./casa/ -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.conf" -o -name "*.cmd" >> cscope.files
"find ./thirdparty/ -name "*.h" -o -name "*.c" -o -name "*.cpp" >> cscope.files
"cscope -bkq 2>/dev/null
cs add cscope.out

if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
if filereadable("cscope.out")
    cs add cscope.out
    " else add database pointed to by environment
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif
    set csverb
endif

":cscope  find 选项:
"s:         查找C语言符号，即查找函数名、宏、枚举值等出现的地方;
"g:         查找函数、宏、枚举等定义的位置，类似ctags所提供的功能;
"d:         查找本函数调用的函数;
"c:         查找调用本函数的函数;
"t:         查找指定的字符串;
"e:         查找egrep模式，相当于egrep功能，但查找速度快多了;
"f:         查找并打开文件，类似vim的find功能;
"i:         查找包含本文件的文件;
nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>
    
" 手动查找指定字符串
nmap <leader>v :cs find t 
"set cscopequickfix=s-,c-,d-,i-,t-,e-,a-,g-
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
