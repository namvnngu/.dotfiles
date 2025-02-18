local git = require("utils.git")
local notify = require("utils.notify")

--- List all capabilities of the server associated with the current buffer
vim.api.nvim_create_user_command("LspCapabilities", function()
  local clients =
    vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })

  for _, client in pairs(clients) do
    local capabilities = {}
    for capability_name, is_active in pairs(client.server_capabilities) do
      if is_active and capability_name:find("Provider") then
        table.insert(capabilities, "- " .. capability_name)
      end
    end

    table.sort(capabilities)

    local msg = "# " .. client.name .. "\n" .. table.concat(capabilities, "\n")
    notify.trace(msg)
  end
end, {})

vim.api.nvim_create_user_command("QRun", function()
  local extension = vim.fn.expand("%:e")

  if extension == "py" then
    vim.cmd("hor term python3 %:p")
  elseif extension == "cpp" then
    vim.cmd("hor term cd %:p:h && c++ % -o out && ./out")
  elseif extension == "c" then
    vim.cmd("hor term cd %:p:h && cc % -std=c99 -o out && ./out")
  elseif extension == "java" then
    vim.cmd("hor term javac %:p && java -enableassertions %:t:r")
  elseif extension == "cs" then
    vim.cmd("hor term dotnet run --project %:p:h")
  elseif extension == "ts" or extension == "js" then
    vim.cmd("hor term node %:p")
  elseif extension == "hurl" then
    vim.cmd("hor term hurl %:p | jq")
  elseif extension == "" then
    notify.warn("The file does not exist yet!")
  else
    notify.warn("No run command for " .. extension .. " yet!")
  end
end, { desc = "Execute code based on file extension" })

vim.api.nvim_create_user_command("Test", function()
  local extension = vim.fn.expand("%:e")

  if extension == "hurl" then
    vim.cmd("hor term hurl --test %:t")
  elseif extension == "" then
    notify.warn("The file does not exist yet!")
  else
    notify.warn("No execution for " .. extension .. " yet!")
  end
end, { desc = "Run test code based on file extension" })

vim.api.nvim_create_user_command("OpenGitCommitURL", function()
  git.open_commit_in_browser(vim.fn.expand("<cword>"))
end, { desc = "Open Git commit URL" })

vim.api.nvim_create_user_command("BlameExtreme", function(args)
  local filepath = vim.api.nvim_buf_get_name(0)
  vim.cmd(
    "vsplit | vertical resize +200 | term git blame -w -C -C -C -L "
      .. args.line1
      .. ","
      .. args.line2
      .. " "
      .. filepath
  )
end, { desc = "Extreme git blame", range = true })

vim.api.nvim_create_user_command("Calc", function()
  vim.ui.input({ prompt = "Calculator: " }, function(input)
    local calc = load("return " .. (input or ""))()
    if calc then
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      vim.api.nvim_buf_set_text(
        0,
        row - 1,
        col,
        row - 1,
        col,
        { tostring(calc) }
      )
    end
  end)
end, { desc = "Calculator" })

vim.api.nvim_create_user_command("Grepf", function(opts)
  local keyword = opts.args
  vim.cmd("grep " .. keyword .. " -g %:p:h/**/*")
end, {
  nargs = 1,
  desc = "Grep keyword within the folder containing the current file",
})

vim.api.nvim_create_user_command("Ctags", "!ctags -R .", { desc = "Run ctags" })

vim.api.nvim_create_user_command("Cht", function(opts)
  local query = opts.args
  vim.cmd('sp | enew | .!curl -s "cht.sh/' .. query .. '?T"')
end, {
  nargs = 1,
  desc = "Find cht.sh with query",
})
