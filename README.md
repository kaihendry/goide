vim with:

* [vim-go](https://github.com/fatih/vim-go) for a Golang IDE
* [dlv](https://github.com/go-delve/delve) for debugging
* :GoTests for generating tests


Still surprisingly weighs in at 2.19GB 😳

# Try it!

	alias ge='f(){ docker run -it --rm -v $(pwd):/src hendry/goide; unset -f f; }; f'

# Keyboard shortcuts

<kbd>\\</kbd> is called the "leader" key in vim.

* <kbd>\r</kbd> Run current buffer
* <kbd>F12</kbd> Show definition, <kbd>C-o</kbd> to switch back
* <kbd>C-x</kbd> <kbd>C-o</kbd> Autocomplete with gopls
* <kbd>C-g</kbd> Show functions / declarations
* <kbd>\t</kbd> Go test, <kbd>\ga</kbd> switch between test and code
* <kbd>C-Bs</kbd> Kill last word
* <kbd>K</kbd> Show documentation

## Debug

* <kbd>F5</kbd> Start / Continue
* <kbd>F8</kbd> Stop
* <kbd>F9</kbd> Toggle breakpoint
* <kbd>F10</kbd> Debug next line
* <kbd>F11</kbd> Debug step into next function
* [UltiSnips snippets](https://github.com/fatih/vim-go/blob/master/gosnippets/UltiSnips/go.snippets) with <kbd>Tab</kbd>

## Super handy commands

* :GoFillStruct
* :GoRename
* :GoAddTags
* :GoPlay

Do read https://github.com/fatih/vim-go-tutorial

# Compared to VS code

Following https://www.youtube.com/watch?v=1MXIGYrMk80 with
https://golang.org/doc/code, this project has a couple of advantages:

* Docker image streamlines setup. No hoop jumping to install the entire environment assuming you have Docker and `make` installed
* Efficient vim key bindings, use `vimtutor` to learn how to edit with it
* Can be used easily upon remote environments, a **terminal environment** is _all you need_
* `:Gotests` makes it easier to generate tests

# Elsewhere

* https://tpaschalis.github.io/vim-go-setup/
