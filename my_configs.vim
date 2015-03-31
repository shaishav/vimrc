set nu
set nowrap
imap jj <Esc>

" Open NERDTree Shortcut
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
let NERDChristmasTree=1

" Auto change directory to working file path
set autochdir
" change background color after 80
" execute "set colorcolumn=" . join(range(81,335), ',')
highlight ColorColumn ctermbg=235 guibg=#2c2d27
set colorcolumn=80
set listchars=trail:·
" show tabs as spaces
set listchars=tab:\ \ 
set list
" enable this to enable syntastic
" set shell=bash

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

function! CloseHiddenBuffers()
  " figure out which buffers are visible in any tab
  let visible = {}
  for t in range(1, tabpagenr('$'))
    for b in tabpagebuflist(t)
      let visible[b] = 1
    endfor
  endfor
  " close any buffer that's loaded and not visible
  for b in range(1, bufnr('$'))
    if bufloaded(b) && !has_key(visible, b)
      exe 'bd ' . b
    endif
  endfor
endfun
