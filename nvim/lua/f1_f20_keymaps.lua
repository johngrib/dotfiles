return {
  -- This is not a plugin, but a collection of keymaps and functions.
  -- We source the original Vimscript file for now due to its complexity.
  -- (이것은 플러그인이 아니라 키맵과 함수의 모음입니다.
  -- 복잡성으로 인해 현재는 원본 Vimscript 파일을 소스합니다.)
  setup = function()
    local config_root = vim.fn.stdpath('config')
    local f1_f20_config_path = config_root .. '/config/set-f1-f20.vim'
    vim.cmd('source ' .. f1_f20_config_path)
  end,
}
