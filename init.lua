require('core.plugins')

-- Dev must be first than the LSP
require('core.dev')

-- installer
require('core.mason-config')

-- url encode/decode
require('url-encode-decode')

-- custom keybindings
require('core.keymap')

-- styling
require('core.color-scheme')

-- vim options
-- after than the color scheme to override
require('core.options')

-- Copilot
-- Should be before the LSP
require('copilot-setting')

-- LSP
require('code-completion')

-- File explorer
require('file-explorer')

-- syntax highlight
require('syntax-highlight')

-- debugging
require('debugging')

-- linter
require('linting')

-- fold
require('folding')

-- statusbar
require('statusbar')

-- go
require('golang-setting.go-nvim')
require('golang-setting.lsp')

-- format
require('formatting')

-- comment
require('commenter')

-- typos
require('typos-setting')

-- yaml
require('yaml-setting.lsp')

-- helm
-- must be after the yaml
require('helm-setting.lsp')

-- python
require('python-setting.lsp')
