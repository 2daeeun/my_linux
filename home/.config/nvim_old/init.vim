"==========기본 설정값==========
set syntax=on			                            "구문강조
set tags=./tags,tags,../tags,/usr/tags              " 자신의 디렉토리 및 상위 디렉토리 경로
set encoding=UTF-8		                            "한글 깨짐 방지 
set fileencodings=utf-8,euc-kr,cp949                "한글 사용
set termguicolors		                            "트루 컬러 지원
set number                                          "라인 넘버 표시(set nu 라고 입력해도 됨)
"set nonumber                                       "라인 넘버 비활성(set nu! 라고 입력해도 됨)
set hlsearch                                        "검색 시 하이라이트 
set ignorecase                                      "검색 시 대소문자 무시하기
"set noignorecase                                   "검색 시 대소문자 구분하기
set showmatch                                       "현재 선택된 괄호의 쌍을 표시
set history=100                                     "vi 편집기록 기억갯수
set title                                           "타이틀바에 현재 편집 중인 파일을 표시
set cursorline                                      "커서가 있는 라인을 강조 표시 
set wrap                                            "너무 긴 줄 자동 줄바꿈
"set nowrap                                         "wrap 해제
"set mouse=a                                        "터미널 창에 마우스 (mouse) 클릭이 가능하도록 설정
set clipboard=unnamed                               "시스템의 클립 보드에서 vim 붙여 넣기. 
set noswapfile                                      "vim에서 스왑 파일 생성 비활성화
set nobackup                                        "vim에서 백업 파일 안 생기게 하기
set smartindent                                     "스마트한 들여 쓰기 사용
set autoindent                                      "자동 들여 쓰기를 사용
set cindent                                         "C언어 자동 들여 쓰기
set tabstop=4                                       "탭을 4칸으로
set shiftwidth=4                                    ">> 또는 << 키로 들여 쓰기 할때 스페이스의 갯수. 기본값 8
set expandtab                                       "탭을 스페이스로 바꾸기
set langmap=ㅁa,ㅠb,ㅊc,ㅇd,ㄷe,ㄹf,ㅎg,ㅗh,ㅑi,ㅓj,ㅏk,ㅣl,ㅡm,ㅜn,ㅐo,ㅔp,ㅂq,ㄱr,ㄴs,ㅅt,ㅕu,ㅍv,ㅈw,ㅌx,ㅛy,ㅋz


"==========플러그인 설치==========
call plug#begin('~/.local/share/nvim/plugged')
" ----꾸미기 관련-----
Plug 'joshdick/onedark.vim'                         "onedark 테마
Plug 'vim-airline/vim-airline'                      "airline(vi 하단하고 상단 꾸밈)              
Plug 'vim-airline/vim-airline-themes'               "airline 테마
" -----자동완성-----
Plug 'neoclide/coc.nvim', {'branch': 'release'}     "Use release branch
" Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}             " Or latest tag
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}      " Or build from source code by use yarn: https://yarnpkg.com
" Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }    "파이썬 자동 완성
" Plug 'yaegassy/coc-pydocstring', {'do': 'yarn install --frozen-lockfile'}                               "coc-pydocstring
Plug 'davidhalter/jedi-vim'                         "파이썬 자동완성
Plug 'vim-scripts/indentLine.vim'                   "들여쓰기 안내선
Plug 'jiangmiao/auto-pairs'                         "대괄호, 괄호, 따옴표 등을 쌍으로 삽입하거나 삭제.
Plug 'scrooloose/nerdcommenter'                     "주석 처리
" Plug 'chrisbra/vim-commentary'
" -----NERDTree-----
Plug 'scrooloose/nerdtree'                          "NERDTree 설치
Plug 'jistr/vim-nerdtree-tabs'                      "NERDTree Tabs 설치
Plug 'ryanoasis/vim-devicons'                       "NERDTree에 예쁜 아이콘을 붙여주는 플러그인,nerd font 설치 필요함
" -----HTML/CSS/JavaScript-----
"Plug 'mattn/emmet-vim'  							"html:5 를 입력 후 ctrl y 를 누른 뒤 ,를 누르면 html폼이 완성되는 플러그인
"Plug 'ap/vim-css-color'                            "css 소스코딩 하는 동안 색상들을 미리 보는 것
"Plug 'ying17zi/vim-live-latex-preview'             "vim-live-latex-previe
" -----태그생성-----
Plug 'preservim/tagbar'                             "현재 파일내의 class, struct, prototype, typedef, macro 등을 요약하여 표시한다.
Plug 'vim-scripts/taglist.vim'                      "taglist
Plug 'xolox/vim-easytags'                           "ctags를 쉽게 쓸 수 있게 해주는 easytags플러그인
Plug 'xolox/vim-misc'
Plug 'ronakg/quickr-cscope.vim'                     "cscope를 vim에서 편하게 쓸 수 있도록 도와주는 quickr-cscope.vim 플러그인
" -----개발 보조 플러그인 -----
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }     "Markdown Preview
Plug 'wakatime/vim-wakatime'                        "wakatime
Plug 'vim-scripts/DoxygenToolkit.vim'               "Doxygen
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'bfrg/vim-cpp-modern'                          "Extended Vim syntax highlighting for C/C++
Plug 'rhysd/vim-clang-format'                       "clang-format (base is vjj
Plug 'pboettch/vim-cmake-syntax'                    "syntax highlighting CMake
" Plug 'justmao945/vim-clang'
" Plug 'mhartington/formatter.nvim'                   "clang-format (base is Lua)
" -----Git-----
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
" -----유용하지만 사용 안하는 플러그인-----
"Plug 'tpope/vim-fugitive'                          "git과 함께 쓰면 좋은 것
"ctrlp.vim                                          "vim내에서 파일을 쉽게 검색해서 해당 파일을 열게 해주는 플러그인
"Plug 'anyakichi/vim-surround'                      "수동 괄호 감싸기
"Plug 'mhinz/vim-startify'                          "Vim 및 Neovim의 시작 화면을 제공
call plug#end()


