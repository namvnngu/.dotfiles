vim.keymap.set(
  "ia",
  "me::",
  vim.fn.strftime(
    "Author: Nam Nguyen <nguyenvietnam2401@gmail.com><CR>"
      .. "Description:<CR>"
      .. "License: MIT License<CR>"
      .. "Date created: %B %d, %Y<CR>"
      .. "Date modified: %B %d, %Y"
  )
)
