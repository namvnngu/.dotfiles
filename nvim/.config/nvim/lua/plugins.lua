local PLUGIN_URLS = {
  -- Required
  "https://github.com/junegunn/fzf",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/stevearc/conform.nvim",

  -- Optional
  "https://github.com/j-hui/fidget.nvim",
  "https://github.com/godlygeek/tabular",
  "https://github.com/Decodetalkers/csharpls-extended-lsp.nvim",
}
local PLUGIN_ROOT = vim.fn.stdpath("data") .. "/site/pack/plugins/start"

--- Gets the plugin name from a given URL or path.
---
--- @param urlOrPath string The URL or file path of the plugin.
--- @return string The plugin name.
local function get_plugin_name(urlOrPath)
  return vim.fn.fnamemodify(urlOrPath, ":t")
end

--- Displays a message in the Neovim command area by using `vim.api.nvim_echo`.
---
--- @param msg string The message to display.
--- @param is_error? boolean If `true`, the message is treated as an error.
local function echo(msg, is_error)
  vim.api.nvim_echo({ { msg } }, true, { err = is_error })
end

--- Installs a list of plugins given their URLS.
---
--- @param plugin_urls string[] List of plugin URLs to be installed.
--- @param plugin_root string The root directory where plugins are stored.
local function install_plugs(plugin_urls, plugin_root)
  if vim.tbl_isempty(plugin_urls) then
    return
  end

  local job_ids = {}

  for _, plugin_url in pairs(plugin_urls) do
    local name = get_plugin_name(plugin_url)
    local path = vim.fn.expand(("%s/%s"):format(plugin_root, name))

    if vim.fn.isdirectory(path) == 0 then
      echo(("Installing %s..."):format(name))

      local job_id = vim.fn.jobstart({
        "git",
        "clone",
        "--depth=1",
        "--filter=blob:none",
        plugin_url,
        path,
      }, {
        on_exit = function(_, exit_code, _)
          if exit_code == 0 then
            echo(("Installed %s!"):format(name))
          else
            local err_msg = ("Failed to install %s with exit code %s"):format(name, exit_code)
            echo(err_msg, true)
          end
        end,
      })

      table.insert(job_ids, job_id)
    end
  end

  vim.fn.jobwait(job_ids)
end

--- Synchronizes plugins in a given plugin root directory.
---
--- This function compares the currently installed plugins with a list of
--- desired plugin URLs. It removes any plugins that are no longer needed and
--- installs any new ones that are missing.
---
--- @param next_plugin_urls string[] List of desired plugin URLs.
--- @param plugin_root string The root directory where plugins are stored.
--- @return boolean `true` if no changes are needed (already synced).
local function sync_plugins(next_plugin_urls, plugin_root)
  local function build_map(list)
    return vim.iter(list):fold({}, function(acc, item)
      acc[get_plugin_name(item)] = item
      return acc
    end)
  end

  local current_plugin_paths = vim.fn.globpath(plugin_root, "*", false, true)
  local current_plugin_path_by_name = build_map(current_plugin_paths)
  local next_plugin_url_by_name = build_map(next_plugin_urls)

  local removed_plugin_path_by_name = {}
  for name, path in pairs(current_plugin_path_by_name) do
    if not next_plugin_url_by_name[name] then
      removed_plugin_path_by_name[name] = path
    end
  end
  if not vim.tbl_isempty(removed_plugin_path_by_name) then
    local names = vim.tbl_keys(removed_plugin_path_by_name)
    local paths = vim.tbl_values(removed_plugin_path_by_name)
    echo(("Removing %s..."):format(vim.fn.join(names, "...\nRemoving ")))
    vim.fn.system(vim.list_extend({ "rm", "-rf" }, paths))
    echo(("Removed %s!"):format(vim.fn.join(names, "!\nRemoved ")))
  end

  local added_plugin_urls = {}
  for name, url in pairs(next_plugin_url_by_name) do
    if not current_plugin_path_by_name[name] then
      table.insert(added_plugin_urls, url)
    end
  end
  if not vim.tbl_isempty(added_plugin_urls) then
    install_plugs(added_plugin_urls, plugin_root)
  end

  local no_changes = vim.tbl_isempty(removed_plugin_path_by_name)
    and vim.tbl_isempty(added_plugin_urls)

  if not no_changes then
    echo("Restart Nvim to get latest updates.")
  end

  return no_changes
end

--- Creates plugin commands.
---
--- @param next_plugin_urls string[] List of desired plugin URLs.
--- @param plugin_root string The root directory where plugins are stored.
local function create_commands(next_plugin_urls, plugin_root)
  vim.api.nvim_create_user_command("Pu", function()
    vim.fn.system({ "rm", "-rf", plugin_root })
    install_plugs(next_plugin_urls, plugin_root)
    echo("Updated all plugins. Restart Nvim to get latest updates.")
  end, { desc = "Update all plugins" })

  vim.api.nvim_create_user_command("Ps", function()
    local no_changes = sync_plugins(next_plugin_urls, plugin_root)
    if no_changes then
      echo("All plugins are already synced.")
    end
  end, { desc = "Sync plugins" })

  vim.api.nvim_create_user_command("Pc", function()
    local paths = vim.fn.globpath(plugin_root, "*", false, true)
    echo("Plugin count: " .. vim.tbl_count(paths))
  end, { desc = "Count plugins" })

  vim.api.nvim_create_user_command("Pl", function()
    local paths = vim.fn.globpath(plugin_root, "*", false, true)
    for index, path in pairs(paths) do
      local name = get_plugin_name(path)
      echo(("%s. %s"):format(index, name))
    end
  end, { desc = "List plugins" })
end

sync_plugins(PLUGIN_URLS, PLUGIN_ROOT)
create_commands(PLUGIN_URLS, PLUGIN_ROOT)
