function! s:SID()
    if !exists("s:sid")
        let s:sid = matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze_SID$')
    endif
    return s:sid
endfun

function! s:initVariable(var, value)
    if !exists(a:var)
        exec 'let ' . a:var . ' = ' . "'" . substitute(a:value, "'", "''", "g") . "'"
        return 1
    endif
    return 0
endfunction

function! s:setup()
    let s = '<SNR>' . s:SID() . '_'

    call NERDTreeAddKeyMap({
        \'key': g:NERDTreeMapOpenDirNode,
        \'scope': 'DirNode',
        \'callback': 'nerdtree#openclose#openDirNode',
        \'quickhelpText': 'open current dir node',
    \})
      
    call NERDTreeAddKeyMap({
        \'key': g:NERDTreeMapCloseDirNode,
        \'scope': 'DirNode',
        \'callback': 'nerdtree#openclose#closeDirNode',
        \'quickhelpText': 'close current dir node',
    \})

    call NERDTreeAddKeyMap({
        \'key': g:NERDTreeMapCloseDirNode,
        \'scope': "Node",
        \'callback': "nerdtree#openclose#closeCurrentDir",
    \})
endfunction

call s:initVariable("g:NERDTreeMapOpenDirNode", "l")
call s:initVariable("g:NERDTreeMapCloseDirNode", "h")

autocmd VimEnter * call s:setup()
