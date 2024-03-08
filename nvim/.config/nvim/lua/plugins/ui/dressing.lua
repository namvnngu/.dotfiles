return {
  -- UI Enhancement
  {
    "stevearc/dressing.nvim",
    event = "LspAttach",
    opts = {
      input = {
        insert_only = false,
      },
    },
  },
}
