local oil = require("oil")

oil.setup({
    delete_to_trash = true,
    columns = {
        "permissions",
        "size",
        "mtime",
        "birthtime",
    },
    view_options = {
        show_hidden = true,
    },
})

vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory" })
