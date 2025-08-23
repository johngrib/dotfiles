-- abbreviations.lua

-- Simple abbreviations
vim.cmd("iabbr __email johngrib82@gmail.com")
vim.cmd("iabbr ㅇ. 있다.")
vim.cmd("iabbr ㅇ.. 입니다.")
vim.cmd("iabbr ㄱ.. 그리고")

-- Expression abbreviations
vim.keymap.set('i', '__time', function()
  return vim.fn.strftime("%Y-%m-%d %H:%M:%S")
end, { expr = true })

vim.keymap.set('i', '__date', function()
  return vim.fn.strftime("%Y-%m-%d")
end, { expr = true })

vim.keymap.set('i', '__file', function()
  return vim.fn.expand('%:p')
end, { expr = true })

vim.keymap.set('i', '__name', function()
  return vim.fn.expand('%')
end, { expr = true })

vim.keymap.set('i', '__pwd', function()
  return vim.fn.expand('%:p:h')
end, { expr = true })

vim.keymap.set('i', '__branch', function()
  return vim.fn.system("git rev-parse --abbrev-ref HEAD")
end, { expr = true })

vim.keymap.set('i', '__uuid', function()
  return vim.fn.system("uuidgen")
end, { expr = true })