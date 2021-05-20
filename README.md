dotfiles
========

personal configurations for different tools (vim, tmux, etc), scripts.

.vimrc configuration and plugins.

Installation

$ cd ~

$ git clone https://github.com/rajesh-varatharajan/dotfiles.git

$ git clone https://github.com/powerline/fonts.git /tmp/fonts

$ (cd /tmp/fonts; ./install.sh)

$ mkdir ~/.vim_backup

$ echo "source ~/.vim/vimrc" > ~/.vimrc

$ vim +PluginInstall +qall

$ cat <> ~/.gtkrc-2.0 style "vimfix" { bg[NORMAL] = "#0c1014" } widget "vim-main-window.*GtkForm" style "vimfix" EOF

In Linux, configure your Terminal Emulator to use the font "DejaVu Sans Mono for Powerline, 11".
In OSX, configure iTerm to use "Source Code Pro for Powerline, 12" for non-ASCII Font.

Install Plugins

Launch vim and run :PluginInstall
