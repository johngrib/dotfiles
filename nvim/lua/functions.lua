-- functions.lua

local M = {}

-- 라인 넘버 표시 방식 토글
function M.toggle_number()
    if vim.opt.relativenumber:get() then
        vim.opt.relativenumber = false
        vim.opt.number = true
    else
        vim.opt.relativenumber = true
    end
end

-- 10진수를 2진수로 변환
function M.decimal_to_binary(input)
    local num = input

    if num == 0 then
        return 0
    end

    local bin = ''
    while num > 0 do
        bin = (num % 2) .. bin
        num = math.floor(num / 2) -- 정수 나눗셈
    end

    return bin
end

return M
