-- fetch keymap function
local map = vim.api.nvim_set_keymap

-- change learder key to '9'
vim.g.mapleader = '9'

-- Keymaps
-- ## Normal mode
-- ### NvimTree
map('n', 't', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- ### Nvim-dap
map('n', '<F5>', ':lua require"dap".continue()<CR>', {noremap = true, silent = true})
-- map('n', '<F5>', ':NvimTreeClose<CR> :lua require"dapui".toggle()<CR> :lua require"dap".continue()<CR>', {noremap = true, silent = true})

-- Ctrl + b set breakpoint
map('n', '<C-b>', ':lua require"dap".toggle_breakpoint()<CR>', {noremap = true, silent = true})
-- open repl
map('n', '<F9>', ':lua require"dap".repl.toggle()<CR>', {noremap = true, silent = true})

-- vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
-- vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
-- vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
-- vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
-- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
-- vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
-- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
-- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)

-- ### Folding
-- z + a : toggle Folding
-- z + c : close Folding
-- z + o : open Folding
-- z + m : close all Folding
-- z + r : open all Folding
-- z + R : open all Folding recursively
-- z + M : close all Folding recursively

-- ### Telescope
-- search files, no ignore, hidden files
map('n', '<Leader>ff',
    ':lua require"telescope.builtin".find_files({no_ignore = true, hidden = true})<CR>',
    {noremap = true, silent = true})

-- live grep
map('n', '<Leader>fg', ':lua require"telescope.builtin".live_grep()<CR>',
    {noremap = true, silent = true})

--- Insert mode
map('i', 'jk', '<Esc>', {noremap = true, silent = true})
map('i', 'Jk', '<Esc>', {noremap = true, silent = true})
map('i', 'jK', '<Esc>', {noremap = true, silent = true})
map('i', 'JK', '<Esc>', {noremap = true, silent = true})

map('i', '‘', '<Plug>(copilot-next)', {noremap = true, silent = true})
map('i', '“', '<Plug>(copilot-previous)', {noremap = true, silent = true})
