[GOLD](http://goldparser.org/) grammar support for Vim
======================================================

This is a refactored and slightly-improved repackaging of the GOLD Parsing system's
old [Vim extension](http://goldparser.org/builder/files/grm.vim), which hasn't been
updated since 2002. The GOLD project itself appears to be abandoned, with no GitHub
presence I know of.


Installation
------------

### Using the built-in package manager (Vim 8+)

~~~console
$ mkdir -p ~/.vim/pack
$ cd ~/.vim/pack
$ git clone https://github.com/Alhadis/vim-grm.git
~~~

### Using a third-party package manager

> _Caveat lector_ — I've not tested any of these. YMMV.

#### [Dein](https://github.com/Shougo/dein.vim)

~~~viml
" ~/.vimrc
set nocompatible
call dein#add('Alhadis/vim-grm')
~~~

#### [NeoBundle](https://github.com/Shougo/neobundle.vim)

~~~viml
" ~/.vimrc
NeoBundle 'Alhadis/vim-grm'
~~~

#### [Pathogen](https://github.com/tpope/vim-pathogen)
Run the following in your terminal:

~~~console
$ mkdir -p ~/.vim/bundle
$ cd ~/.vim/bundle
$ git clone https://github.com/Alhadis/vim-grm.git
~~~

You may need to restart Vim before the package can work properly.

#### [VimPlug](https://github.com/junegunn/vim-plug)

~~~viml
" ~/.vimrc
Plug 'Alhadis/vim-grm'
~~~

#### [Vundle](https://github.com/VundleVim/Vundle.vim)

~~~viml
" ~/.vimrc
Plugin 'Alhadis/vim-grm'
~~~


Background
----------

I only learned of GOLD's grammar format through [`bottlecaps.de/convert`][2], which
supports `*.grm` files as input. Admittedly, my interest in GOLD extends no further
than syntax highlighting.

I only cleaned this file up because I wanted to compare Vim's highlighting with the
unfinished TextMate grammar I started work on for [`Alhadis/language-grammars`][3].
I've nonetheless endeavoured to do The Right Thing™ and flesh everything out like a
proper Vim package, if just to sate a completionist itch.

[2]: https://www.bottlecaps.de/convert/
[3]: https://github.com/Alhadis/language-grammars
