FROM alpine:edge
LABEL maintainer="hendry@iki.fi"

ARG COMMIT=""
ENV COMMIT=${COMMIT}

RUN apk --no-cache add git bash vim go python3 # python needed for Utilsnips annoyingly!

ENV HOME /root
ENV GOPATH $HOME/go
ENV PATH $GOPATH/bin:$PATH

RUN git clone --depth 1 https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go && \
	git clone --depth 1 https://github.com/buoto/gotests-vim.git ~/.vim/pack/plugins/start/gotests-vim && \
	git clone --depth 1 https://github.com/kien/ctrlp.vim ~/.vim/pack/plugins/start/ctrlp.vim && \
	git clone --depth 1 https://github.com/SirVer/ultisnips ~/.vim/pack/plugins/start/ultisnips

RUN vim -esN +GoInstallBinaries +q

RUN go install github.com/go-delve/delve/cmd/dlv@latest && \
	go install github.com/cweill/gotests/...@latest

COPY vimrc $HOME/.vimrc
COPY bashrc $HOME/.bashrc

WORKDIR /src

ENTRYPOINT [ "vim" ]
