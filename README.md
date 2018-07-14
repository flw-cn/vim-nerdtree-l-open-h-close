# vim-nerdtree-l-open-h-close

Let NERDTree works like VimFiler. That means:

* `l` key open directory node, and
* `h` key close directory node(even while the cursor is on the child node).

## Installation

To install this plugin just put the plugin files in your `~/.vim` (Linux/macOS)
or `~/vimfiles` (Windows).

### Vundle

```vim
Plugin 'flw-cn/vim-nerdtree-l-open-h-close'
```

### vim-plug

```vim
Plug 'flw-cn/vim-nerdtree-l-open-h-close'
```

## Change key bindings

By default, `l` is the shortcut key to open directory node and `h` to
close directory node.

If you want to change the key, please add following lines into your `vimrc`:

```vim
let g:NERDTreeMapOpenDirNode = 'L'
let g:NERDTreeMapCloseDirNode = 'H'
```
