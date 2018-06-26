# vimconfig

This is my personal Vim configuration. There is nothing special about it; it's
just how I like things.

This repository is organized as a vim plugin which can be added to a Vim package (as of
Vim 8) like so:

    mkdir -p ~/.vim/pack/dtplugins/start
    cd ~/.vim/pack/dtplugins/start
    git clone https://github.com/dgtombs/vimconfig.git dtvim

([pathogen.vim](https://github.com/tpope/vim-pathogen) can help on versions of Vim before
8.)

After executing those commands, Vim will automatically load this plugin. Note that the
main preferences are _not_ automatically loaded as a plugin because they would then
override any preferences in the vimrc. To load these preferences, you can add the
following line somewhere near the top of your vimrc:

    source ~/vimfiles/pack/dtplugins/start/dtvim/dtvim.vim
