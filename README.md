vim with:

* vim-go for a Golang IDE
* dlv for debugging
* gotests for generating tests

Still surprisingly weighs in at 2.19GB 😳

# How to use

	1. curl -o goide.mk https://raw.githubusercontent.com/kaihendry/goide/main/Makefile
	2. make -f goide.mk run

# Keyboard shortcuts

* \r Run current buffer
* F12 Show definition
* C-g Show functions / declarations
* \T Gotest
* \t Go test in function
* C-Bs Kill last word

## Debug

* <kbd>F5</kbd> Start / Continue
* <kbd>F8</kbd> Stop
* <kbd>F9</kbd> Toggle breakpoint
* <kbd>F10</kbd> Debug next line
* <kbd>F11</kbd> Debug step into next function
* [UltiSnips snippets](https://github.com/fatih/vim-go/blob/master/gosnippets/UltiSnips/go.snippets) with <kbd>Tab</kbd>
