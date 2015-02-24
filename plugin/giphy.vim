" giphy.vim - Giphy in your vim

if exists('g:loaded_giphy') || &cp
  finish
endif
let g:loaded_giphy = 1

" Section: Utility

let s:commands = []
function! s:command(definition) abort
  let s:commands += [a:definition]
endfunction

function! s:define_commands() abort
  for command in s:commands
    execute 'command! -buffer '.command
  endfor
endfunction

augroup giphy_utility
  autocmd!
  autocmd User Giphy call s:define_commands()
augroup END

" Section: Initialization

function! giphy#init() abort
    doautocmd User Giphy
endfunction

augroup giphy
    autocmd!
    autocmd BufNewFile,BufReadPost * call giphy#init()
augroup END

" Section: Giphy API

let s:giphy_api_key = 'dc6zaTOxFJmzC' " public beta key
function! s:giphy_translate(query)
  let l:translate_endpoint = 'http://api.giphy.com/v1/gifs/translate?s=%s&api_key=%s'

  let res = webapi#http#get(printf(l:translate_endpoint, a:query, s:giphy_api_key))
  let obj = webapi#json#decode(res.content)

  return obj.data.images.fixed_width
endfunction

" Section: Commands

call s:command("-bar -nargs=1 Giphy :execute s:Giphy(<f-args>)")
function! s:Giphy(query) abort
    let l:ffmpeg_command = 'ffmpeg -v 0 -i "%s" -vcodec rawvideo -pix_fmt rgb24 -window_title "%s - Press q to exit" -f caca -'

    let image_info = s:giphy_translate(a:query)
    execute '!'.printf(l:ffmpeg_command, image_info.mp4, a:query)
endfunction

