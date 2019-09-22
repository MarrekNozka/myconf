# Skeleton list

Vim skeletons; about as simple as they come. This is for of 
[Skeletor-vim](https://github.com/strange/skeletor-vim).
I added support for file extensions if `filetype` is not specified.


## Installation

To install with [vim-plug](https://github.com/junegunn/vim-plug):

```
Plug 'MarrekNozka/vim-skeletonlist'
```

or with [Vundle](https://github.com/VundleVim/Vundle.vim):

```
Plugin 'MarrekNozka/vim-skeletonlist'
```



### Manual Install

Copy `autoload/skeletor.vim` and `plugin/skeletor.vim` into corresponding
directories in your vim plugin directory.


## Usage

`:SkeletonList` brings up a list of all skeletons available for the filetype of
the currently loaded file.

Something like the following in your .vimrc might be nice:

    map <F4> :SkeletonList<CR>


### Skeletons

Skeletons are just regular files (or symlinks) located at a special location.
They can have any name and any extension. The name will be used to identify
the skeleton in the list displayed by `:Skeletor`; the extension will be
ignored (but is nice to have as you get syntax highlighting etc when you edit
skeletons).

Skeletons must be placed in directories matching vim's filetypes. These
directories must be placed in the directory `skeletons` in your
`runtimetpath`.

This is how you'd create a skeleton for a html form, for example:

1. Make sure that the directory `skeletons`, in your `runtimepath`, exists.
2. Create the directory `html` in the `skeletons`-directory. 
3. Write your form to a file called `form.html` in your `html`-directory.

So, on a standard unix installation you'd put your code into the file
`~/.vim/skeletons/html/form.html`.

