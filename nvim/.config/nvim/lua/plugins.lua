local PLUG_URLS = {
  -- Required
  "https://github.com/junegunn/fzf",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/williamboman/mason.nvim",

  -- Optional
  "https://github.com/j-hui/fidget.nvim",
  "https://github.com/echasnovski/mini.align",
  "https://github.com/Decodetalkers/csharpls-extended-lsp.nvim",
}
local PLUG_ROOT = vim.fn.stdpath("data") .. "/site/pack/plugins/start"

--- Gets the plugin name from a given URL or path.
---
--- @param urlOrPath string The URL or file path of the plugin.
--- @return string The plugin name.
local function get_plug_name(urlOrPath)
  return vim.fn.fnamemodify(urlOrPath, ":t")
end

--- Installs plugins given urls.
---
--- @param plug_urls string[] An array of plugin urls.
--- @param plug_root string A root path where plugins will be installed.
local function install_plugs(plug_urls, plug_root)
  if vim.tbl_isempty(plug_urls) then
    return
  end

  local job_ids = {}

  for _, plug_url in pairs(plug_urls) do
    local plug_name = get_plug_name(plug_url)
    local plug_path = vim.fn.expand(("%s/%s"):format(plug_root, plug_name))

    if vim.fn.isdirectory(plug_path) == 0 then
      vim.api.nvim_echo({
        { ("Installing %s..."):format(plug_name) },
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
              { ("Installed %s!"):format(plug_name) },
            }, true, {})
          else
            vim.api.nvim_echo({
              {
                ("Failed to install %s with exit code %s"):format(
                  plug_name,
                  exit_code
                ),
              },
            }, true, { err = true })
          end
        end,
      })

      table.insert(job_ids, job_id)
    end
  end

  vim.fn.jobwait(job_ids)
end

--- Creates plugin commands.
---
--- @param plug_urls string[] An array of plugin urls.
--- @param plug_root string A path where plugins will be installed.
local function create_cmds(plug_urls, plug_root)
  vim.api.nvim_create_user_command("Pu", function()
    vim.fn.system({ "rm", "-rf", plug_root })
    install_plugs(plug_urls, plug_root)
    vim.api.nvim_echo({
      { "Updated all plugins. Restart Nvim to get latest updates." },
    }, true, {})
  end, { desc = "Update all plugins" })

  vim.api.nvim_create_user_command("Ps", function()
    local current_plug_path_by_name = vim
      .iter(vim.fn.globpath(plug_root, "*", false, true))
      :fold({}, function(tbl, plug_path)
        tbl[get_plug_name(plug_path)] = plug_path
        return tbl
      end)
    local next_plug_url_by_name = vim
      .iter(plug_urls)
      :fold({}, function(tbl, plug_url)
        tbl[get_plug_name(plug_url)] = plug_url
        return tbl
      end)

    local removed_plug_path_by_name = {}
    for plug_name, plug_path in pairs(current_plug_path_by_name) do
      if not next_plug_url_by_name[plug_name] then
        removed_plug_path_by_name[plug_name] = plug_path
      end
    end
    if not vim.tbl_isempty(removed_plug_path_by_name) then
      local removed_plug_names = vim.tbl_keys(removed_plug_path_by_name)
      local removed_plug_paths = vim.tbl_values(removed_plug_path_by_name)
      vim.api.nvim_echo({
        {
          ("Removing %s..."):format(
            vim.fn.join(removed_plug_names, "...\nRemoving ")
          ),
        },
      }, true, {})
      vim.fn.system(vim.list_extend({ "rm", "-rf" }, removed_plug_paths))
      vim.api.nvim_echo({
        {
          ("Removed %s!"):format(
            vim.fn.join(removed_plug_names, "!\nRemoved ")
          ),
        },
      }, true, {})
    end

    local added_plug_urls = {}
    for plug_name, plug_url in pairs(next_plug_url_by_name) do
      if not current_plug_path_by_name[plug_name] then
        table.insert(added_plug_urls, plug_url)
      end
    end
    if not vim.tbl_isempty(added_plug_urls) then
      install_plugs(added_plug_urls, plug_root)
    end

    if
      vim.tbl_isempty(removed_plug_path_by_name)
      and vim.tbl_isempty(added_plug_urls)
    then
      vim.api.nvim_echo({ { "All plugins are already synced." } }, true, {})
    else
      vim.api.nvim_echo({ { "Restart Nvim to get latest updates." } }, true, {})
    end
  end, { desc = "Sync plugins" })

  vim.api.nvim_create_user_command("Pc", function()
    local plug_paths = vim.fn.globpath(plug_root, "*", false, true)
    vim.api.nvim_echo({
      { "Plugin count: " .. vim.tbl_count(plug_paths) },
    }, true, {})
  end, { desc = "Count plugins" })

  vim.api.nvim_create_user_command("Pl", function()
    local plug_paths = vim.fn.globpath(plug_root, "*", false, true)
    for index, path in pairs(plug_paths) do
      local name = get_plug_name(path)
      vim.api.nvim_echo({ { ("%s. %s"):format(index, name) } }, true, {})
    end
  end, { desc = "List plugins" })
end

-- install_plugs(PLUG_URLS, PLUG_ROOT)
create_cmds(PLUG_URLS, PLUG_ROOT)
