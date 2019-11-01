"===================================================================
"   @     判断操作系统是win还是Linux或者mac
"===================================================================
let g:iswindows=0
let g:islinux=0
if(has("win32")||has("win64"))
    let g:iswindows=1
else
    let g:islinux=1
endif
"===================================================================
"   @   判断是否是gvim
"===================================================================
if has("gui_running")
    let g:isgui=1
else
    let g:isgui=0
endif
"===================================================================
"   @   auto download plug.vim
"===================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"=============================================================
"   @   Plugins With Plug
"=============================================================
if g:islinux
   call plug#begin('~/.vim/plugged')
else
   call plug#begin('$VIM/plugged')
endif
Plug 'vim-scripts/a.vim'                                      "能够实现文件接口切换
Plug 'vim-scripts/matchit.zip'                                "扩展%功能的插件，成对跳转
Plug 'Shougo/neocomplcache.vim'                               "自动补全
"Plug 'vim-scripts/OmniCppComplete'                            "C++补全插件
Plug 'scrooloose/nerdcommenter'                               "注释插件
Plug 'kshenoy/vim-signature'                                  "书签可视化插件
Plug 'majutsushi/tagbar'                                      "taglist的增强版，查看标签，依赖于ctags
Plug 'scrooloose/nerdtree'                                    "文件浏览
Plug 'Yggdroot/indentLine'                                    "缩进线
Plug 'https://github.com/junegunn/vim-easy-align.git'         "自动对其代码
Plug 'https://github.com/mbbill/echofunc.git'                 "显示函数原型 
Plug 'https://github.com/Valloric/YouCompleteMe.git'          "YCM补全
"Plug 'w0rp/ale'                                               "语句错误检查
Plug 'octol/vim-cpp-enhanced-highlight'                       "C++语法高亮
Plug 'luochen1990/rainbow'                                    "彩虹括号
Plug 'Yggdroot/LeaderF'
Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'honza/vim-snippets'
Plug 'https://github.com/yinflying/matlab.vim.git'            "matlab插件
Plug 'vim-latex/vim-latex'                                    "for latex
Plug 'jiangmiao/auto-pairs'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" for general writing
Plug 'reedes/vim-wordy'
Plug 'ron89/thesaurus_query.vim'
Plug 'terryma/vim-multiple-cursors'     "multiple cursors action
" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'airblade/vim-gitgutter'

call plug#end()

filetype on
filetype plugin on
filetype indent on
syntax on

let mapleader = ";"

" => Fileformat
"Favorite filetype
set ffs=unix,dos,mac
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>
" -----------------------------------------------------------------------------
"   @   通用映射
" -----------------------------------------------------------------------------
inoremap jk <ESC>:wa<CR>
vnoremap jk <ESC>:wa<CR>
cnoremap jk <ESC>:wa<CR>
inoremap <c-h> <LEFT>
inoremap <c-j> <DOWN>
inoremap <c-k> <UP>
inoremap <c-l> <RIGHT>
cnoremap <c-n> <DOWN>
cnoremap <c-p> <UP>
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>q :wq<CR>
nnoremap <Leader>w :wa<CR>
nnoremap Q         :q!<CR>
nnoremap <Leader><Leader>n  :set nu<CR>
nnoremap <Leader>h <c-w>h
nnoremap <Leader>k <c-w>k
nnoremap <Leader>l <c-w>l
nnoremap <Leader>j <c-w>j
inoremap <Leader>0 <esc>0i
inoremap <Leader>4 <esc>A
nnoremap <Leader>r  :terminal bash.exe<CR>
nnoremap <Leader>e %
"if g:islinux
    "fun! ToggleFullscreen()
        "call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
    "endf
    "nnoremap <silent> <F11> :call ToggleFullscreen()<CR>
"else
nnoremap <c-f>  :LeaderfFile<CR>
nnoremap <c-n>      <esc>:noh<CR>
"*******************************************************
"   设置主题
"*******************************************************
"colorscheme tatami
"colorscheme zenburn
"colorscheme distinguished
"colorscheme vividchalk
"colo seoul256
"let g:seoul256_background = 233
set bg=dark
"*******************************************************
"   @   General settings
"*******************************************************
if g:isgui                              "设置窗口初始位置及大小
    "au GUIEnter * simalt ~x             "开机自启动最大化
    winpos 10 0                       "设置窗口出现的位置
    set lines=33 columns=142            "设置窗口大小