"-----플러그인 설치를 위한 설정-----
" if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
"   silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
"      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
" endif

"-----CoC 설정-----
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"----- Onedakr colorscheme 설정 -----                          
colorscheme onedark
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
hi Normal guibg=NONE ctermbg=NONE

"----- 버퍼 목록을 IDE의 탭처럼 보고 사용하기 -----
let g:airline#extensions#tabline#enabled = 1              " vim-airline 버퍼 목록 켜기
let g:airline#extensions#tabline#fnamemod = ':t'          " vim-airline 버퍼 목록 파일명만 출력
let g:airline#extensions#tabline#buffer_nr_show = 1       " buffer number를 보여준다
let g:airline#extensions#tabline#buffer_nr_format = '%s:' " buffer number format

"----- Doxygen -----
let g:DoxygenToolkit_briefTag_pre="@brief 간략한 설명"
let g:DoxygenToolkit_paramTag_pre="@param 파라미터 설명"
let g:DoxygenToolkit_returnTag="@return  반환형 설명"
let g:DoxygenToolkit_blockHeader="-------------------------------"
let g:DoxygenToolkit_blockFooter="---------------------------------"
let g:DoxygenToolkit_authorName="이대은(Dae-eun Lee)"
let g:DoxygenToolkit_licenseTag="https://github.com/2daeeun"

"----- Nerd Tree -----
let NERDTreeWinPos = "left"
nmap <F7> :NERDTree<CR>
nnoremap <leader>r :NERDTreeFind<CR>

"----- Emmet 자동완성 단축키 -----
" let g:user_emmet_leader_key=','

"----- Indent Guides(들여쓰기 안내선) -----
let g:indentLine_char = '┆'
let g:indentLine_color_term = 256

"----- tagbar -----
nmap <F8> :TagbarToggle<CR>

"----- ctag -----
let g:easytags_async=1
let g:easytags_auto_highlight = 0 
let g:easytags_include_members = 1
let g:easytags_dynamic_files = 1

"----- cscope 자동 로드 함수 -----
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  " else add the database pointed to by environment variable 
  elseif $CSCOPE_DB != "" 
    cs add $CSCOPE_DB
  endif
endfunction
au BufEnter /* call LoadCscope()

"----- NERD Commenter -----
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
map <Leader>cc <plug>NERDComToggleComment
map <Leader>c<space> <plug>NERDComComment

"----- vim-cpp-modern -----
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1

"----- Clang-format -----
nmap <F10> :ClangFormat<CR>
" let g:clang_format#auto_format = 1
" autocmd FileType c ClangFormatAutoEnable

"----- Neovim 버전이 0.5이상이 아니어서 생기는 오류  -----
let g:coc_disable_startup_warning = 1

"----- 컴파일 단축키 -----
autocmd FileType python nnoremap <F9> :w <bar> exec '!python '.shellescape('%')<CR>
" autocmd FileType c nnoremap <F9> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd FileType c nnoremap <F9> :w <bar> exec '!gcc -g -o '.shellescape('%:r').' '.shellescape('%').' && ./'.shellescape('%:r')<CR>
autocmd FileType cpp nnoremap <F9> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd FileType java nnoremap <buffer> <F9> :exec '!javac' shellescape(expand('%'), 1) '&& java' shellescape(expand('%:r'), 1)<CR>

"이거 복사 붙여넣기 끝난 뒤에는 nvim에서 source % 하고 PlugInstall 하고 UpdateRemotePlugins 입력하기(플러그인 삭제는 PlugClean)
