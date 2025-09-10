"===============================================================================
"=== Tips for Vim
"===============================================================================
"list the matches
" :g/regular-expression/p  #p for print
"
"list the matches with line number
" :g/regular-expression/#
"
" %: move to the matching braces
" [{: jump to the beginning of a C code block
" ]}: jump to the end of a C code block
"
"Execute {cmd} in each buffer in the buffer list
" :bufdo! [cmd]

"===============================================================================
"=== gVim settings
"===============================================================================
"set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
"
"set guioptions-=e  "no GUI tabs
"

"===============================================================================
"=== general Vim settings
"===============================================================================
"colorscheme darkblue
"colorscheme torte        "good for demo
syntax enable

set colorcolumn=120
set textwidth=120
highlight ColorColumn ctermbg=green guibg=orange

"set termencoding=cp950
"set background=dark
set autochdir
let &titleold='Terminal'
set title
set showmatch
set ruler
set showcmd

set incsearch
set hlsearch

"To change all the existing tab characters to match the current tab settings, use :retab.
set autoindent
set smartindent
set cindent

set expandtab
"set tabstop=4
set softtabstop=4  "interpret tab key as an indent
set shiftwidth=4
set backspace=eol,start,indent


set visualbell
set number

" override tab settings for make files (i.e. use real tabs and not spaces)
autocmd FileType make setlocal noexpandtab tabstop=4

"set whichwrap+=h,l

"Show the tab and trailing space characters
set list
"set listchars=tab:»·,trail:·
set listchars=tab:>-,trail:-

set history=500
set backspace=indent,eol,start

set tabpagemax=100

"XML folding
au FileType xml setlocal foldmethod=syntax
"zn: disable the folding
"zN: enable the folding
"za: open one closed fold under cursor / close one open folds under cursor
"zA: open all folds under cursor recursively / close all folds under cursor recursively
"zo: open one fold under cursor
"zO: open all folds under cursor recursively
"zc: close one fold under cursor
"zC: open all folds under cursor recursively
"
"[z: Move to the start of the current open fold.
"]z: Move to the end of the current open fold.
"zj: Move downwards to the start of the next fold.
"zk: Move upwards to the end of the next fold.

"Use the following command to enable folding at runtime
"set foldmethod=syntax
let g:xml_syntax_folding=1
set nofoldenable " | nofoldenable

"===============================================================================
"=== key mappings for file editing
"===============================================================================
"easy edit of files in the same directory
"to enter the ^M (enter): ctrl+v + Enter
"to enter the ^[ (esc):   ctrl+v + ESC
"to enter the ^R:         ctrl+v + ctrl+r
noremap ,e :e <C-R>=expand("%:p:h") . "/"<C-M>
noremap ,f :silent 1,$!xmllint --format --recover - 2>/dev/null<C-M>
noremap ,j :%!jq '.'<C-M>
"noremap ,j :silent 1,$!jsonlint --format<C-M>
"noremap ,j :silent 1,$!python -m json.tool<C-M>
noremap ,t :tabnew <C-R>=expand("%:p:h") . "/"<C-M>
noremap ,h :tabnew <C-R>=expand("%:p:r") . ".h*"<C-M><C-M>

xnoremap <Tab> >gv   "key map for indent in the visual mode
xnoremap <S-Tab> <gv   "key map for indent in the visual mode

"Search for visually-selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"===============================================================================
"=== key mappings for buffers and windows
"===============================================================================
"To switch to the next buffer, :bnext!, bprevious!
"To delete a buffer, :bdelete!
"To find the current buffers, use ':ls'
noremap <F4> :bprevious!<CR>

"Switch between windows, maximizing the current window
set winminheight=1
noremap <C-J> <C-W>j<C-W>_
noremap <C-K> <C-W>k<C-W>_

"To resize the window to height 12, ':res 12'


"===============================================================================
"=== vim tips
"===============================================================================
"Execute {cmd} in each buffer in the buffer list
":bufdo! [cmd]


"===============================================================================
"=== colorscheme must be installed first.
"===============================================================================
colorscheme everforest
"colorscheme gruvbox

set background=dark

"===============================================================================
" Press Ctrl+_ to comment out a line or selected range of lines.
" This function uses the `//` C-style comment.
"===============================================================================
function! ToggleCommentForSelectedLines() range
  for lnum in range(a:firstline, a:lastline)
    let line_content = getline(lnum)
    if line_content =~ '^\s*\/\/'
      " Uncomment the line
      let new_line = substitute(line_content, '^\s*\/\/\s*', '', '')
      call setline(lnum, new_line)
    else
      " Comment the line
      call setline(lnum, '// ' . line_content)
    endif
  endfor
endfunction

