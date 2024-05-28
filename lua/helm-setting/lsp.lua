local configs = require('lspconfig.configs')
local util = require('lspconfig.util')

if not configs.helm_ls then
  configs.helm_ls = {
    default_config = {
      cmd = {"helm_ls", "serve"},
      filetypes = {'helm'},
      root_dir = function(fname)
        return util.root_pattern('Chart.yaml')(fname)
      end
    }
  }
end

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
