-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- === map jk to esc ===
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })

-- === move to sidenav filenav on currently open file ===
vim.keymap.set("n", "<leader>e", ":Neotree reveal<CR>", { noremap = true, silent = true })
