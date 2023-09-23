local trim_spaces_augroup = vim.api.nvim_create_augroup('TrimSpaces', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = trim_spaces_augroup,
  pattern = '*',
  callback = function()
    local patterns = {
      [[%s/\s\+$//e]],
      [[%s/\%^\n\+//]],
      [[%s/\(\n\n\)\n\+/\1/]],
      [[%s/\($\n\s*\)\+\%$//]],
    }
    local save = vim.fn.winsaveview()
    for _, v in pairs(patterns) do
      vim.api.nvim_exec(string.format('keepjumps keeppatterns silent! %s', v), false)
    end
    vim.fn.winrestview(save)
  end,
})

local scss_to_sass_augroup = vim.api.nvim_create_augroup('ScssToSass', { clear = true })
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = scss_to_sass_augroup,
  pattern = '*.scss',
  command = 'set filetype=sass',
})
