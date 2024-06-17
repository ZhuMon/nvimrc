require('lint').linters_by_ft = {
  -- typescript = {'eslint'},
  -- typescriptreact = {'eslint'},
  -- javascript = {'eslint_d'},
  -- javascriptreact = {'eslint'},
  lua = {'luacheck'},
  -- python = {'flake8'},
  bash = {'shellcheck'},
  sh = {'shellcheck'},
  terraform = {'tflint'},
  json = {'jsonlint'}
}

vim.api.nvim_create_autocmd({"BufWritePost"}, {
  callback = function()
    require("lint").try_lint()
  end
})
