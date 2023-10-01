return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "typescript", "tsx" })
      end

      local parser_config =
        require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.tsx.filetype_to_parsername =
        { "javascript", "typescript.tsx", "javascriptreact" }
    end,
  },
}
