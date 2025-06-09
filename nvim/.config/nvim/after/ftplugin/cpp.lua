local utils = require("utils")

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.cpp",
  group = utils.augroup("cpp_runner"),
  command = utils.runnercmd("cc -o %:p:r % && %:p:r"),
})
