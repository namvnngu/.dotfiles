local utils = require("utils")

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.c",
  group = utils.augroup("c_runner"),
  command = utils.runnercmd("cc -o %:p:r % && %:p:r"),
})
