vim.keymap.set(
  "ia",
  "me::",
  vim.fn.strftime(
    "Author: Nam Nguyen <vnngucs@outlook.com><CR>"
      .. "Description:<CR>"
      .. "License: The Unlicense<CR>"
      .. "Date Created: %B %d, %Y<CR>"
      .. "Date Modified: %B %d, %Y"
  )
)
