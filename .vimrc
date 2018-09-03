" :so % to refresh the vim
set encoding=UTF-8
" change the ladder key to space
let mapleader="\<Space>"
" helpers for dealing with other people's code
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>

set showbreak=… " show ellipsis at breaking

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
"SpellChecker | space+s+p will correct the previous spell error 
set spell spelllang=en_us
function! FixSpellError()
	normal! mm[s1z=`m
endfunction!
nnoremap <leader>sp :call FixSpellError()<cr> 

function! AddWordToDictionary()
	exe "normal [syiw:spellgood \<C-R>0 \<cr>"
endfunction!

nnoremap <leader>sa :call AddWordToDictionary()<CR>

" Configure Robel TEST5  Vundle this is 
set nocompatible	"required for vundle 
filetype off	 	"required  
"set the runtime path to include vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() 	  " required for vundle 

Plugin 'VundleVim/Vundle.vim'

" vimwiki Note Taking  
Plugin 'vimwiki/vimwiki'
let g:vimwiki_ext2syntax = {'.md':'markdown'}
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Vim-instant-markdown - Instant Markdown previews for vim
Plugin 'suan/vim-instant-markdown'
let g:instant_markdown_autostart = 0	"disable autostart
nnoremap <leader>md :InstantMarkdownPreview<CR>
" added nerdtree
Plugin 'scrooloose/nerdtree'
" Add icon to files.
Plugin 'ryanoasis/vim-devicons'
" added indentLine
"Plugin 'Yggdroot/indentLine'
"Plugin 'nathanaelkane/vim-indent-guides'

"Auto complete
Plugin 'Valloric/YouCompleteMe'
"
" detect indent style (tabs vs. spaces)
Plugin 'tpope/vim-sleuth'
"STATUS BAR
Plugin 'itchyny/lightline.vim'
set laststatus=2 "required for lightline 

" context-aware pasting
Plugin 'sickill/vim-pasta'
"Colorscheme
"Plugin 'sjl/badwolf'

"set laststatus=3

call vundle#end()	  " required for vundle 
filetype plugin indent on " required for vundle 

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :Plugin Clean      - confirms removal of unused plugins; append `!` to auto-approve removal

map <C-n> :NERDTreeToggle<CR>
" NERD Tress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('java', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')



syntax on
set ruler
set cursorline

"Make searching better
set gdefault
set hlsearch
set ignorecase
set smartcase
set incsearch
set showmatch "show matching braces

"NUMBERS
set number
set numberwidth=5
set relativenumber
" Toggle relative numbering
set rnu
function! ToggleNumbersOn()
	set nu!
	set rnu
endfunction

function! ToggleRelativeOn()
	set rnu!
	set nu
endfunction

autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

filetype plugin on

map <right> : echo 'NO Right'<cr>
map <left> : echo 'NO Left'<cr>
map <up> : echo 'NO Up'<cr>
map <down> : echo 'NO Down'<cr>

"Navigate properly when lines are wrapped 
nnoremap j gj
nnoremap k gk

"code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1 

set autoindent " automatically set indent of new line
set smartindent

set background=dark
let g:solarized_termcolors=256
colorscheme solarized 
