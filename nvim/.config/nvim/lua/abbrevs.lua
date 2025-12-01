vim.keymap.set(
  "ia",
  "me@",
  vim.fn.strftime(
    "Author: Nam Nguyen <vnngucs@outlook.com><CR>"
      .. "Description:<CR>"
      .. "License: The Unlicense<CR>"
      .. "Date Created: %B %d, %Y<CR>"
      .. "Date Modified: %B %d, %Y"
  )
)

vim.keymap.set(
  "ia",
  "cpcpp@",
  "#include <iostream><CR>"
    .. "<CR>"
    .. "using namespace std;<CR>"
    .. "<CR>"
    .. "int main() {<CR>"
    .. "  ios_base::sync_with_stdio(0);<CR>"
    .. "  cin.tie(0);<CR>"
    .. "}"
    .. "<Esc>gg=GGk^"
)
