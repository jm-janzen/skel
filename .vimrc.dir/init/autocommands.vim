"""
""" source per language settings, macros
"""

" load filetype generic macros, settings
source ${HOME}/.vimrc.dir/lang_configs/macros_all.vim

" load filetype specific macros, settings
" syntax `function!' silently replaces the function,
" which is useful when using `source ${HOME}/.vimrc'.
au BufNewFile,BufRead,FileType *.js* call Javascript_conf()
    function! Javascript_conf()
        source ${HOME}/.vimrc.dir/lang_configs/macros_javascript.vim
    endfunction
au BufNewFile,BufRead,FileType *.jsx call ReactJSX_conf()
    function! ReactJSX_conf()
        source ${HOME}/.vimrc.dir/lang_configs/macros_reactjsx.vim
    endfunction
autocmd BufNewFile,BufRead,FileType c[pp]* call Cpp_conf()
    function! Cpp_conf()
        source ${HOME}/.vimrc.dir/lang_configs/macros_cpp.vim
    endfunction
autocmd BufNewFile,BufRead,FileType *.sh call Bash_conf()
    function! Bash_conf()
        source ${HOME}/.vimrc.dir/lang_configs/macros_bash.vim
    endfunction
autocmd BufNewFile,BufRead,FileType *.go call Go_conf()
    function! Go_conf()
        set syn=go
        source ${HOME}/.vimrc.dir/lang_configs/go/settings_go.vim
    endfunction
autocmd BufNewFile,BufRead,FileType *.rb call Ruby_conf()
    function! Ruby_conf()
        set syn=ruby
        source ${HOME}/.vimrc.dir/lang_configs/ruby/settings_ruby.vim
    endfunction
autocmd BufNewFile,BufRead,FileType *.yml call Yaml_conf()
    function! Yaml_conf()
        set syn=yaml
        source ${HOME}/.vimrc.dir/lang_configs/yaml/settings_yaml.vim
    endfunction
autocmd BufNewFile,BufRead,FileType kitty_scrollback call Kitty_conf()
    function! Kitty_conf()
        set syn=shell
        source ${HOME}/.vimrc.dir/ftplugin/kitty_scrollback.vim
    endfunction

" syntax highlighting like HTML for EJS files
au BufNewFile,BufRead *.ejs set filetype=html

