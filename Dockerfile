FROM archlinux:latest
LABEL maintainer="hendry@iki.fi"

RUN useradd -m dev
RUN echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN sed -i "s/#Color/Color/" /etc/pacman.conf

RUN pacman --cachedir /tmp -Syu --noconfirm \
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
	&& rm -rf /tmp/*

USER dev
ENV TERM alacritty

ENV HOME /home/dev
ENV GOPATH $HOME/go
ENV PATH $GOPATH/bin:$PATH

RUN git clone --depth 1 https://aur.archlinux.org/yay.git /tmp/yay \
	&& cd /tmp/yay \
	&& makepkg -sri --noconfirm \
	&& rm -rf /tmp/yay \
	&& yay --cachedir /tmp -S --noconfirm autojump && sudo rm -rf /tmp/*

RUN git clone --depth 1 https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
RUN git clone --depth 1 https://github.com/buoto/gotests-vim.git ~/.vim/pack/plugins/start/gotests-vim
RUN git clone --depth 1 https://github.com/kien/ctrlp.vim ~/.vim/pack/plugins/start/ctrlp.vim

RUN vim -esN +GoInstallBinaries +q

RUN go get github.com/go-delve/delve/cmd/dlv
RUN go get github.com/cweill/gotests/...

COPY --chown=dev:dev vimrc /home/dev/.vimrc
COPY --chown=dev:dev bashrc /home/dev/.bashrc

WORKDIR /projects

ENTRYPOINT [ "bash" ]
