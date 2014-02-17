" https://github.com/skwp/dotfiles/blob/master/vimrc for more
" https://github.com/wizzat/dotfiles/blob/master/vimrc Mark Roberts Config
" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set mouse=a                     " Use the mouse in hte terminal 


" This makes vim act like all other editors, buffers can exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" ================ Indentation ======================

set autoindent
set ts=8 
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=2
set expandtab
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Syntax ===========================

syntax on
colorscheme desert
com! E edit               " Typo support
com! W write              " Typo support

" ================ Python  ===========================

let g:pyindent_open_paren        = '&sw'
let g:pyindent_nested_paren      = '&sw'
let g:pyindent_continue          = '&sw'
let python_space_error_highlight = 1


 " ================ Macro  ===========================
"deletes trailing whitespace 
map ,wt :perldo s/\s+$//g<CR>:perldo s/\t/    /g<CR>

" Aligns on equal signs (useful for making pep8 mad at you)
map ,a= :Align! =W =\+<CR>
"map ,a=f :Align! =W [><=~+-]\+<CR>

"Aligns on colons (useful for dictionaries)
map ,a: :Align! =W [:]\+<CR>


 " ================ Vundle  ===========================

 " Setting up Vundle - the vim plugin bundler.  Auto installs itself!
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
"Add your bundles here

Bundle 'bufexplorer.zip'
Bundle 'Align'
Bundle 'Solarized'
"Bundle 'scrooloose/syntastic'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/VisIncr'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-fugitive'
Bundle 'godlygeek/tabular'

"...All your other bundles...
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end
