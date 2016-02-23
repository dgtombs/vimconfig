# vimconfig

This is my personal Vim configuration. There is nothing special about it; it's
just how I like things.

This repository is organized as a vim plugin, ideally installed using
[pathogen.vim](https://github.com/tpope/vim-pathogen) like so:

    cd ~/.vim/bundle
    git clone https://github.com/dgtombs/vimconfig.git dtvim

After executing those commands, all new vim instances will pick up these
settings.

## vimrc

To load these settings (and others) using Pathogen, I typically just have a vimrc like this:

    " dtombs, 23-Sep-2015. Activate pathogen. Even my own settings are in a
    " pathogen bundle so this is all we need.
    call pathogen#infect()
