local PLUG_URLS = {
  "https://github.com/junegunn/fzf",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/j-hui/fidget.nvim",
  "https://github.com/echasnovski/mini.align",
}
local PLUG_ROOT = vim.fn.stdpath("data") .. "/site/pack/plugins/start"

--- Install plugins given urls.
---
--- @param plug_urls string[] An array of plugin urls.
--- @param plug_root string A root path where plugins will be installed.
local function install(plug_urls, plug_root)
  local job_ids = {}

  for _, plug_url in pairs(plug_urls) do
    local plug_name = vim.fn.fnamemodify(plug_url, ":t")
    local plug_path = vim.fn.expand(plug_root .. "/" .. plug_name)

    if vim.fn.isdirectory(plug_path) == 0 then
      vim.api.nvim_echo({
        { "Installing " .. plug_name .. "..." },
      }, true, {})

      local job_id = vim.fn.jobstart({
        "git",
        "clone",
        "--depth=1",
        "--filter=blob:none",
        plug_url,
        plug_path,
      }, {
        on_exit = function(_, exit_code, _)
          if exit_code == 0 then
            vim.api.nvim_echo({
              { "Installed " .. plug_name .. "!" },
            }, true, {})
          else
            vim.api.nvim_echo({
              {
                string.format(
                  "Failed to install %s with exit code %s",
                  plug_name,
                  exit_code
                ),
                "ErrorMsg",
              },
            }, true, {})
          end
        end,
      })

      table.insert(job_ids, job_id)
    end
  end

  vim.fn.jobwait(job_ids)
end

--- Create plugin commands.
---
--- @param plug_urls string[] An array of plugin urls.
--- @param plug_root string A path where plugins will be installed.
local function create_commands(plug_urls, plug_root)
  vim.api.nvim_create_user_command("Pu", function()
    vim.fn.system({ "rm", "-rf", plug_root })
    install(plug_urls, plug_root)

    vim.api.nvim_echo({
      { "Updated all plugins. Restart Nvim to get latest updates." },
    }, true, {})
  end, { desc = "Update plugins" })

  vim.api.nvim_create_user_command("Pc", function()
    vim.api.nvim_echo({ { "Plugin count: " .. #plug_urls } }, true, {})
  end, { desc = "Count plugins" })

  vim.api.nvim_create_user_command("Pl", function()
    local msg = ""
    for index, plug_url in pairs(plug_urls) do
      local plug_name = vim.fn.fnamemodify(plug_url, ":t")
      msg = string.format("%s%s. %s: %s\n", msg, index, plug_name, plug_url)
    end

    if msg ~= "" then
      vim.api.nvim_echo({ { msg } }, true, {})
    end
  end, { desc = "List plugins" })
end

--- Set up plugins.
local function setup()
  install(PLUG_URLS, PLUG_ROOT)
  create_commands(PLUG_URLS, PLUG_ROOT)
end

setup()
