# https://hub.docker.com/_/ubuntu
FROM ubuntu:23.10

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV TZ=Asia/Seoul

# 포트 번호 연결
EXPOSE 3000 3001 4000 4001 8080 8081 8082 8083 8084 8085

RUN apt-get update
RUN apt-get -y install curl fzf silversearcher-ag tree git xclip python3 nodejs npm zip unzip ruby-full lua5.4
RUN apt-get -y install python3-pip
RUN pip3 install pynvim --break-system-packages
RUN apt install -y python3-neovim

# vim-plug.
RUN curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# neovim config
RUN mkdir -p /root/.config/nvim
COPY /nvim /root/.config/nvim/

# build neovim - https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites
RUN apt-get -y install ninja-build gettext cmake
RUN git clone https://github.com/neovim/neovim --depth 1
RUN cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && make install
RUN nvim --headless +PlugInstall +qall

# coc.nvim
# RUN mkdir -p /root/.config/coc/extensions
# ARG COC='coc-tsserver coc-yaml coc-kotlin'
# RUN cd /root/.config/coc/extensions && npm install $COC --global --only=prod

RUN apt install universal-ctags
RUN apt install -y exa

RUN mkdir -p /root/workspace

RUN rm /root/.bashrc
RUN ln -s /root/dotfiles/.bashrc /root/.bashrc
RUN ln -s /root/dotfiles/.bash_profile /root/.bash_profile
RUN ln -s /root/dotfiles/.gitconfig /root/.gitconfig
RUN ln -s /root/dotfiles/.ctags.d /root/.ctags.d

# default location after container startup.
WORKDIR /root

# Avoid container exit.
CMD ["tail", "-f", "/dev/null"]

