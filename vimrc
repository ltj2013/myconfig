if !empty($GOROOT)
  set rtp+=$GOROOT/misc/vim
elseif isdirectory('/usr/local/go')
  set rtp+=/usr/local/go/misc/vim
end

set nocompatible
" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
" behave mswin
source $VIMRUNTIME/ftplugin/man.vim
source ~/.vim/cscope_maps.vim
source ~/.vim/cscopePath.vim


" Chenyh's setting
" for Linux

set number   
" set cmdheight=2
colo darkblue  
set autoindent
set smartindent
set nocompatible 
set autochdir
set smarttab
set noexpandtab                         " use tabs, not spaces
set tabstop=8                           " tabstops of 8
set shiftwidth=8                        " indents of 8
set textwidth=78                        " screen in 80 columns wide, wrap at 78
set backspace=indent,eol,start

autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab

" set mouse=a

set nocp
filetype off
syntax on    


set isfname-==

" set tags+=$VIMRUNTIME/../vimfiles/tags/sdltags
" set tags+=$VIMRUNTIME/../vimfiles/tags/boosttags
set tags+=~/prog/myconfig/tags/stltags
set tags+=./tags,../tags,../../tags,../../../tags
" set tags+=$VIMRUNTIME/../vimfiles/tags/systags

let Tlist_File_Fold_Auto_Close=1
" let Tlist_Ctags_Cmd='/usr/bin/ctags'


noremap <c-down> <c-w>j
noremap <c-up> <c-w>k
noremap <c-left> <c-w>h
noremap <c-right> <c-w>l


"let OmniCpp_DefaultNamespaces = ["std"]
let OmniCpp_GlobalScopeSearch = 1  " 0 or 1
let OmniCpp_NamespaceSearch = 1   " 0 ,  1 or 2
let OmniCpp_DisplayMode = 0
let OmniCpp_ShowScopeInAbbr = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu


set foldenable
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" map <esc>
imap jk <Esc>
set timeoutlen=500


nnoremap <C-N> :tabnew<space>

let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
let g:winManagerWidth = 30
 
nmap <silent> <F3> :WMToggle<cr>
let g:AutoOpenWinManager = 1

if has("win32") 
set guifont=Consolas:h11 
endif 

" autocmd FileType python set omnifunc=pythoncomplete#Complete

" Latex
let g:Tex_DefaultTargetFormat='pdf'

" let g:fencview_autodetect = 1

nnoremap <C-P> :tabp<CR>
nmap M :Man <cword><CR>

nnoremap <silent> <F8> :TlistToggle<CR>
noremap <C-T> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --if0=yes . <CR>

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" " required! 
Plugin 'gmarik/vundle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/vim-easy-align'
Plugin 'rust-lang/rust.vim'
Bundle 'vim-ruby/vim-ruby'

call vundle#end()            " required
filetype plugin indent on

" for YouCompleteMe
let g:ycm_global_ycm_extra_conf = expand("~/.vim/.ycm_extra_conf.py")
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_seed_identifiers_with_syntax=1
" suppress default value
let g:ycm_filetype_blacklist = {'tagbar' : 1,'qf' : 1,'notes' : 1,'unite' : 1,'vimwiki' : 1,}

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <C-K> :YcmCompleter GoToDefinitionElseDeclaration<CR>

"let g:ycm_global_ycm_extra_conf = "./.ycm_extra_conf.py"

" not working
function! g:UltiSnips_Complete()
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips_JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

"au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsExpandTrigger = '<c-e>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsListSnippets = '<c-l>'

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
