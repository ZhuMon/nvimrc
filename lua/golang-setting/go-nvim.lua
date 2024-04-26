-- go.nvim setup
require('go').setup({
  go = 'go', -- go command, can be go[default] or go1.18beta1
  goimports = 'gopls', -- goimports command, can be gopls[default] or either goimports or golines if need to split long lines
  gofmt = 'gopls', -- gofmt through gopls: alternative is gofumpt, goimports, golines, gofmt, etc
  fillstruct = 'gopls' -- set to fillstruct if gopls fails to fill struct

})

-- Run gofmt + goimports on save
local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimports()
  end,
  group = format_sync_grp
})
