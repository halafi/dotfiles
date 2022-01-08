require("trouble").setup {
   height = 15,
   use_diagnostic_signs = true
}
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)
