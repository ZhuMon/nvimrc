-- highlight todo comments
require('todo-comments').setup {
  highlight = {comments_only = true, multiline = false}
  -- set pattern to highlight keywords
  -- pattern = [[\b(KEYWORDS)]],
}

-- syntax highlighting
require('nvim-treesitter.configs').setup {
  -- A list of parser names, or 'all'
  ensure_installed = {
    -- programming languages
    "bash",
    "comment",
    "go",
    "helm",
    "javascript",
    "lua",
    "python",
    "ruby",
    "sql",
    "terraform",
    -- text formats
    "diff",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "json",
    "luadoc",
    "markdown",
    "yaml",
    "vim",
    "vimdoc",
    "yaml"
  },

  -- Install parsers synchronously (only used with ensure_installed)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
  highlight = {
    -- `false` will disable the whole extension
    enable = true
  }

}

-- highlight diff
-- link @diff.plus.diff to @DiffAdd
vim.cmd [[
  hi def link @diff.plus.diff DiffAdded
  hi def link @diff.minus.diff DiffRemoved
  hi def link @diff.change DiffChange
  hi def link @diff.text DiffText
]]
