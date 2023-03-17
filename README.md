# my dotfiles

## 기본 설정

```bash
cd ~
git clone git@github.com:johngrib/dotfiles.git
ln -s ~/dotfiles/.bash_profile
ln -s ~/dotfiles/.bashrc

 # zsh을 bash로
chsh -s /bin/bash
```

## NeoVim

```bash
cd ~/.config
ln -s ~/dotfiles/nvim

 # https://github.com/junegunn/vim-plug#unix
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip3 install --user neovim
```

## Karabiner-Elements

```bash
cd ~/.config
ln -s ~/dotfiles/karabiner
```

## ETC

```bash
cd ~

ln -s ~/dotfiles/.bcrc
ln -s ~/dotfiles/.ctags
ln -s ~/dotfiles/.ctags.d
ln -s ~/dotfiles/.ideavimrc
ln -s ~/dotfiles/.tridactylrc
```