" 'noremap' prevents recursive mappings.
nnoremap <C-_> :call ToggleCommentForSelectedLines()<CR>
vnoremap <C-_> :call ToggleCommentForSelectedLines()<CR>


"===============================================================================
"=== key mappings for vim-go
"===============================================================================
" Useful installation doc:
"    - https://tpaschalis.github.io/vim-go-setup/
"    - https://hackernoon.com/my-neovim-setup-for-go-7f7b6e805876
"
" Installation:
"    1. install gvm and go
"    2. install go packages
"       go install github.com/mgechev/revive@latest
"       go install github.com/rogpeppe/godef@latest
"       go install github.com/fatih/motion@latest
"       go install github.com/kisielk/errcheck@latest
"       go install github.com/go-delve/delve/cmd/dlv@latest
"       go install golang.org/x/tools/cmd/gorename@master
"       go install github.com/koron/iferr@master
"       go install github.com/jstemmer/gotags@master
"       go install github.com/josharian/impl@master
"       go install golang.org/x/tools/cmd/goimports@master
"       go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
"    3. run ":GoInstallBinaries" in vim
"    4. :helptags ~/.vim/pack/plugins/start/vim-go/doc/
"
" ===== OTHER PLUGINS ======
"    git clone https://github.com/fatih/vim-go.git        ~/.vim/pack/plugins/start/vim-go
"    git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline  (eye-candy)
"    git clone https://github.com/morhetz/gruvbox.git     ~/.vim/pack/default/start/gruvbox   (theme)
"    git clone https://github.com/tpope/vim-fugitive.git ~/.vim/pack/dist/start/vim-fugitive  (a git wrapper)
"    git clone https://github.com/dense-analysis/ale.git  ~/.vim/pack/plugins/start/ale
"    git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pack/dist/start/nerdtree
"
" ===== CHEAT SHEET ======
" :help vim-go
" :GoRun :GoBuild :GoInstall
" :GoDef               # goto definition of object under cursor
" gd                   # also has the same effect
" Ctrl-O / Ctrl-I      # hop back to your source file/return to definition
" :GoDoc               # opens up a side window for documentation, or "Shift+K"
" :GoTest              # run every *_test.go file and report results
" :GoTestFunc          # or just test the function under your cursor
" :GoCoverage          # check your test coverage
" :GoAlternate         # switch bewteen your test case and implementation
" :GoImport[!] [path]  # import package. The "!" will download the package.
" :GoImport            # manage and name your imports
" :GoImportAs
" :GoDrop
" :GoRename            # precise renaming of identifiers
" :GoLint              # lint your code
" :GoVer
" :GoErrCheck
" :GoAddTags           # manage your tags
" :GoRemoveTags
"
" :help compl-omni     # help for auto-completion

filetype plugin indent on
let g:go_fmt_command = "goimports"  " Run goimports along gofmt on each save
let g:go_auto_type_info = 1         " Automatically get signature/type info for object under cursor
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types= 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1

"let g:ale_sign_error = '⤫'
"let g:ale_sign_warning = ' '
"let g:airline#extensions#ale#enabled = 1

" Ctrl + X + O for auto completion
au filetype go inoremap <buffer> . .<C-x><C-o>
au filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
" Ex: `\b` for building, `\r` for running and `\t` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)


"===============================================================================
"=== plugin: visualmark
"===============================================================================
" line 55 is edited:
"       exec ":lan mes en_US.UTF-8"
"
" mm to add bookmark
" F2 & Shift+F2 to navigate bookmarks


"===============================================================================
"=== Copilot
"===============================================================================
" https://docs.github.com/en/copilot/using-github-copilot/getting-started-with-github-copilot?tool=vimneovim
"
":help copilot
":copilot enable


"===============================================================================
"=== plugin: bufferexplorer
"===============================================================================
"" to invoke bufferexplorer, \be or :bufexplorer
"" t: to open buffer in new tab
"" D: to delete buffer
"let g:bufExplorerDetailedHelp=1
"let g:bufExplorerFindActive=1
"let g:bufExplorerSortBy='name'


"===============================================================================
"=== plugin: NERDTree
"===============================================================================
" to invoke NERDTree, :NERDTree or \nt
"noremap \nt :NERDTree<CR>
" to invoke NERDTree, :NERDTree or Ctrl+G
:nnoremap <C-g> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.o$', '\.dep$', '\.gen$', '\.hpp$', '\.h$']
"
" t: to open file/directory in new tab
" T: same as 't' but keep the focus unchanged
" o: to open file/directory
" O: recursively open
" i: to open file/directory in split window
"
" x: close the currrent node's parent
" X: colose the current node's children
" p: Jump to the current node's parent
" P: Jump to the root node
" u: move the tree root up one directory
"
" r: to recursively refresh the current node
" q: to quick the NERDTree
" ?: for quick help
"
" B: toggle whether the bookmark table is displayed
" :Bookmark <name>, bookmark the current node


