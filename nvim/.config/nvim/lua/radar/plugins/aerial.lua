return {
  "stevearc/aerial.nvim",
  config = function()
    require("aerial").setup({
      on_attach = function(bufnr)
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>", { buffer = bufnr })
      end,
    })
  end,
}
