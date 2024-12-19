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
        typos_lsp = {
          init_options = {
            config = "~/.config/nvim/lua/plugins/.typos.toml",
          },
        },
        yamlls = {
          filetypes = { "yaml", "yml" },
          root_dir = require("lspconfig").util.root_pattern(".git", vim.fn.getcwd()),
          -- Have to add this for yamlls to understand that we support line folding
          capabilities = {
            textDocument = {
              foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
              },
            },
          },
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.yaml.schemas = vim.tbl_deep_extend(
              "force",
              new_config.settings.yaml.schemas or {},
              require("schemastore").yaml.schemas()
            )
          end,
          settings = {
            yaml = {
              format = {
                enable = true,
              },
              validate = true,
              schemas = {
                -- GitHub Actions workflow schema
                ["https://json.schemastore.org/github-workflow.json"] = "*.github/workflows/*",
                -- Docker Compose schema
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "**/docker-compose.yaml",
                -- Cloudformation schema
                -- ["https://raw.githubusercontent.com/cfn-modules/docs/master/docs/modules/schema.json"] = "cloudformation/base/cicd-iam.yaml",
                ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = "**cloudformation/**",
              },
              customTags = {
                -- for cloudformation
                "!Base64 scalar",
                "!Cidr scalar",
                "!And sequence",
                "!Equals sequence",
                "!If sequence",
                "!Not sequence",
                "!Or sequence",
                "!Condition scalar",
                "!FindInMap sequence",
                "!GetAtt scalar",
                "!GetAtt sequence",
                "!GetAZs scalar",
                "!ImportValue scalar",
                "!Join sequence",
                "!Select sequence",
                "!Split sequence",
                "!Sub scalar",
                "!Transform mapping",
                "!Ref scalar",
              },
            },
          },
        },
        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = false,
                compositeLiteralFields = false,
                compositeLiteralTypes = false,
                constantValues = true,
                functionTypeParameters = false,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
        },
      },
    },
  },
}
