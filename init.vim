"stuff the help docs told me to do
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let $MYVIMRC="~/.config/nvim/vimrc" "by default, MYVIMRC is this file, but most edits will be done in the main vimrc file
source ~/.config/nvim/vimrc
