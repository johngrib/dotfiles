-- commands.lua

-- HTML 변환
vim.api.nvim_create_user_command("ToHtml", function()
  vim.cmd("source $VIMRUNTIME/syntax/2html.vim")
end, {}) 

-- 파일 이름/경로 클립보드 복사 (OS 조건부)
if vim.fn.has('win32') == 1 then
  vim.api.nvim_create_user_command("GetFileName", function()
    vim.fn.setreg('*', vim.fn.substitute(vim.fn.expand('%'), '/', '\\\\', 'g'))
  end, {}) 
  vim.api.nvim_create_user_command("GetFileAddress", function()
    vim.fn.setreg('*', vim.fn.substitute(vim.fn.expand('%:p'), '/', '\\\\', 'g'))
  end, {}) 
else
  vim.api.nvim_create_user_command("GetFileName", function()
    vim.fn.setreg('*', vim.fn.substitute(vim.fn.expand('%'), '/', '\\', 'g'))
  end, {}) 
  vim.api.nvim_create_user_command("GetFileAddress", function()
    vim.fn.setreg('*', vim.fn.substitute(vim.fn.expand('%:p'), '/', '\\', 'g'))
  end, {}) 
end

-- 현재 파일 디렉토리로 이동
vim.api.nvim_create_user_command("Ncd", function()
  vim.cmd("cd %:p:h")
end, {}) 

