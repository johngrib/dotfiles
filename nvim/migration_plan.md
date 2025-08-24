# Neovim 설정 Lua 및 lazy.nvim 마이그레이션 계획

이 문서는 기존 Vimscript 기반의 설정(`old-init.vim`)을 `lazy.nvim`을 사용하는 최신 Lua 기반 설정으로 이전하는 과정을 추적하고 관리하기 위해 작성되었습니다.

## 진행 상태

### 완료된 작업 ✔️

- **플러그인 매니저**: `lazy.nvim`을 새로운 플러그인 매니저로 설정했습니다 (`lazy-init.vim`, `init.lua`).
- **일반 옵션**: `set`으로 설정하던 모든 일반 옵션을 `lua/options.lua` 파일로 이전했습니다.
- **마이그레이션된 플러그인**:
  - `vim-airline/vim-airline`
  - `rcarriga/nvim-notify`
  - `simeji/winresizer`
  - `mhinz/vim-startify`
  - `johngrib/vimwiki`
  - `johngrib/grib-wiki`
  - `tpope/vim-surround`
  - `junegrib/fzf`
  - `junegrib/fzf.vim`
  - `nvim-lua/plenary.nvim`
  - `nvim-lua/popup.nvim`
  - `nvim-telescope/telescope.nvim`
  - `johngrib/vim-f-hangul`
  - `Olical/vim-enmasse`
  - `kshenoy/vim-signature`
  - `tpope/vim-repeat`
  - `tpope/vim-commentary`
  - `t9md/vim-choosewin`
  - `vim-scripts/matchit.zip`
  - `tpope/vim-speeddating`

---

## 전체 계획 (TODO) 📝

마이그레이션을 완료하기 위해 남은 작업 목록입니다. 각 항목을 단계별로 진행할 예정입니다.

### 1. 핵심 설정 이전

- [x] **키 매핑**: `old-init.vim`에 있는 모든 `map`, `nmap`, `vmap`, `imap` 명령어들을 `lua/keymaps.lua` 파일로 이전합니다.
- [x] **자동 명령 (Autocommands)**: `autocmd`와 `augroup` 블록을 `lua/autocmds.lua` 파일로 이전합니다.
- [x] **사용자 정의 함수**: `DecimalToBinary`와 같은 사용자 정의 Vimscript 함수들을 `lua/functions.lua` 파일로 이전합니다.
- [x] **사용자 정의 명령어**: `command!`로 정의된 사용자 정의 명령어들을 `lua/commands.lua` 파일로 이전합니다.
- [x] **축약어 (Abbreviations)**: `iabbr`로 정의된 축약어들을 이전합니다.

### 2. 나머지 플러그인 이전

- [ ] `old-init.vim`에 남아있는 모든 플러그인을 순차적으로 마이그레이션합니다. `config/` 디렉토리에 있는 설정을 각 플러그인에 맞는 `lua/plugins/*.lua` 파일로 변환하는 작업을 포함합니다.
  - *다음 마이그레이션 대상 플러그인 (예시):*
    - `tpope/vim-surround`
    - `neoclide/coc.nvim` 및 관련 확장
    - `junegunn/fzf.vim`
    - `nvim-telescope/telescope.nvim`
    - `luochen1990/rainbow` (현재 보류 중 - 초기화 문제)
    - 기타 등등

### 3. 최종 정리

- [ ] 모든 설정과 플러그인이 새로운 Lua 설정 환경에서 올바르게 동작하는 것을 최종 확인한 후, 충돌과 혼란을 방지하기 위해 기존의 설정 파일들을 삭제합니다.
  - [ ] `old-init.vim` 삭제
  - [ ] `config/` 디렉토리 삭제
  - [ ] `vim-include/` 디렉토리 삭제