endif
set history=400 "Sets how many lines of history VIM har to remember
set mouse=a "Have the mouse enabled all the time:
set nobackup
set noundofile
set noswapfile
set nowb
set autoread
let &termencoding = &encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,shift-jis,gb18030,gbk,gb2312,cp936,latin-1
"language Messages zh_CN,utf-8 "解决consle输出乱码
"set guifont=YaHei\ Consolas\ Hybrid:h14  "设置字体
set guifont=Monaco:h14
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set linebreak
set textwidth=100
set autoindent
set smartindent
set cindent "C-style indenting
set nowrap "禁止折行
set so=7 "Set 7 lines to the curors - when moving vertical..
set wildmenu
set ruler
set laststatus=2 "设置2行
set t_Co=256
set nu
set relativenumber
set numberwidth=6
set lazyredraw "Do not redraw, when running macros.. lazyredraw
set hid "Change buffer - without saving
set whichwrap+=<,>,h,l "Bbackspace and cursor keys wrap to
set ignorecase
set incsearch
set cursorline
set magic "Set magic on
set noerrorbells "no sound on errors
set novisualbell "no sound on errors
set showmatch "show matching bracet
set mat=4 "How many tenths of a second to blink
set hlsearch
set nocompatible "不设置兼容
set backspace=indent,eol,start
set gcr=a:block-blinkon0 "禁止光标闪烁
if has("gui_running") " 禁止显示菜单，工具栏，滚动条
    set guioptions-=m
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
endif
"set foldmethod=indent "基于缩进折叠
set foldmethod=syntax "基于语法进行折叠
"set foldmethod=manual "手动折叠
set nofoldenable      "启动代码时关闭折叠
set shellslash
"=========================================================
"   @   a.vim配置，相关文件的切换
"=========================================================
nnoremap <silent> <Leader>ch :A<CR>
nnoremap <silent> <Leader>g :IH<CR>
nnoremap <silent> <Leader>v :AV<CR>
"=========================================================
"   @   nerdtree的配置信息
"=========================================================
set tags=tags;
set autochdir
nnoremap <Leader>t :NERDTreeToggle<CR>  "目录树打开与否的转换
let NERDTreeNaturalSort = 1    "按照自然数序列排序
"let NERDTreeIgnore = ['\.ini$']
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='right'
let NERDTreeAutoDeleteBuffer=1
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""修改树的显示图标
"let g:NERDTreeDirArrowExpandable = '►'
"let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeAutoCenter=1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
"=========================================================
"   @   tagbar配置
"=========================================================
nnoremap <s-b> :!ctags -R --C-kinds=+p --fields=+iaS --extra=+q<CR>
nnoremap <c-b> :TagbarToggle<CR>
let g:tagbar_left = 1
"let g:tagbar_vertical = 15
let g:tagbar_autoshowtag=1
let g:tagbar_width = 30
let g:tagbar_zoomwidth = 0
let g:tagbar_autoclose = 0
let g:tagbar_sort = 0
let g:tagbar_show_linenumbers = 1
" -----------------------------------------------------------------------------
"  < indentLine 插件配置 >
" -----------------------------------------------------------------------------
nmap <leader>ii :IndentLinesToggle<CR>
" 设置Gvim的对齐线样式
let g:indentLine_enabled = 1
if g:isgui
    let g:indentLine_char = "|"
    let g:indentLine_first_char = "|"
endif
"------------------------------------------------------------------------------
"   @   vim-easy-align
"------------------------------------------------------------------------------
vmap <enter>    <Plug>(EasyAlign)
"------------------------------------------------------------------------------
"   @   omnicppcomplete
"------------------------------------------------------------------------------
nnoremap <silent> <Leader><Leader>c :!ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f cpp<cr>
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_NamespaceSearch = 2
let OmniCpp_DisplayMode = 1
let OmniCpp_ShowScopeInAbbr = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_DefaultNamespaces = ["std", "MyNamespace"]
let OmniCpp_MayCompleteScope = 1
let OmniCpp_SelectFirstItem = 2
"------------------------------------------------------------------------------
"   @   ALE     语法错误检查
"------------------------------------------------------------------------------
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 100
let g:ale_echo_delay = 20
let g:ale_lint_delay = 300
let g:ale_sign_error = '?'
let g:ale_sign_warning = '?'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
"错误背景显示
let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRar gui=undercurl guisp=green
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)e gui=undercurl guisp=magenta
let g:ale_linters = {
  \   'csh': ['shell'],
  \   'hack': ['hack'],
  \   'help': [],
  \   'perl': ['perlcritic'],
  \   'perl6': [],
  \   'python': ['flake8', 'mypy', 'pylint'],
  \   'rust': ['cargo'],
  \   'spec': [],
  \   'text': [],
  \   'vue': ['eslint', 'vls'],
  \   'zsh': ['shell'],
  \   'c': ['gcc'],
  \   'c++': ['clang'],
  \   'java': ['jdk'],
  \}
