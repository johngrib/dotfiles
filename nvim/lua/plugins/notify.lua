-- 테스트 명령 -> :lua _G.noti_custom_text("lazy.nvim으로 보낸 알림!")
return {
  'rcarriga/nvim-notify',
  config = function()
    -- Set up the notify function
    vim.notify = require('notify')

    -- Define the custom notification function globally
    _G.noti_custom_text = function(text)
      vim.notify(text, vim.log.levels.INFO, {
        stages = 'slide',
        render = 'minimal',
      })
    end

    -- Define the Vimscript wrapper function
    vim.cmd([[
      function! Noti_pipe(param, text)
          call v:lua.noti_custom_text(a:text)
          return a:param
      endfunction
    ]])
  end,
}
