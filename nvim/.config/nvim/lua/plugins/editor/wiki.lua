return {
  {
    "lervag/wiki.vim",
    init = function()
      vim.g.wiki_root = vim.fn.expand(os.getenv("WIKI_ROOT_PATH") or "~/wiki")
      if vim.fn.isdirectory(vim.g.wiki_root) == 0 then
        require("utils.system").run_cmd("mkdir " .. vim.g.wiki_root)
      end

      vim.keymap.set("n", "<leader>wx", "<plug>(wiki-pages)", {
        desc = "List wiki files in current wiki or in the main wiki defined by |g:wiki_root|",
      })
    end,
  },
}
