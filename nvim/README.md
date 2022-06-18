## My Neovim config

### link nvim directory

```bash
mkdir -p ~/.config
ln -s $PWD ~/.config/nvim
```

### install vim-plug

[vim-plug#unix-linux](https://github.com/junegunn/vim-plug#unix-linux )

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

