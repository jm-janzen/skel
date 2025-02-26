if !exists('writing_mode') && stridx(getcwd(), '/writing') > -1
    let resp = confirm('activate writing_mode?', "&No (default)\n&Yes\n&Quit", 1)
    if resp == 3
        exit 0
    elseif resp == 2
        let g:writing_mode=1
    endif
endif

source ~/.vimrc.dir/init/plugins.vim
source ~/.vimrc.dir/init/options.vim
source ~/.vimrc.dir/init/functions.vim
source ~/.vimrc.dir/init/mappings.vim
source ~/.vimrc.dir/init/autocommands.vim
