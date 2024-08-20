return {
  {
    "lervag/wiki.vim",
    init = function()
      vim.g.wiki_root =
        vim.fn.expand(vim.fn.getenv("WIKI_ROOT_PATH") or "~/wiki")
      if vim.fn.isdirectory(vim.g.wiki_root) == 0 then
        require("utils.system").run_cmd("mkdir " .. vim.g.wiki_root)
      end

      -- keymaps
      vim.keymap.set("n", "<leader>wx", "<plug>(wiki-pages)", {
        desc = "List wiki files in current wiki or in the main wiki defined by |g:wiki_root|",
      })

      -- commands
      vim.api.nvim_create_user_command("Wjp", function()
        local filetype = vim.bo.filetype
        if filetype == "markdown" then
          vim.cmd("WikiJournalPrev")
        else
          require("utils.notify").error(
            "Wjp is not available outside of markdown files"
          )
        end
      end, {
        desc = "Go to the previous journal entry (at current level of daily, weekly, monthly)",
      })
      vim.api.nvim_create_user_command("Wjn", function()
        local filetype = vim.bo.filetype
        if filetype == "markdown" then
          vim.cmd("WikiJournalNext")
        else
          require("utils.notify").error(
            "Wjn is not available outside of markdown files"
          )
        end
      end, {
        desc = "Go to the next journal entry (at current level of daily, weekly, monthly)",
      })
    end,
  },
}
