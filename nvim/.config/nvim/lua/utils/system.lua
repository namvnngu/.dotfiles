local M = {}

---@return string 'Linux, Darwin or Windows'
function M.get_os_name()
  return vim.loop.os_uname().sysname
end

---@class StartJobOptions
---@field on_stdout? fun(data: string[])
---@field on_exit? fun(code: number)
---@field input? string
---
---Run a shell command
---@param cmd string
---@param opts? StartJobOptions
---@return number 'the job id'
function M.run_cmd(cmd, opts)
  opts = opts or {}
  local id = vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    ---@param data string[]
    on_stdout = function(_, data, _)
      if data and opts.on_stdout then
        opts.on_stdout(data)
      end
    end,
    on_exit = function(_, code, _)
      if opts.on_exit then
        opts.on_exit(code)
      end
    end,
  })

  if opts.input then
    vim.fn.chansend(id, opts.input)
    vim.fn.chanclose(id, "stdin")
  end

  return id
end

---Keeping it outside the function improves performance
---by not finding the OS every time.
---@type fun(url: string)
local open_url
---Attempts to open a given URL in the system default browser, regardless of the OS.
---Reference: https://stackoverflow.com/a/18864453/9714875
---@param url string
function M.launch_url(url)
  if not open_url then
    local os_name = M.get_os_name()
    if os_name == "Windows" then
      open_url = function(launched_url)
        M.run_cmd(string.format("start %s", launched_url))
      end
    elseif os_name == "Darwin" then
      open_url = function(launched_url)
        M.run_cmd(string.format("open %s", launched_url))
      end
    elseif os_name == "Linux" then
      open_url = function(launched_url)
        M.run_cmd(string.format("xdg-open %s", launched_url))
      end
    end
  end

  open_url(url)
end

---Pre-append `cd` command that changes the directory that contains the current buffer/file
---@param cmd string
---@return string
function M.prepend_cd_to_cmd(cmd)
  return "cd " .. vim.fn.shellescape(vim.fn.expand("%:p:h")) .. " && " .. cmd
end

---Copy to clipboard
---@param text string
function M.to_clipboard(text)
  vim.fn.setreg("+", text)
end

return M
