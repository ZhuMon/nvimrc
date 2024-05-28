local lspconfig = require('lspconfig')

lspconfig.helm_ls.setup {
  settings = {
    ['helm-ls'] = {
      logLevel = "info",
      valuesFiles = {
        mainValuesFile = "values.yaml",
        lintOverlayValuesFile = "values.lint.yaml",
        additionalValuesFilesGlobPattern = "[int|test|stg|prod].*.yaml"
      },
      yamlls = {
        enabled = true,
        path = "yaml-language-server",
        filetypes = {'helm'},
        showDiagnosticsDirectly = true,
        diagnosticsLimit = 50,

        config = {
          schemas = {["https://json.schemastore.org/chart.json"] = "**/templates/**"},
          completion = true,
          hover = true
        }
      }
    }
  }
}
