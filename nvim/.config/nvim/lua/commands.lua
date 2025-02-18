vim.api.nvim_create_user_command("Grep", function(opts)
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

vim.api.nvim_create_user_command("GOpenCommit", function()
  local short_sha = vim.fn.expand("<cword>")

  local remote_url =
    vim.trim(vim.fn.system({ "git", "config", "--get", "remote.origin.url" }))

  local long_sha = vim.trim(vim.fn.system({ "git", "rev-parse", short_sha }))
  local remote_domain = string.match(remote_url, ".*git%@(.*)%:.*")
    or string.match(remote_url, "https%:%/%/.*%@(.*)%/.*")
    or string.match(remote_url, "https%:%/%/(.*)%/.*")
  local commit_path = remote_domain
      and remote_domain:lower() == "bitbucket.org"
      and "/commits/" .. long_sha
    or "/commit/" .. long_sha

  local repo_url = ""
  local REMOTE_URL_PATTERNS = {
    ".*git%@(.*)%:(.*)%.git",
    ".*git%@(.*)%.git",
    "(https%:%/%/.*)%.git",
    ".*git%@(.*)%:(.*)",
    ".*git%@(.*)",
    "(https%:%/%/.*)",
  }
  for _, pattern in pairs(REMOTE_URL_PATTERNS) do
    local domain, path = string.match(remote_url, pattern)
    path = (path and "/" .. path or "")
    if domain and string.find(domain, "https") then
      repo_url = domain .. path
      break
    elseif domain then
      repo_url = "https://" .. domain .. path
      break
    end
  end

  local commit_url = repo_url .. commit_path
  local os = vim.uv.os_uname().sysname

  if os == "Darwin" then
    vim.fn.system("open " .. commit_url)
  elseif os == "Linux" then
    vim.fn.system("xdg-open " .. commit_url)
  else
    vim.fn.setreg("+", commit_url)
    vim.api.nvim_echo({
      { "Copied to clipboard: " .. commit_url },
    }, true, {})
  end
end, { desc = "Open Git commit URL" })

vim.api.nvim_create_user_command("GBlameEx", function(args)
  local filepath = vim.api.nvim_buf_get_name(0)
  vim.cmd(
    "vsplit | vertical resize +200 | term git blame -w -C -C -C -L "
      .. args.line1
      .. ","
      .. args.line2
      .. " "
      .. filepath
  )
end, { desc = "Git extreme blame", range = true })
