require('core.plugins')

-- Dev must be first than the LSP
require('core.dev')

-- installer
require('core.mason-config')

-- custom keybindings
require('core.keymap')

-- styling
require('core.color-scheme')

-- vim options
-- after than the color scheme to override
require('core.options')

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
require('golang-setting/go-nvim')
require('golang-setting/lsp')

-- format
require('formatting')

-- comment
require('commenter')
