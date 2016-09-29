# giphy.vim

Giphy in your vim.

## 1. Dependencies

* \*nix(-like) OS (for `mktemp`, etc.)
* [webapi-vim](https://github.com/mattn/webapi-vim)
* [ffmpeg](https://www.ffmpeg.org/) configured with `--enable-libcaca`

## 2. Demo

![Demo](https://raw.githubusercontent.com/cirla/vim-giphy/master/demo.gif)

## 3. Installation
### 3.1 Install Prerequisites
#### 3.1.1 [ffmpeg](https://www.ffmpeg.org/)
##### OS X
1. Run `brew install ffmpeg --with-libcaca`

#### 3.1.2 [webapi-vim](https://github.com/mattn/webapi-vim)
##### Plug/Vundle
1. Add `Plug 'mattn/webapi-vim'` (or `Plugin` for Vundle) to your `.vimrc` and run `+PlugInstall`/`+PluginInstall`.

##### Pathogen
1. `cd ~/.vim/bundle && git clone git@github.com:mattn/webapi-vim.git`

### 3.2 Install giphy.vim
#### Plug/Vundle/Pathogen
1. Similar to installation of webapi-vim above, just replace repo name with 'cirla/vim-giphy'.
2. If you have recieved a private Giphy API key, you can replace the public beta key in `s:giphy_api_key`.
3. If you use a non-POSIX shell (e.g. [fish](https://fishshell.com/)), you'll have to edit [the ffmpeg
   command](https://github.com/cirla/vim-giphy/blob/master/plugin/giphy.vim#L55-L61) or add `set shell=/bin/bash` in
   your `.vimrc`.

## 4. License and Attribution

This software is distributed under the [MIT License](https://raw.githubusercontent.com/cirla/vim-giphy/master/LICENSE).

![Powered by Giphy](https://raw.githubusercontent.com/cirla/vim-giphy/master/powered_by_giphy.gif)

