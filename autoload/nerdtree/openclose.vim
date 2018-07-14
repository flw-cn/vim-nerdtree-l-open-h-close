function! nerdtree#openclose#openDirNode(dirnode)
    if a:dirnode.isOpen ==# 0
        if g:NERDTreeCascadeOpenSingleChildDir == 0
            call a:dirnode.open()
        else
            call a:dirnode.openAlong()
        endif
        call a:dirnode.getNerdtree().render()
        call a:dirnode.putCursorHere(0, 0)
    endif
endfunction

function! nerdtree#openclose#closeDirNode(dirnode)
    if a:dirnode.isOpen ==# 1
        call a:dirnode.close()
        call a:dirnode.getNerdtree().render()
        call a:dirnode.putCursorHere(0, 0)
    else
        call nerdtree#openclose#closeCurrentDir(a:dirnode)
    endif
endfunction

function! nerdtree#openclose#closeCurrentDir(node)
    if a:node.isRoot()
        call nerdtree#echo('cannot close parent of tree root')
        return
    endif

    let l:parent = a:node.parent

    while l:parent.isCascadable()
        let l:parent = l:parent.parent
    endwhile

    if l:parent.isRoot()
        call nerdtree#echo('cannot close tree root')
        return
    endif

    call l:parent.close()
    call l:parent.getNerdtree().render()
    call l:parent.putCursorHere(0, 0)
endfunction
