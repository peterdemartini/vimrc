# The Awesome vimrc

## How to install?
```bash
git clone https://github.com/peterdemartini/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install.sh
```

## How to update?
```bash
~/.vim_runtime/update.sh
```

I also recommend using [Source Code Pro font from Adobe](http://store1.adobe.com/cfusion/store/html/index.cfm?event=displayFontPackage&code=1960) (it's free and awesome font for writing and programming). The Awesome vimrc is already setup to try to use it

## For Ag to work, install the_silver_searcher:

```bash
brew install the_silver_searcher
```

## Key Mappings

### Plugin related mappings

Open [bufexplorer](https://github.com/vim-scripts/bufexplorer.zip) and see and manage the current buffers (`<leader>o`):
    
```vimrc
map <leader>o :BufExplorer<cr>
```

Open [MRU.vim](https://github.com/vim-scripts/mru.vim) and see the recently open files (`<leader>f`):

```vimrc
map <leader>f :MRU<CR>
```

Open [ctrlp.vim](https://github.com/kien/ctrlp.vim) plugin (`<leader>j` or `<ctrl>f`):
  
```vimrc
let g:ctrlp_map = '<c-f>'
```

Managing the [NERD Tree](https://github.com/scrooloose/nerdtree) plugin:

```vimrc
 map <leader>nn :NERDTreeToggle<cr>
 map <leader>nb :NERDTreeFromBookmark 
 map <leader>nf :NERDTreeCWD <bar> :NERDTreeFind<cr>
```

[goyo.vim](https://github.com/junegunn/goyo.vim) and [vim-zenroom2](https://github.com/amix/vim-zenroom2) lets you only focus on one thing at a time. It removes all the distractions and centers the content. It has a special look when editing Markdown, reStructuredText and textfiles. It only has one mapping. (`<leader>z`)

```vimrc
map <leader>z :Goyo<cr>
```

### Normal mode mappings

Fast saving of a buffer (`<leader>w`):

```vimrc
nmap <leader>w :w!<cr>
```

### Cancel selection

```vimrc
map <silent> <leader><cr> :noh<cr>
```

### Search Project

`<leader>g`

### Align Selection

`<leader>a`

# Run Test (node)

```vimrc
nmap <silent> <leader>rt :Test<CR>
```

Closing of current buffer(s) (`<leader>bd` and (`<leader>ba`)):

```vimrc
" Close current buffer
map <leader>bd :Bclose<cr>

" Close all buffers
map <leader>ba :1,1000 bd!<cr>
```
	
Useful mappings for managing tabs:

```vimrc
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
```
	
Switch CWD to the directory of the open buffer:

```vimrc
map <leader>cd :cd %:p:h<cr>:pwd<cr>
```
	
Open vimgrep and put the cursor in the right position:

```vimrc
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
```

Vimgreps in the current file:

```vimrc
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>
```

Remove the Windows ^M - when the encodings gets messed up:

```vimrc
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
```
	
Quickly open a buffer for scripbble:

```vimrc
map <leader>q :e ~/buffer<cr>
```

Toggle paste mode on and off:

```vimrc
map <leader>pp :setlocal paste!<cr>
```

Insert the current date and time (useful for timestamps):

```vimrc
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
```


### Visual mode mappings

Visual mode pressing `*` or `#` searches for the current selection:

```vimrc
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
```

When you press gv you vimgrep after the selected text:

```vimrc
vnoremap <silent> gv :call VisualSelection('gv')<CR>
```

When you press `<leader>r` you can search and replace the selected text:

```vimrc
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
```

### Command line mappings

$q is super useful when browsing on the command line. It deletes everything until the last slash:

```vimrc
cno $q <C-\>eDeleteTillSlash()<cr>
```

Bash like keys for the command line:

```vimrc
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
```

Write the file as sudo (only on Unix). Super useful when you open a file and you don't have permissions to save your changes. [Vim tip](http://vim.wikia.com/wiki/Su-write):

```
:W 
```

### Spell checking
Pressing `<leader>ss` will toggle and untoggle spell checking

```vimrc
map <leader>ss :setlocal spell!<cr>
```

Shortcuts using `<leader>` instead of special chars

```vimrc
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
```

### Cope	
Do :help cope if you are unsure what cope is. It's super useful!

When you search with vimgrep, display your results in cope by doing:
`<leader>cc`

To go to the next search result do:
`<leader>n`

To go to the previous search results do:
`<leader>p`

Vimscript mappings:

```vimrc
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>
```

## How to uninstall
Do following:

* Remove `~/.vim_runtime`
* Remove any lines that refernce `.vim_runtime` in your `~/.vimrc`

