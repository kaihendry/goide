FROM archlinux
LABEL maintainer="hendry@iki.fi"

RUN useradd -m dev
RUN echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN sed -i "s/#Color/Color/" /etc/pacman.conf

RUN pacman --cachedir /tmp -Syu --noconfirm \
	base-devel \
	bash \
	git \
	go \
	gopls \
	python \
	starship \
	sudo \
	tar \
	tmux \
	vim \
	&& rm -rf /tmp/*

# python annoyingly required for UltiSnips

USER dev

ENV HOME /home/dev
ENV GOPATH $HOME/go
ENV PATH $GOPATH/bin:$PATH

RUN git clone --depth 1 https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
RUN git clone --depth 1 https://github.com/buoto/gotests-vim.git ~/.vim/pack/plugins/start/gotests-vim
RUN git clone --depth 1 https://github.com/kien/ctrlp.vim ~/.vim/pack/plugins/start/ctrlp.vim
RUN git clone --depth 1 https://github.com/SirVer/ultisnips ~/.vim/pack/plugins/start/ultisnips

RUN vim -esN +GoInstallBinaries +q

RUN go install github.com/go-delve/delve/cmd/dlv@latest
RUN go install github.com/cweill/gotests/...@latest

COPY --chown=dev:dev vimrc /home/dev/.vimrc
COPY --chown=dev:dev bashrc /home/dev/.bashrc

WORKDIR /src

ENTRYPOINT [ "bash" ]
