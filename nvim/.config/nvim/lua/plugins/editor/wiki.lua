return {
  {
    "lervag/wiki.vim",
    init = function()
      vim.keymap.set("n", "<leader>wx", "<plug>(wiki-pages)", {
        desc = "List wiki files in current wiki or in the main wiki defined by |g:wiki_root|",
      })

      local wiki_root_path_env = os.getenv("WIKI_ROOT_PATH")
      if wiki_root_path_env ~= nil then
        vim.g.wiki_root = wiki_root_path_env
        if vim.fn.isdirectory(vim.g.wiki_root) == 0 then
          require("utils.system").run_cmd("mkdir " .. vim.g.wiki_root)
        end
      end
    end,
  },
}