"===============================================================================
"=== plugin: FuzzyFinder
"===============================================================================
"" to invoke the fuzzy finder, :FuzzyFinderBuffer, :FuzzyFinderFile, :FuzzyFinderMruFile, :FuzzyFinderMruCmd, :FuzzyFinderBookmark
"noremap fb :FuzzyFinderBuffer<CR>
"noremap ff :FuzzyFinderFile<CR>
"noremap fc :FuzzyFinderMruCmd<CR>
"
""let g:FuzzyFinderOptions.Base.enumerating_limit = 10
"" Enter: to open file in the current window
"" <C-l>: to open file in a new tab
"" <C-t>: to change mode
"" to fresh the cache, :FuzzyFinderRenewCache
"" to recursively search the child directories, enter search patterns like "**\*.txt"

"===============================================================================
"=== plugin: EasyGrep
"===============================================================================
"" :help EasyGrep
"" to search patterns, \vv
"" to search and replace patterns, \vr
"" to change the search option, \vo
"let g:EasyGrepReplaceWindowMode=0  "replace in a new tab
"let g:EasyGrepEveryMatch=1         "global match
"let g:EasyGrepReplaceAllPerFile=1  "'y' for the whole file, not for the the whole search result


"===============================================================================
"=== plugin: gdb settings
"===============================================================================
"set previewheight=12
"run macros/gdb_mappings.vim
""set asm=0                         "don't show any assembly stuff"
""set gdbprg=/usr/bin/gdb


"===============================================================================
"=== plug-in: Taglist  (depend on ctags)
"===============================================================================
"let Tlist_Ctags_Cmd="/usr/bin/ctags"
"let Tlist_Inc_Winwidth = 0
"let Tlist_File_Fold_Auto_Close=1
""let Tlist_GainFocus_On_ToggleOpen = 1
"filetype on
"
""Hotkey definition for taglist
"noremap <F12> :Tlist
"noremap <F3> :wincmd p


"===============================================================================
"=== plug-in: cscope
"===============================================================================
"" find $WORKDIR/datapower -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.hpp" > $WORKDIR/datapower/cscope.files
"" cscope -Rbq
"" export CSCOPE_DB=$WORKDIR/datapower/cscope.out
""
""ctrl + shift + _, then press "s", to find the symbol under cursor (shortcut for cscope)
"nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
""ctrl + shift + _, then press "f", to open the file under cursor (shortcut for cscope)
"nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>


"===============================================================================
"=== plug-in: OmniCppComplete  (depend on ctags)
"===============================================================================
"" http://vim.wikia.com/wiki/C++_code_completion
"" http://design.liberta.co.za/articles/code-completion-intellisense-for-cpp-in-vim-with-omnicppcomplete/
""
"":help omnicppcomplete
""
""cd $WORKDIR/datapower/
""find $WORKDIR/datapower/ -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.hpp" > $WORKDIR/datapower/ctags.files
""ctags -n -f omnicppcomplete.tags --C++-types=+p --c++-kinds=+p --fields=+iaS --extra=+q * -L ctags.files
""
""enable the plugin (required)
"set nocp
"filetype plugin on
"set tags+=/userdata/p4/main/datapower/onmicppcomplete.tags
"
"" auto close options when exiting insert mode (conflicts with gdbvim)
"" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"set completeopt=menu,menuone
"
"" to invoke OmniCppComplete, <C-x><C-o>
"" OmniCppComplete
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_DisplayMode=1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
"let OmniCpp_MayCompleteScope = 1
"let OmniCpp_SelectFirstItem = 2
"let OmniCpp_ShowPrototypeInAbbr = 1


"===============================================================================
"=== plug-in: winmanager
"===          http://www.vim.org/scripts/script.php?script_id=1440
"===============================================================================
"let g:winManagerWindowLayout = "FileExplorer|TagList"
"nmap wm :WMToggle


"===============================================================================
"=== plug-in: minibuffer
"===============================================================================
"let g:miniBufExplMapCTabSwitchBufs = 1


"===============================================================================
"=== plug-in: trinity
"===============================================================================
"trinity.vim: Build the trinity of srcexpl,taglist, NERD_tree to be a good IDE
"nmap <F8> :TrinityToggleAll<CR>
"nmap <F9> :TrinityToggleSourceExplorer<CR>
"nmap <F10> :TrinityToggleTagList<CR>
"nmap <F11> :TrinityToggleNERDTree<CR>


"===============================================================================
"=== plug-in:
"===============================================================================
"echofunc.vim: Echo the function declaration in the command line for C/C++
"AutoClose.vim
"Surround.vim
