local opt = vim.opt -- for conciseness

-- Line Numbers
opt.number = true

-- Tabs and Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true
opt.cindent = true
opt.autoindent = true
opt.smartindent = true

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- UI
opt.ruler = true
opt.laststatus = 2
opt.showmatch = true
opt.cursorline = true
opt.lazyredraw = true
opt.showcmd = true
opt.wildmenu = true
opt.wildmode = 'full'
opt.cmdheight = 2
opt.conceallevel = 0
opt.cursorcolumn = true
opt.list = true
opt.listchars = 'tab:· ,trail:·,extends:>,precedes:<'

-- Behavior
opt.hidden = true
opt.splitbelow = true
opt.splitright = true
opt.autoread = true
opt.paste = false
opt.mouse = 'a'
opt.compatible = false
opt.virtualedit = 'block'
opt.omnifunc = 'syntaxcomplete#Complete'
opt.backspace = 'indent,eol,start'

-- Files, backup, undo
opt.fixeol = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undolevels = 2000
opt.history = 200

-- Performance
opt.updatetime = 300

-- Encoding
opt.fileencodings = 'utf-8,euc-kr'

-- Appending options
opt.path:append('**')
opt.shortmess:append('c')
opt.statusline:append('%*')

-- Bells
opt.errorbells = false
opt.visualbell = false

-- Grep
if vim.fn.executable('ag') == 1 then
  opt.grepprg = 'ag --nogroup --nocolor --column'
  opt.grepformat = '%f:%l:%c%m'
elseif vim.fn.executable('ack') == 1 then
  opt.grepprg = 'ack --nogroup --column $*'
  opt.grepformat = '%f:%l:%c:%m'
end

-- Global options
vim.api.nvim_set_option_value('timeoutlen', 1200, { scope = 'global' })
vim.api.nvim_set_option_value('ttimeoutlen', 50, { scope = 'global' })

-- Persistent undo directory setup
local vimDir = os.getenv('HOME') .. '/.vim'
local undoDir = vimDir .. '/undodir'
if vim.fn.isdirectory(vimDir) == 0 then
    vim.fn.mkdir(vimDir)
end
if vim.fn.isdirectory(undoDir) == 0 then
    vim.fn.mkdir(undoDir)
end
opt.undodir = undoDir

-- langmap
opt.langmap = 'ㅁa,ㅠb,ㅊc,ㅇd,ㄷe,ㄹf,ㅎg,ㅗh,ㅑi,ㅓj,ㅏk,ㅣl,ㅡm,ㅜn,ㅐo,ㅔp,ㅂq,ㄱr,ㄴs,ㅅt,ㅕu,ㅍv,ㅈw,ㅌx,ㅛy,ㅋz'
