-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors for better colors
-- vim.opt.termguicolors = true

require('nvim-tree').setup {
  hijack_cursor = true,
  renderer = {add_trailing = true, highlight_modified = "icon", highlight_git = "icon"}
}

-- Trigger `autoread` when files change on disk
vim.api.nvim_create_autocmd({'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI'}, {
  pattern = '*',
  command = "if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif"
})

-- Notification after file change
vim.api.nvim_create_autocmd({'FileChangedShellPost'}, {
  pattern = '*',
  command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None"
})