"------------------------------------------------------------------------------
"   @   vim-cpp-enhance-hightlight  C++语法高亮 
"------------------------------------------------------------------------------
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1
let c_no_curly_errly = 1
"------------------------------------------------------------------------------
"   @   vim-latex
"------------------------------------------------------------------------------
let g:tex_flavor='latex'
let g:tex_conceal = ""
set grepprg=grep\ -nH\ $*
set iskeyword+=;
autocmd BufEnter *.tex set sw=2
let g:Tex_CompileRule_dvi='latex -src-specials -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'SumatraPDF -reuse-instance -inverse-search "gvim -c \":RemoteOpen +\%l \%f\""'
nnoremap  <F2> <ESC>:call Tex_RunLaTeX()<CR>
nnoremap  <F3> <ESC>:call Tex_ViewLaTeX()<CR>
"------------------------------------------------------------------------------
"   @   rainbow
"------------------------------------------------------------------------------
let g:rainbow_active = 1
let g:rainbow_conf = {
    \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \}
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
"------------------------------------------------------------------------------
"   @   关于编译的一些配置
"------------------------------------------------------------------------------
nnoremap <F2> :call Compiles()<CR>
nnoremap <F3> :call Runs()<CR>
func! Compiles()
    exec "w"
    if &filetype == 'c'
        exec '!gcc % -o %<.exe'
    elseif &filetype == 'python'
        exec '!python %'
    elseif &filetype == 'java'
        exec '!javac %'
    elseif &filetype == 'tex'
        exec 'call Tex_RunLaTeX()'
    endif
endfunc
func! Runs()
    if &filetype == 'c'
        exec '! %<'
    elseif &filetype == 'java'
        exec '!java %<'
    elseif &filetype == 'sh'
        exec '! %'
    elseif &filetype == 'tex'
        exec 'call Tex_ViewLaTeX()'
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    endif
endfunc

"------------------------------------------------------------------------------
"   @   文件头
"------------------------------------------------------------------------------
autocmd BufNewFile *.java,         exec ":call SetTitle1()"
autocmd BufNewFile *.py,*.sh       exec ":call SetTitle2()"
func! SetTitle1()
    call setline(1,"/*==================================================================================================")
    call append(line("."),"     Copyright (C)   :   2019")
    call append(line(".") + 1,"         File Name   :   ".expand("%"))
    call append(line(".") + 2,"         Discription :   ")
    call append(line(".") + 3,"         Author      :    Li Minghua")
    call append(line(".") + 4,"         Date        :   ".strftime("%c"))
    call append(line(".") + 5,"==================================================================================================*/")
    call append(line(".") + 6,"")
endfunc
func! SetTitle2()
    call setline(1,"#==================================================================================================")
    call append(line("."),"#      Copyright (C)   :   2019")
    call append(line(".") + 1,"#         File Name   :   ".expand("%"))
    call append(line(".") + 2,"#         Discription :   ")
    call append(line(".") + 3,"#         Author      :    Li Minghua")
    call append(line(".") + 4,"#         Date        :   ".strftime("%c"))
    call append(line(".") + 5,"#==================================================================================================")
    call append(line(".") + 6,"")
endfunc  

"------------------------------------------------------------------------------
"   @   YCM配置
"------------------------------------------------------------------------------
let g:ycm_complete_in_comments = 1  "在注释中也能补全"
let g:ycm_complete_in_strings = 1   "在字符串中也能补全"
let g:ycm_cache_omnifunc = 0        "每次都重新生成匹配项"
let g:ycm_min_num_of_chars_for_completion = 2 "从第二个开始补全"
let g:ycm_seed_identifiers_with_syntax = 1  "语法关键字补全"
let g:ycm_confirm_extra_conf=0     
"let g:ycm_autoclose_preview_window_after_completion = 1 
let g:ycm_error_symbol = '!' 
let g:ycm_warning_symbol = '?'
let g:ycm_key_list_select_completion = ['<c-n>']
let g:ycm_key_list_previous_completion = ['<c-p>']

"按,jd 会跳转到定义 
"nnoremap <c-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>  
"------------------------------------------------------------------------------
"   @   ultisnips配置
"------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"定义存放代码片段的文件夹 .vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
"let g:UltiSnipsSnippetDirectories=["snippets", "plugged/vim-snippets/UltiSnips"]
"
"
"------------------------------------------------------------------------------
"   @   markdown配置
"------------------------------------------------------------------------------
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = '/home/qxqx/Downloads/firefox/firefox'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,l --------<Enter>



