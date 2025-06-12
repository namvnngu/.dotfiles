local utils = require("utils")

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
      vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { tostring(calc) })
    end
  end)
end, { desc = "Calculator" })

vim.api.nvim_create_user_command("GOpenCommit", function()
  local sha = vim.fn.expand("<cword>")
  local remote_url = vim.trim(vim.fn.system({ "git", "config", "--get", "remote.origin.url" }))

  local repo_url = ""
  local REMOTE_URL_PATTERNS = {
    ".*git@(.+):(.+)%.git",
    ".*git@(.+)%.git",
    "https://(.+)%.git",
    ".*git@(.+):(.+)",
    ".*git@(.+)",
    "https://(.+)",
  }
  for _, pattern in pairs(REMOTE_URL_PATTERNS) do
    local first, second = string.match(remote_url, pattern)
    if first then
      repo_url = "https://" .. first .. (second and "/" .. second or "")
      break
    end
  end

  if repo_url == "" then
    utils.echo(("Failed to open commit %s. The URL is %s."):format(sha, repo_url), true)
    return
  end

  local full_sha = vim.trim(vim.fn.system({ "git", "rev-parse", sha }))
  local commit_path = string.find(repo_url:lower(), "bitbucket.org") and "/commits/" .. full_sha
    or "/commit/" .. full_sha

  local commit_url = repo_url .. commit_path
  vim.ui.open(commit_url)
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

vim.api.nvim_create_user_command(
  "DiffOrig",
  "vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis",
  {
    desc = "View the same buffer in diff mode in one window and 'normal' in another window.",
  }
)

vim.api.nvim_create_user_command("Gg", function(opts)
  local escaped = vim.uri_encode(opts.args)
  local url = ("https://www.google.com/search?q=%s"):format(escaped)
  vim.ui.open(url)
end, { nargs = 1, desc = "Google" })
