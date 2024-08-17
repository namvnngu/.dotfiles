return {
  {
    "lervag/wiki.vim",
    lazy = false,
    keys = {
      {
        "<leader>wx",
        "<plug>(wiki-pages)",
        mode = "n",
        desc = "List wiki files in current wiki or in the main wiki defined by |g:wiki_root|",
      },
    },
    init = function()
      vim.g.wiki_root = "~/wiki"
      if vim.fn.isdirectory(vim.g.wiki_root) == 0 then
        require("utils.system").run_cmd("mkdir " .. vim.g.wiki_root)
      end
    end,
  },
}
