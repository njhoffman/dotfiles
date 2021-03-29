" sudo write support
" https://github.com/neovim/neovim/issues/1716

Plug 'lambdalisue/suda.vim'
" :w suda://%


" Open a current file with sudo
" :e suda://%
" Save a current file with sudo
" :w suda://%
" Edit /etc/sudoers
" :e suda:///etc/sudoers
" Read /etc/sudoers (insert content under the cursor)
" :r suda:///etc/sudoers
" Read /etc/sudoers at the end
" :$r suda:///etc/sudoers
" Write contents to /etc/profile
" :w suda:///etc/profile
