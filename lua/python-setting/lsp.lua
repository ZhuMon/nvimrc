local lspconfig = require('lspconfig')

lspconfig.pyright.setup {
  settings = {
    pyright = {autoImportCompletion = true},
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = 'openFilesOnly',
        useLibraryCodeForTypes = true,
        typeCheckingMode = 'off'
      },
      pythonPath = '/opt/homebrew/bin/python3.11'
    }
  }
}
