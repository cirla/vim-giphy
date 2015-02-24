# giphy.vim

Giphy in your vim.

## 1. Dependencies

* \*nix(-like) OS (for `mktemp`, etc.)
* [webapi-vim](https://github.com/mattn/webapi-vim)
* [ffmpeg](https://www.ffmpeg.org/) configured with `--with-libcaca`

## 2. Demo

![Demo](https://raw.githubusercontent.com/cirla/vim-giphy/master/demo.gif)

## 3. Installation
### 3.1 Install Prerequisites
#### 3.1.1 [ffmpeg](https://www.ffmpeg.org/)
##### OS X
1. Run `brew install ffmpeg --with-libcaca`

#### 3.1.2 [webapi-vim](https://github.com/mattn/webapi-vim)
##### Vundle
1. Add `Plugin 'mattn/webapi-vim'` to your `.vimrc` and run `+PluginInstall`.

### 3.2 Install giphy.vim
#### Vundle
1. Add `Plugin 'cirla/vim-giphy'` to your `.vimrc` and run `+PluginInstall`.
2. If you have recieved a private Giphy API key, you can replace the public beta key in `s:giphy_api_key`.

## 4. License and Attribution

This software is distributed under the [MIT License](https://raw.githubusercontent.com/cirla/vim-giphy/master/LICENSE).

![Powered by Giphy](https://raw.githubusercontent.com/cirla/vim-giphy/master/powered_by_giphy.gif)

