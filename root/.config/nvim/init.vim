"==========기본 설정값==========
set syntax=on                                       "구문강조
set tags=./tags,tags,../tags,/usr/tags              " 자신의 디렉토리 및 상위 디렉토리 경로
set encoding=UTF-8                                  "한글 깨짐 방지 
set fileencodings=utf-8,euc-kr,cp949                "한글 사용
set termguicolors                                   "트루 컬러 지원
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

"----- 컴파일 단축키 -----
autocmd FileType python nnoremap <F9> :w <bar> exec '!python '.shellescape('%')<CR>
" autocmd FileType c nnoremap <F9> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd FileType c nnoremap <F9> :w <bar> exec '!gcc -g -o '.shellescape('%:r').' '.shellescape('%').' && ./'.shellescape('%:r')<CR>
autocmd FileType cpp nnoremap <F9> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd FileType java nnoremap <buffer> <F9> :exec '!javac' shellescape(expand('%'), 1) '&& java' shellescape(expand('%:r'), 1)<CR>

