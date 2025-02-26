require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang_format" },
    typescript = function(bufnr)
      if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
        return {}
      end
      if vim.fs.root(bufnr, { "biome.json", "biome.jsonc" }) then
        return { "biome" }
      end
      return { "prettier" }
    end,
    typescriptreact = function(bufnr)
      if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
        return {}
      end
      if vim.fs.root(bufnr, { "biome.json", "biome.jsonc" }) then
        return { "biome" }
      end
      return { "prettier" }
    end,
    javascript = function(bufnr)
      return vim.fs.root(bufnr, { "biome.json", "biome.jsonc" }) and { "biome" }
        or { "prettier" }
    end,
    javascriptreact = function(bufnr)
      return vim.fs.root(bufnr, { "biome.json", "biome.jsonc" }) and { "biome" }
        or { "prettier" }
    end,
    cs = { "csharpier" },
  },
})

vim.keymap.set("n", "<leader>F", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })
