-- keymaps.lua

-- Define leader keys first
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local map = vim.keymap.set

-- 줄바꿈 처리된 라인에서 j, k 키 이동 개선
map('n', 'k', 'gk', { noremap = true, silent = true })
map('n', 'gk', 'k', { noremap = true, silent = true })
map('n', 'j', 'gj', { noremap = true, silent = true })
map('n', 'gj', 'j', { noremap = true, silent = true })

-- 이전 명령 반복
map('n', '&', ':&&<CR>', { noremap = true })
map('x', '&', ':&&<CR>', { noremap = true })

-- 줄 끝까지 복사
map('n', 'Y', 'y$', { noremap = true })

-- 입력 모드에서 커서 이동
map('i', '<C-l>', '<right>', { noremap = true })
map('i', '<C-e>', '<C-O>$', { noremap = true })

-- 새로운 줄 삽입
map('n', 'K', 'i<CR><Esc>', { noremap = true })

-- 버퍼 이동
map('n', '<PageUp>', ':bnext!<CR>', { noremap = true, silent = true })
map('n', '<PageDown>', ':bprevious!<CR>', { noremap = true, silent = true })

-- 시스템 클립보드로 복사/붙여넣기
map('n', '<leader>y', '"+y', { noremap = true })
map('n', '<leader>Y', '"+yg_', { noremap = true })
map('v', '<leader>y', '"+y', { noremap = true })
map('n', '<leader>d', '"+d', { noremap = true })
map('n', '<leader>D', '"+yD', { noremap = true })
map('v', '<leader>d', '"+d', { noremap = true })
map('n', '<leader>p', '"+p', { noremap = true })
map('n', '<leader>P', '"+P', { noremap = true })

-- 파일 저장
map('n', '<leader>w', ':w<CR>', { noremap = true })

-- 빠른 이동
map('n', '<leader>f', '<Esc>:let @z=@/<CR>/\v[)"}]<CR>:let @/=@z<CR>', { noremap = true })
map('n', '<leader>b', '<Esc>:let @z=@/<CR>?\v[("{]<CR>:let @/=@z<CR>', { noremap = true })

-- 비주얼 모드에서 선택 영역으로 검색
map('v', '<leader>*', 'y/\\V<C-R>=@"<CR><CR>', { noremap = true })

-- 플러그인 관련 단축키 (일부)
map('n', '<M-/>', ':echom "[1]Explorer [2]Tagbar [3]Startify"<CR>', { noremap = true })
map('n', '<A-1>', ':CocCommand explorer<CR>', { noremap = false })
map('n', '<A-2>', ':TagbarToggle<CR>:e<CR>', { noremap = false })
map('n', '<A-3>', ':Startify<CR>', { noremap = false })

-- Git (fugitive) 관련
map('n', '<leader>ga', '<cmd>Gwrite<CR>', { noremap = true })
map('n', '<leader>gr', '<cmd>Gread<CR>', { noremap = true })
map('n', '<leader>gc', '<cmd>Git commit<CR>', { noremap = true })
map('n', '<leader>gb', '<cmd>Git blame<CR>', { noremap = true })

-- 사용하지 않을 키 비활성화
map('n', 's', '<nop>', { noremap = true, silent = true })
map('n', 'S', '<nop>', { noremap = true, silent = true })
map('v', 's', '<nop>', { noremap = true, silent = true })