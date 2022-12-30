## My Neovim config

- ./init.vim - 메인 설정
- ./init-gitcommit.vim - git commit 메시지 편집 전용 설정
- ./init-no-plugin.vim - 플러그인 없는 버전의 설정

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

