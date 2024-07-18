require("bufferline").setup({
  options = {
    separator_style = "thin",
    tab_size = 18,
    enforce_regular_tabs = true,
    view = "multiwindow",
    show_buffer_close_icons = true,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
  },
})
