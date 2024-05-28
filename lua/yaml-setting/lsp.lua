local lspconfig = require('lspconfig')

-- setup yamlls
lspconfig.yamlls.setup {
  -- cmd = {'yaml-language-server', '--stdio'},
  filetypes = {'yaml', 'yml'},
  root_dir = lspconfig.util.root_pattern(".git"),
  settings = {
    yaml = {
      schemas = {
        -- GitHub Actions workflow schema
        ["https://json.schemastore.org/github-workflow.json"] = "*.github/workflows/*",
        -- Docker Compose schema
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "**/docker-compose.yaml"
      }
    }
  }

}
