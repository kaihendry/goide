vim with:

* [vim-go](https://github.com/fatih/vim-go) for a Golang IDE
* [dlv](https://github.com/go-delve/delve) for debugging
* :GoTests for generating tests

Still surprisingly weighs in at 2.19GB 😳

# How to use

	1. curl -o goide.mk https://raw.githubusercontent.com/kaihendry/goide/main/Makefile
	2. make -f goide.mk run

# Keyboard shortcuts

* <kbd>\r</kbd> Run current buffer
* <kbd>F12</kbd> Show definition, <kbd>C-o</kbd> to switch back
* <kbd>C-g</kbd> Show functions / declarations
* <kbd>\t</kbd> Go test, <kbd>\ga</kbd> swich back to code
* <kbd>C-Bs</kbd> Kill last word

## Debug

* <kbd>F5</kbd> Start / Continue
* <kbd>F8</kbd> Stop
* <kbd>F9</kbd> Toggle breakpoint
* <kbd>F10</kbd> Debug next line
* <kbd>F11</kbd> Debug step into next function
* [UltiSnips snippets](https://github.com/fatih/vim-go/blob/master/gosnippets/UltiSnips/go.snippets) with <kbd>Tab</kbd>
