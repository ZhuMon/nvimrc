-- Require LSP config which we can use to attach gopls to the LSP client
local lspconfig = require 'lspconfig'
local utils = require 'lspconfig/util'

-- Set up the gopls configuration
lspconfig.gopls.setup {
  cmd = {"gopls", "serve"},
  filetypes = {"go", "gomod"},
  root_dir = utils.root_pattern("go.work", "go.mod", ".git"),
  settings = {gopls = {analyses = {unusedparams = true}, staticcheck = true}},
  -- set tag function
  tag_func = require('go').tag
}
