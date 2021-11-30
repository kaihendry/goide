FROM alpine:edge
LABEL maintainer="hendry@iki.fi"

ARG COMMIT=""
ENV COMMIT=${COMMIT}

RUN apk --no-cache add git curl bash vim go

ENV HOME /root
ENV GOPATH $HOME/go
ENV PATH $GOPATH/bin:$PATH

WORKDIR $HOME/.vim/pack/plugins/start

RUN git clone --depth 1 https://github.com/fatih/vim-go.git && \
	git clone --depth 1 https://github.com/buoto/gotests-vim.git && \
	git clone --depth 1 https://github.com/kien/ctrlp.vim && \
	git clone --depth 1 https://github.com/Jorengarenar/miniSnip.git

RUN vim -esN +GoInstallBinaries +q

RUN go install github.com/go-delve/delve/cmd/dlv@latest && \
	go install github.com/cweill/gotests/...@latest

COPY vimrc /root/.vimrc
COPY bashrc /root/.bashrc

WORKDIR /src

ENTRYPOINT [ "vim" ]
