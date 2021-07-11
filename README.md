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
	* \T Gotest
	* \t Go test in function
	* F12 Show definition
	* C-g Show functions / declarations
	* C-Bs Kill last word

## Debug

	F5 Start / Continue
	F8 Stop
	F9 Toggle breakpoint
	F10 Debug next line
	F11 Debug step into next function

* [UltiSnips snippets](https://github.com/fatih/vim-go/blob/master/gosnippets/UltiSnips/go.snippets) with Tab
