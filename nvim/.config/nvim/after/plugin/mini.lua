require('mini.comment').setup()

require('mini.starter').setup({
  items = {
    { action = 'Oil', name = 'Explorer', section = 'Browsing' },
    { action = 'Telescope git_files', name = 'Git Files', section = 'Browsing' },
    { action = 'Telescope file_browser', name = 'File Browser', section = 'Browsing' },
    require('mini.starter').sections.recent_files(5, true),
  },
})
