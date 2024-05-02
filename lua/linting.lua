require('lint').linters_by_ft = {
  typescript = {'eslint'},
  typescriptreact = {'eslint'},
  javascript = {'eslint'},
  javascriptreact = {'eslint'},
  lua = {'luacheck'},
  -- python = {'flake8'},
  yaml = {'yamllint'},
  bash = {'shellcheck'},
  sh = {'shellcheck'}
}

vim.api.nvim_create_autocmd({"BufWritePost"}, {
  callback = function()
    require("lint").try_lint()
  end
})
