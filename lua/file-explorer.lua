-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors for better colors
-- vim.opt.termguicolors = true

require('nvim-tree').setup {
  hijack_cursor = true,
  renderer = {add_trailing = true, highlight_modified = "icon", highlight_git = "icon"}
}
