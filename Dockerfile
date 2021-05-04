FROM archlinux:latest

MAINTAINER Kai Hendry <hendry@iki.fi>

RUN useradd -m dev
RUN echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN sed -i "s/#Color/Color/" /etc/pacman.conf

RUN pacman -Syu --noconfirm \
	base-devel \
	git \
	sudo \
	vim \
	go \
	gopls \
	tar \
	tmux \
	bash \
	starship \
	nodejs npm

USER dev
ENV TERM alacritty

ENV GOCACHE /tmp
ENV HOME /home/dev
ENV GOPATH $HOME/go
ENV PATH $GOPATH/bin:$PATH

RUN git clone https://aur.archlinux.org/yay.git /tmp/yay \
	&& cd /tmp/yay \
	&& makepkg -sri --noconfirm \
	&& rm -rf /tmp/yay \
	&& yay -S --noconfirm direnv autojump

COPY --chown=dev:dev vimrc /home/dev/.vimrc
COPY --chown=dev:dev bashrc /home/dev/.bashrc
COPY --chown=dev:dev coc-settings.json /home/dev/.vim/

RUN git clone --depth 1 https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
RUN git clone --depth 1 https://github.com/buoto/gotests-vim.git ~/.vim/pack/plugins/start/gotests-vim
RUN git clone --depth 1 https://github.com/neoclide/coc.nvim.git ~/.vim/pack/plugins/start/coc.nvim
RUN git clone --depth 1 https://github.com/kien/ctrlp.vim ~/.vim/pack/plugins/start/ctrlp.vim

RUN go get github.com/go-delve/delve/cmd/dlv
RUN go get github.com/cweill/gotests/...

RUN vim -esN +GoInstallBinaries +q

RUN (echo | vim -c "CocInstall -sync coc-tsserver \
            coc-git \
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

ENTRYPOINT [ "tmux" ]
