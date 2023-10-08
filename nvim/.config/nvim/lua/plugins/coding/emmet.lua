return {
  -- Support Emmet for HTML & CSS
  {
    "mattn/emmet-vim",
    lazy = true,
    config = function()
      vim["user_emmet_leader_key"] = "<C-Y>"
    end,
    ft = { "html" },
  },
}
