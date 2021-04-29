FROM golang:alpine
WORKDIR /projects

RUN apk add \
    build-base \
    git \
    curl \
    vim

RUN git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go;
RUN git clone https://github.com/buoto/gotests-vim.git ~/.vim/pack/plugins/start/gotests-vim

RUN vim -esN +GoInstallBinaries +q
RUN go get github.com/go-delve/delve/cmd/dlv
RUN go get golang.org/x/lint/golint
RUN go get -u github.com/cweill/gotests/...

COPY vimrc /root/.vimrc
