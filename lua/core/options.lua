local opt = vim.opt

-- completeopt is used to manage code suggestion format
opt.completeopt = {'menuone', 'noselect', 'noinsert', 'preview'}

-- line number
opt.number = true
opt.signcolumn = 'yes' -- always show sign column
