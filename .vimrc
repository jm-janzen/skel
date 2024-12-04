if stridx(getcwd(), '/writing') > -1
    let resp = input(
                \"It looks like you're trying to do some writing - 
                \activate writing_mode? [yN] ")
    if resp == 'y'
        let g:writing_mode=1

        echon "\nOK, you're in writing_mode now."
    endif
endif

source ~/.vimrc.dir/init/plugins.vim
source ~/.vimrc.dir/init/options.vim
source ~/.vimrc.dir/init/functions.vim
source ~/.vimrc.dir/init/mappings.vim
source ~/.vimrc.dir/init/autocommands.vim
