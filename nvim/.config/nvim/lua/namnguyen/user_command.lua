--- List all capabilities of the server associated with the current buffer
vim.api.nvim_create_user_command('LspCapabilities', function()
  local curBuf = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_active_clients({ bufnr = curBuf })

  for _, client in pairs(clients) do
    if client.name ~= 'null-ls' then
      local capabilities = {}
      for capability_name, is_active in pairs(client.server_capabilities) do
        if is_active and capability_name:find('Provider') then
          table.insert(capabilities, '- ' .. capability_name)
        end
      end

      table.sort(capabilities)

      local msg = '# ' .. client.name .. '\n' .. table.concat(capabilities, '\n')
      vim.notify(msg, vim.log.levels.TRACE)
    end
  end
end, {})
