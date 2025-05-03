local shell = require("utils.shell")
local M = {}

--- Keeping it outside the function improves performance by not
--- finding the OS every time.
---
--- @type fun(url: string)
local open_url

--- Attempts to open a given URL in the system default browser, regardless of the OS.
--- Source: https://stackoverflow.com/a/18864453/9714875
---
--- @param url string
function M.launch(url)
  if not open_url then
    if package.config:sub(1, 1) == "\\" then
      open_url = function(_url)
        shell.start_job(string.format('rundll32 url.dll,FileProtocolHandler "%s"', _url))
      end
    elseif (io.popen("uname -s"):read("*a")):match("Darwin") then
      open_url = function(_url)
        shell.start_job(string.format('open "%s"', _url))
      end
    else
      open_url = function(_url)
        shell.start_job(string.format('xdg-open "%s"', _url))
      end
    end
  end

  open_url(url)
end

return M
