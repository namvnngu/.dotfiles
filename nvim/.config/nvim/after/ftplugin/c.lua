vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.c",
  group = vim.api.nvim_create_augroup("namnguyen_c_runner", { clear = true }),
  command = "command! Run vs | term cc -o %:p:r % && %:p:r",
})
