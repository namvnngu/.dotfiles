local file = require("utils.file")
local git = require("utils.git")
local shell = require("utils.shell")

--- List all capabilities of the server associated with the current buffer
vim.api.nvim_create_user_command("LspCapabilities", function()
  local curBuf = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_active_clients({ bufnr = curBuf })

  for _, client in pairs(clients) do
    if client.name ~= "null-ls" then
      local capabilities = {}
      for capability_name, is_active in pairs(client.server_capabilities) do
        if is_active and capability_name:find("Provider") then
          table.insert(capabilities, "- " .. capability_name)
        end
      end

      table.sort(capabilities)

      local msg = "# "
        .. client.name
        .. "\n"
        .. table.concat(capabilities, "\n")
      vim.notify(msg, vim.log.levels.TRACE)
    end
  end
end, {})

vim.api.nvim_create_user_command("Template", function(opts)
  local template_name = opts.args

  if template_name == "cg" then
    vim.cmd("read $HOME/.config/nvim/templates/CG.cpp")
  elseif template_name == "ccp" then
    vim.cmd("read $HOME/.config/nvim/templates/CCP.cpp")
  elseif template_name == "pg" then
    vim.cmd("read $HOME/.config/nvim/templates/PG.py")
  elseif template_name == "pcp" then
    vim.cmd("read $HOME/.config/nvim/templates/PCP.py")
  elseif template_name == "html" then
    vim.cmd("read $HOME/.config/nvim/templates/HTML.html")
  elseif template_name == "java" then
    vim.cmd("read $HOME/.config/nvim/templates/Java.java")
  elseif template_name == "js" then
    vim.cmd("read $HOME/.config/nvim/templates/JS.js")
  else
    vim.notify("No template for " .. template_name .. "!", vim.log.levels.WARN)
  end
end, { nargs = 1, desc = "Load a template" })

-- stylua: ignore
vim.api.nvim_create_user_command("Run", function()
  local extension = file.get_file_ext()

  if extension == "py" then
    vim.cmd("term " .. shell.generate_cd_cmd("python3 %"))
  elseif extension == "cpp" then
    vim.cmd("term " .. shell.generate_cd_cmd("g++ -std=c++14 % -O2 -Wall -Wextra -Werror -pedantic -g -o %:t:r.out && ./%:t:r.out"))
  elseif extension == "c" then
    vim.cmd("term " .. shell.generate_cd_cmd("gcc -std=c11 % -O2 -Wall -Wextra -Werror -pedantic -g -o %:t:r.out && ./%:t:r.out"))
  elseif extension == "java" then
    vim.cmd("term " .. shell.generate_cd_cmd("javac %:t && java -enableassertions %:t:r"))
  elseif extension == "cs" then
    vim.cmd("term " .. shell.generate_cd_cmd("dotnet run --project %:p:h"))
  elseif extension == "ts" or extension == "js" then
    vim.cmd("term " .. shell.generate_cd_cmd("npx tsx %:t"))
  else
    vim.notify("No execution for " .. extension .. " yet!", vim.log.levels.WARN)
  end
end, { desc = "Execute code based on filetype" })

vim.api.nvim_create_user_command("OpenGitCommitURL", function()
  local filetype = file.get_filetype()

  if filetype == "fugitiveblame" then
    git.open_commit_in_browser(vim.fn.expand("<cword>"))
  end
end, { desc = "Open Git commit URL" })
