-- vim.opt.foldmethod     = 'expr'
-- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
---WORKAROUND
vim.api.nvim_create_autocmd({'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
  end
})
---ENDWORKAROUND

-- Save the last folding status
vim.api.nvim_create_autocmd({'BufWinLeave'}, {
  group = vim.api.nvim_create_augroup('SaveFolding', {}),
  callback = function()
    vim.cmd('mkview')
  end
})

-- Restore the last folding status
vim.api.nvim_create_autocmd({'BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('RestoreFolding', {}),
  callback = function()
    vim.cmd('silent! loadview')
  end
})
