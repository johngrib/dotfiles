return {
  'milkypostman/vim-togglelist',
  config = function()
    local map = vim.keymap.set
    local M = {} -- Module table for functions

    -- quickfix 다음/이전 이동
    map('n', '<Tab>qn', ':cnext<CR>', { noremap = true })
    map('n', '<Tab>qN', ':cprevious<CR>', { noremap = true })

    -- quickfix 열기/닫기 토글
    map('n', '<Tab>ql', ':call ToggleLocationList()<CR>', { silent = true })
    map('n', '<Tab>qq', ':call ToggleQuickfixList()<CR>', { silent = true })

    -- 현재 커서가 있는 라인을 북마크 파일에 저장합니다.
    function M.AddQuickfixBookmarkFile()
        local pwd = vim.fn.getcwd()
        local file = pwd .. '/.quickfix-bookmark'
        local bookmark = vim.fn.expand("%:p") .. ":" .. vim.fn.line(".") .. ": " .. vim.fn.expand("<cword>")
        vim.api.nvim_echo({{bookmark, "Normal"}}, false, {}) -- echom
        vim.fn.system("echo '" .. bookmark .. "' >> " .. file)
    end

    -- 북마크 파일을 편집합니다. 메모를 추가하는 등의 용도로 사용하세요.
    function M.EditQuickfixBookmarkFile()
        local pwd = vim.fn.getcwd()
        local file = pwd .. '/.quickfix-bookmark'
        vim.cmd("vs " .. file)
    end

    -- 북마크 파일을 퀵픽스 창에 열어줍니다.
    function M.OpenQuickfixBookmarkFile()
        local pwd = vim.fn.getcwd()
        local file = pwd .. '/.quickfix-bookmark'
        vim.cmd("cfile " .. file)
        vim.cmd("copen")
    end

    -- Custom function keymaps
    map('n', '<Tab>qm', ':lua require("plugins.vim-togglelist").AddQuickfixBookmarkFile()<CR>', { noremap = true })
    map('n', '<Tab>qe', ':lua require("plugins.vim-togglelist").EditQuickfixBookmarkFile()<CR>', { noremap = true })
    map('n', '<Tab>q\'', ':lua require("plugins.vim-togglelist").OpenQuickfixBookmarkFile()<CR>', { noremap = true })
    map('n', '<Tab>q`', ':lua require("plugins.vim-togglelist").OpenQuickfixBookmarkFile()<CR>', { noremap = true })

    return M -- Return the module table
  end,
}