require('bufferline').setup({
  options = {
    tab_size = 18,
    separator_style = 'thin',
    enforce_regular_tabs = true,
    show_buffer_close_icons = true,
    diagnostics = 'lsp',
    ---@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match('error') and ' ' or ' '
      return ' ' .. icon .. count
    end,
  },
})
