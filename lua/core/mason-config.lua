require("mason").setup({
  ensure_installed = {"delve", "gopls", "golangci-lint", "luacheck", "luaformatter", "shfmt"}
})
require("mason-lspconfig").setup()
