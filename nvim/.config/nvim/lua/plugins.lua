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

--- Displays a message in the Neovim command area by using `vim.api.nvim_echo`.
---
--- @param msg string The message to display.
--- @param is_error? boolean If `true`, the message is treated as an error.
local function echo(msg, is_error)
  vim.api.nvim_echo({ { msg } }, true, { err = is_error })
end

--- Installs a list of plugins given their URLS.
---
--- @param plug_urls string[] List of plugin URLs to be installed.
--- @param plug_root string The root directory where plugins are stored.
local function install_plugs(plug_urls, plug_root)
  if vim.tbl_isempty(plug_urls) then
    return
  end

  local job_ids = {}

  for _, plug_url in pairs(plug_urls) do
    local plug_name = get_plug_name(plug_url)
    local plug_path = vim.fn.expand(("%s/%s"):format(plug_root, plug_name))

    if vim.fn.isdirectory(plug_path) == 0 then
      echo(("Installing %s..."):format(plug_name))

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
            echo(("Installed %s!"):format(plug_name))
          else
            echo(
              ("Failed to install %s with exit code %s"):format(
                plug_name,
                exit_code
              ),
              true
            )
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
--- @param next_plug_urls string[] List of desired plugin URLs.
--- @param plug_root string The root directory where plugins are stored.
--- @return boolean `true` if no changes are needed (already synced).
local function sync_plugs(next_plug_urls, plug_root)
  local function build_plug_name_map(list)
    return vim.iter(list):fold({}, function(acc, item)
      acc[get_plug_name(item)] = item
      return acc
    end)
  end

  local current_plug_paths = vim.fn.globpath(plug_root, "*", false, true)
  local current_plug_path_by_name = build_plug_name_map(current_plug_paths)
  local next_plug_url_by_name = build_plug_name_map(next_plug_urls)

  local removed_plug_path_by_name = {}
  for plug_name, plug_path in pairs(current_plug_path_by_name) do
    if not next_plug_url_by_name[plug_name] then
      removed_plug_path_by_name[plug_name] = plug_path
    end
  end
  if not vim.tbl_isempty(removed_plug_path_by_name) then
    local names = vim.tbl_keys(removed_plug_path_by_name)
    local paths = vim.tbl_values(removed_plug_path_by_name)
    echo(("Removing %s..."):format(vim.fn.join(names, "...\nRemoving ")))
    vim.fn.system(vim.list_extend({ "rm", "-rf" }, paths))
    echo(("Removed %s!"):format(vim.fn.join(names, "!\nRemoved ")))
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

  local no_changes = vim.tbl_isempty(removed_plug_path_by_name)
    and vim.tbl_isempty(added_plug_urls)

  if not no_changes then
    echo("Restart Nvim to get latest updates.")
  end

  return no_changes
end

--- Creates plugin commands.
---
--- @param plug_urls string[] List of plugin URLs to be installed.
--- @param plug_root string The root directory where plugins are stored.
local function create_cmds(plug_urls, plug_root)
  vim.api.nvim_create_user_command("Pu", function()
    vim.fn.system({ "rm", "-rf", plug_root })
    install_plugs(plug_urls, plug_root)
    echo("Updated all plugins. Restart Nvim to get latest updates.")
  end, { desc = "Update all plugins" })

  vim.api.nvim_create_user_command("Ps", function()
    local no_changes = sync_plugs(plug_urls, plug_root)
    if no_changes then
      echo("All plugins are already synced.")
    end
  end, { desc = "Sync plugins" })

  vim.api.nvim_create_user_command("Pc", function()
    local plug_paths = vim.fn.globpath(plug_root, "*", false, true)
    echo("Plugin count: " .. vim.tbl_count(plug_paths))
  end, { desc = "Count plugins" })

  vim.api.nvim_create_user_command("Pl", function()
    local plug_paths = vim.fn.globpath(plug_root, "*", false, true)
    for index, path in pairs(plug_paths) do
      local name = get_plug_name(path)
      echo(("%s. %s"):format(index, name))
    end
  end, { desc = "List plugins" })
end

sync_plugs(PLUG_URLS, PLUG_ROOT)
create_cmds(PLUG_URLS, PLUG_ROOT)
