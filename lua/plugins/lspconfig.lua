return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
              },
              pythonPath = vim.fn.exepath("python3"),
            },
          },
        },
        typos_lsp = {},
      },
    },
  },
}
