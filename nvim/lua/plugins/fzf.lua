return {
  {
    'junegunn/fzf',
    build = function()
      vim.fn.system('~/.fzf/install --all')
    end,
    dir = '~/.fzf', -- This is important for fzf's install script
  },
  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf' },
    config = function()
      -- Global variables
      vim.g.fzf_launcher = 'In_a_new_term_function %s'
      -- vim.g.fzf_files_options = '--preview "(coderay {} || cat {}) 2> /dev/null | head -' .. vim.opt.lines:get() .. '"' -- commented out in original

      -- Keymaps
      vim.keymap.set('i', '<C-x><C-l>', '<plug>(fzf-complete-line)', { noremap = true })

      -- Functions
      local function fzf_omni_files()
        local is_git = vim.fn.system('git status')
        if vim.v.shell_error ~= 0 then
          vim.cmd('Files')
        else
          vim.cmd('GitFiles')
        end
      end

      local function build_quickfix_list(lines)
        local qflist = {}
        for _, line in ipairs(lines) do
          table.insert(qflist, { filename = line })
        end
        vim.fn.setqflist(qflist)
        vim.cmd('copen')
        vim.cmd('cc')
      end

      -- Commands
      vim.api.nvim_create_user_command('Files', function(opts)
        local bang = opts.bang and 1 or 0
        local args = opts.args
        vim.fn['fzf#vim#files'](args, vim.fn['fzf#vim#with_preview'](), bang)
      end, { nargs = '?', complete = 'dir', bang = true })

      vim.api.nvim_create_user_command('Ggrep', function(opts)
        local bang = opts.bang and 1 or 0
        local args = opts.args
        local dir_opt = vim.fn['fzf#vim#with_preview']({ dir = vim.fn.systemlist('git rev-parse --show-toplevel')[1] })
        vim.fn['fzf#vim#grep']('git grep --line-number ' .. vim.fn.shellescape(args), bang, dir_opt)
      end, { nargs = '*', bang = true })

      -- fzf_action
      vim.g.fzf_action = {
        ['ctrl-s'] = 'split',
        ['ctrl-v'] = 'vsplit',
        ['ctrl-q'] = build_quickfix_list,
      }
    end,
  },
}
