return {
  'mhinz/vim-startify',
  config = function()
    -- 키맵
    vim.keymap.set('n', '\\s', ':Startify<CR>', { silent = true })
    vim.keymap.set('n', '\\\\s', ':SSave<CR>', { silent = true })

    -- 전역 변수
    vim.g.startify_update_oldfiles = 1
    vim.g.startify_change_to_vcs_root = 1
    vim.g.startify_session_sort = 1
    vim.g.startify_session_persistence = 1
    vim.g.startify_fortune_use_unicode = 1
    vim.g.startify_commands = {
      ':help startify',
      '!ls -alh',
    }
    vim.g.startify_list_order = {
      { '    Sessions' },
      'sessions',
      { '    Most Recently Used files' },
      'files',
      'bookmarks',
      { '    Commands' },
      'commands',
    }

    -- fortune을 이용한 동적 헤더
    local fortune_cmd = 'fortune ~/Dropbox/my-fortune'
    local fortune_output = vim.fn.system(fortune_cmd)
    if vim.v.shell_error == 0 then -- 명령어가 성공했는지 확인
        local lines = vim.fn.split(fortune_output, '\n')
        local header = {}
        for _, line in ipairs(lines) do
          table.insert(header, "   " .. line)
        end
        vim.g.startify_custom_header = header
    else
        vim.g.startify_custom_header = { '   Could not load fortune.' }
    end

    -- 자동 명령
    vim.api.nvim_create_autocmd('User', {
      pattern = 'Startified',
      command = 'setlocal cursorline',
      once = false, -- autocmd가 매번 실행되도록 설정
    })
  end,
}
