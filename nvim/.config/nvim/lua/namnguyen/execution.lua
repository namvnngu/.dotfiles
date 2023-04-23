local nnoremap = require('utils.keymap').nnoremap
local Terminal = require('toggleterm.terminal').Terminal

---Create auto command to execute code based on file type
---@param config table
--- - augroup_name (string): The name of the group
--- - filetype_pattern (string): The pattern of file type
--- - desc (string): The description of auto command
--- - execution_command (string): The commend to execuate code
local function create_code_execution_autocmd(config)
  local group_id = vim.api.nvim_create_augroup(config.augroup_name, { clear = true })
  vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
    pattern = config.filetype_pattern,
    group = group_id,
    desc = config.desc,
    callback = function()
      nnoremap('<leader>pp', function()
        local term = Terminal:new({
          cmd = config.execution_command,
          hidden = true,
          close_on_exit = false,
        })
        term:toggle()
      end)
    end,
  })
end

create_code_execution_autocmd({
  augroup_name = 'python_execution',
  filetype_pattern = '*.py',
  desc = 'Execute Python code',
  execution_command = 'python3 ' .. vim.fn.expand('%'),
})

create_code_execution_autocmd({
  augroup_name = 'cpp_execution',
  filetype_pattern = '*.cpp',
  desc = 'Execute C++ code',
  execution_command = 'g++ -std=c++14 '
    .. vim.fn.expand('%')
    .. ' -O2 -Wall -Wextra -Werror -pedantic -g -o '
    .. vim.fn.expand('%:t:r')
    .. '.out && ./'
    .. vim.fn.expand('%:t:r')
    .. '.out',
})

create_code_execution_autocmd({
  augroup_name = 'java_execution',
  filetype_pattern = '*.java',
  desc = 'Execute Java code',
  execution_command = 'javac ' .. vim.fn.expand('%:t') .. ' && java -enableassertions ' .. vim.fn.expand('%:t:r'),
})

create_code_execution_autocmd({
  augroup_name = 'cs_execution',
  filetype_pattern = '*.cs',
  desc = 'Execute C# code',
  execution_command = 'dotnet run --project ' .. vim.fn.expand('%:p:h'),
})

create_code_execution_autocmd({
  augroup_name = 'ts_js_execution',
  filetype_pattern = { '*.ts', '*.js' },
  desc = 'Execute Typescipt or Javascript code',
  execution_command = 'esno ' .. vim.fn.expand('%'),
})
