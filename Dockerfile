# https://github.com/marcoguerri/vim-env/blob/master/Dockerfile
FROM golang:alpine
WORKDIR /projects

RUN apk add \
    build-base \
    git \
    curl \
    nodejs-current \
    npm \
    vim

ENV TERM alacritty

RUN git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
RUN git clone https://github.com/buoto/gotests-vim.git ~/.vim/pack/plugins/start/gotests-vim
RUN git clone https://github.com/neoclide/coc.nvim.git ~/.vim/pack/plugins/start/coc.nvim

RUN go get github.com/go-delve/delve/cmd/dlv
RUN go get golang.org/x/lint/golint
RUN go get -u github.com/cweill/gotests/...

RUN vim -esN +GoInstallBinaries +q

RUN (echo | vim -c "CocInstall -sync coc-tsserver \
            coc-git \
            coc-bookmark \
            coc-snippets \
            coc-highlight \
            coc-json \
            coc-lists \
            coc-markdownlint \
            coc-tabnine \
            coc-tasks \
            coc-todolist \
            coc-yank \
            coc-pairs \
            coc-svg \
            coc-yaml \
            coc-spell-checker \
            coc-go \
            coc-sh \
            coc-prettier|q" > /dev/null && \
            echo 0 ) || true

COPY vimrc /root/.vimrc
