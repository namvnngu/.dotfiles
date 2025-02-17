local PLUG_URLS = {
  "https://github.com/junegunn/fzf",
  "https://github.com/stevearc/oil.nvim",
}
local PLUG_ROOT = vim.fn.stdpath("data") .. "/site/pack/plugins/start"

--- Install plugins given urls.
---
--- @param plug_urls string[] An array of plugin urls.
--- @param plug_root string A root path where plugins will be installed.
local function install(plug_urls, plug_root)
  for _, plug_url in pairs(plug_urls) do
    local plug_name = vim.fn.fnamemodify(plug_url, ":t")
    local plug_path = vim.fn.expand(plug_root .. "/" .. plug_name)

    if vim.fn.isdirectory(plug_path) == 0 then
      vim.api.nvim_echo({
        { "Installing " .. plug_name .. "..." },
      }, true, {})

      local is_ok, output = pcall(vim.fn.system, {
        "git",
        "clone",
        "--depth=1",
        "--filter=blob:none",
        plug_url,
        plug_path,
      })

      if is_ok and vim.v.shell_error == 0 then
        vim.api.nvim_echo({
          { "Installed " .. plug_name .. "!\n\n" },
        }, true, {})
      else
        vim.api.nvim_echo({
          { "Failed to install " .. plug_name .. "\n", "ErrorMsg" },
          { vim.trim(output or "") .. "\n\n", "WarningMsg" },
        }, true, {})
      end
    end
  end
end

--- Create plugin commands.
---
--- @param plug_urls string[] An array of plugin urls.
--- @param plug_root string A path where plugins will be installed.
local function create_commands(plug_urls, plug_root)
  vim.api.nvim_create_user_command("Pu", function()
    vim.fn.system("rm -rf " .. plug_root)
    install(plug_urls, plug_root)

    vim.api.nvim_echo({
      { "Updated all plugins. Restart Nvim to get latest updates." },
    }, true, {})
  end, { desc = "Update plugins" })

  vim.api.nvim_create_user_command("Pc", function()
    vim.api.nvim_echo({
      { "Plugin count: " .. #plug_urls },
    }, true, {})
  end, { desc = "Count plugins" })

  vim.api.nvim_create_user_command("Pl", function()
    local message = ""
    for index, plug_url in pairs(plug_urls) do
      local plug_name = vim.fn.fnamemodify(plug_url, ":t")
      message =
        string.format("%s%s. %s: %s\n", message, index, plug_name, plug_url)
    end

    vim.api.nvim_echo({
      { message },
    }, true, {})
  end, { desc = "List plugins" })
end

--- Set up plugins.
local function setup()
  install(PLUG_URLS, PLUG_ROOT)
  create_commands(PLUG_URLS, PLUG_ROOT)
end

setup()
