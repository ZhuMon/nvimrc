-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.api.nvim_set_keymap
-- ## Insert mode
map("i", "jk", "<Esc>", { noremap = true, silent = true })
map("i", "Jk", "<Esc>", { noremap = true, silent = true })
map("i", "jK", "<Esc>", { noremap = true, silent = true })
map("i", "JK", "<Esc>", { noremap = true, silent = true })
