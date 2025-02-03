local M = {}
local system = require("utils.system")

--- @param callback fun(is_ignored: boolean)
function M.is_current_file_ignored(callback)
  local filepath = vim.api.nvim_buf_get_name(0)
  if filepath == "" then
    return true
  end

  system.run_cmd("git check-ignore " .. vim.fn.shellescape(filepath), {
    on_exit = function(code)
      callback(code ~= 1)
    end,
  })
end

--- @param sha string
--- @param remote_url string
--- @return string
function M.generate_commit_path(sha, remote_url)
  local domain = string.match(remote_url, ".*git%@(.*)%:.*")
    or string.match(remote_url, "https%:%/%/.*%@(.*)%/.*")
    or string.match(remote_url, "https%:%/%/(.*)%/.*")

  if domain and domain:lower() == "bitbucket.org" then
    return "/commits/" .. sha
  end

  return "/commit/" .. sha
end

--- @param remote_url string
--- @return string
function M.generate_repo_url(remote_url)
  local domain, path = string.match(remote_url, ".*git%@(.*)%:(.*)%.git")
  if domain and path then
    return "https://" .. domain .. "/" .. path
  end

  local url = string.match(remote_url, ".*git%@(.*)%.git")
  if url then
    return "https://" .. url
  end

  local https_url = string.match(remote_url, "(https%:%/%/.*)%.git")
  if https_url then
    return https_url
  end

  domain, path = string.match(remote_url, ".*git%@(.*)%:(.*)")
  if domain and path then
    return "https://" .. domain .. "/" .. path
  end

  url = string.match(remote_url, ".*git%@(.*)")
  if url then
    return "https://" .. url
  end

  https_url = string.match(remote_url, "(https%:%/%/.*)")
  if https_url then
    return https_url
  end

  return remote_url
end

--- @param remote_url string
--- @param shaOrBranch string
--- @param filepath string
--- @param line1 number?
--- @param line2 number?
--- @return string
function M.generate_file_url(remote_url, shaOrBranch, filepath, line1, line2)
  local repo_url = M.generate_repo_url(remote_url)
  local isSrcHut = repo_url:find("git.sr.ht")

  local file_path = "/blob/" .. shaOrBranch .. "/" .. filepath
  if isSrcHut then
    file_path = "/tree/" .. shaOrBranch .. "/" .. filepath
  end

  if line1 == nil then
    return repo_url .. file_path
  elseif line2 == nil or line1 == line2 then
    return repo_url .. file_path .. "#L" .. line1
  else
    if isSrcHut then
      return repo_url .. file_path .. "#L" .. line1 .. "-" .. line2
    end
    return repo_url .. file_path .. "#L" .. line1 .. "-L" .. line2
  end
end

--- @param sha string
--- @param remote_url string
--- @return string
function M.generate_commit_url(sha, remote_url)
  local commit_path = M.generate_commit_path(sha, remote_url)

  local repo_url = M.generate_repo_url(remote_url)
  return repo_url .. commit_path
end

--- @param callback fun(branch_name: string)
function M.get_current_branch(callback)
  system.run_cmd("git branch --show-current", {
    on_stdout = function(url)
      if url and url[1] then
        callback(url[1])
      else
        callback("")
      end
    end,
  })
end

--- @param filepath string
--- @param sha string?
--- @param line1 number?
--- @param line2 number?
--- @param callback fun(url: string)
function M.get_file_url(filepath, sha, line1, line2, callback)
  M.get_repo_root(function(root)
    local relative_filepath = string.sub(filepath, #root + 2)

    if sha == nil then
      M.get_current_branch(function(branch)
        M.get_remote_url(function(remote_url)
          local url = M.generate_file_url(
            remote_url,
            branch,
            relative_filepath,
            line1,
            line2
          )
          callback(url)
        end)
      end)
    else
      M.get_remote_url(function(remote_url)
        local url =
          M.generate_file_url(remote_url, sha, relative_filepath, line1, line2)
        callback(url)
      end)
    end
  end)
end

--- @param filepath string
--- @param sha string?
--- @param line1 number?
--- @param line2 number?
function M.open_file_in_browser(filepath, sha, line1, line2)
  M.get_file_url(filepath, sha, line1, line2, function(url)
    system.launch_url(url)
  end)
end

--- @param sha string
function M.open_commit_in_browser(sha)
  M.get_long_sha_from_short(sha, function(long_sha)
    M.get_remote_url(function(remote_url)
      local commit_url = M.generate_commit_url(long_sha, remote_url)
      system.launch_url(commit_url)
    end)
  end)
end

--- @param callback fun(url: string)
function M.get_remote_url(callback)
  system.run_cmd("git config --get remote.origin.url", {
    on_stdout = function(url)
      if url and url[1] then
        callback(url[1])
      else
        callback("")
      end
    end,
  })
end

--- @param callback fun(repo_root: string)
function M.get_repo_root(callback)
  system.run_cmd("git rev-parse --show-toplevel", {
    on_stdout = function(data)
      callback(data[1])
    end,
  })
end

--- @param short_sha string
--- @param callback fun(long_sha: string)
function M.get_long_sha_from_short(short_sha, callback)
  system.run_cmd("git rev-parse " .. short_sha, {
    on_stdout = function(data)
      callback(data[1])
    end,
  })
end

return M
