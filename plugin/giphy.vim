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
    autocmd BufEnter,BufReadPost * call giphy#init()
augroup END

" Section: Giphy API

let s:giphy_api_key = 'dc6zaTOxFJmzC' " public beta key
function! s:giphy_translate(query)
  let l:translate_endpoint = 'http://api.giphy.com/v1/gifs/translate?s=%s&api_key=%s'

  let q = webapi#http#encodeURIComponent(a:query)
  let res = webapi#http#get(printf(l:translate_endpoint, q, s:giphy_api_key))
  let obj = webapi#json#decode(res.content)

  " Get 200px fixed width for small file size; We're rendering to terminal so quality isn't an issue.
  return obj.data.images.fixed_width
endfunction

" Section: Commands

call s:command("-bar -nargs=1 Giphy :execute s:Giphy(<f-args>)")
function! s:Giphy(query) abort
    let l:ffmpeg_cmd = 'CONCAT_FILE=`mktemp /tmp/giphy_loop.XXXXXXX` &&
                      \ for i in {1..100}; do echo "file ''%s''" >> $CONCAT_FILE; done &&
                      \ ffmpeg -protocol_whitelist file,tcp,http
                          \ -v error -safe 0 -f concat -i $CONCAT_FILE
                          \ -vcodec rawvideo -pix_fmt rgb24
                          \ -window_title "%s - Press q to exit" -f caca - &&
                      \ rm $CONCAT_FILE'

    let image_info = s:giphy_translate(a:query)
    execute '!'.printf(l:ffmpeg_cmd, image_info.mp4, a:query)
endfunction

