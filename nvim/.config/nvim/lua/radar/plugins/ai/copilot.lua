return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  -- {
  --   "zbirenbaum/copilot-cmp.lua",
  --   config = function()
  --     require("copilot_cmp").setup({})
  --   end,
  -- },
}
