require("mason").setup()

require("mason-tool-installer").setup {
  ensure_installed = {
    -- LSP
    "gopls",
    "helm_ls",
    "typos_lsp",
    "yamlls", -- "yaml-language-server"
    -- Debugger
    "delve",
    "golangci-lint",
    -- Linter
    "luacheck",
    "tflint",
    "yamllint",
    -- Formatter
    "luaformatter",
    "shfmt",
    "black",
    "gotests"
  },

  -- automatically install / update on startup. If set to false nothing
  -- will happen on startup. You can use :MasonToolsInstall or
  -- :MasonToolsUpdate to install tools and check for updates.
  -- Default: true
  run_on_start = true,

  -- Only attempt to install if 'debounce_hours' number of hours has
  -- elapsed since the last time Neovim was started. This stores a
  -- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
  -- This is only relevant when you are using 'run_on_start'. It has no
  -- effect when running manually via ':MasonToolsInstall' etc....
  -- Default: nil
  debounce_hours = 5 -- at least 5 hours between attempts to install/update
}

require("mason-lspconfig").setup()
