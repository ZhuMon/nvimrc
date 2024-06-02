-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors for better colors
-- vim.opt.termguicolors = true

require('nvim-tree').setup {
  hijack_cursor = true,
  renderer = {add_trailing = true, highlight_modified = "icon", highlight_git = "icon"}
}

-- Trigger `autoread` when files change on disk
vim.api.nvim_create_autocmd({'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI'}, {
  pattern = '*',
  command = "if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif"
})

-- Notification after file change
vim.api.nvim_create_autocmd({'FileChangedShellPost'}, {
  pattern = '*',
  command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None"
})

local function delview()
  node = require("nvim-tree.lib").get_node_at_cursor()

  -- [For Debug] write node information to /tmp/node.txt
  -- local file = io.open("/tmp/node.txt", "w")
  -- file:write("Path: " .. path .. "\n")
  -- file:close()

  local path = node.absolute_path
  path = vim.fn.substitute(path, '=', '==', 'g')

  -- Replace home directory with ~
  if vim.env.HOME then
    path = vim.fn.substitute(path, '^' .. vim.env.HOME, '~', '')
  end
  path = vim.fn.substitute(path, '/', '=+', 'g') .. '='
  path = vim.o.viewdir .. '/' .. path
  vim.fn.delete(path)
end

local tree_actions = {
  {name = "Create node", handler = require("nvim-tree.api").fs.create},
  {name = "Remove node", handler = require("nvim-tree.api").fs.remove},
  {name = "Trash node", handler = require("nvim-tree.api").fs.trash},
  {name = "Rename node", handler = require("nvim-tree.api").fs.rename},
  {name = "Fully rename node", handler = require("nvim-tree.api").fs.rename_sub},
  {name = "Copy", handler = require("nvim-tree.api").fs.copy.node},
  {name = "Change root to node", handler = require("nvim-tree.api").tree.change_root_to_node},
  -- cleanup view file for reset root directory
  {name = "Remove file view", handler = delview}

  -- ... other custom actions you may want to display in the menu
}

local function tree_actions_menu(node)
  local entry_maker = function(menu_item)
    return {value = menu_item, ordinal = menu_item.name, display = menu_item.name}
  end

  local finder = require("telescope.finders").new_table({
    results = tree_actions,
    entry_maker = entry_maker
  })

  local sorter = require("telescope.sorters").get_generic_fuzzy_sorter()

  local default_options = {
    finder = finder,
    sorter = sorter,
    attach_mappings = function(prompt_buffer_number)
      local actions = require("telescope.actions")

      -- On item select
      actions.select_default:replace(function()
        local state = require("telescope.actions.state")
        local selection = state.get_selected_entry()
        -- Closing the picker
        actions.close(prompt_buffer_number)
        -- Executing the callback
        selection.value.handler(node)
      end)

      -- The following actions are disabled in this example
      -- You may want to map them too depending on your needs though
      actions.add_selection:replace(function()
      end)
      actions.remove_selection:replace(function()
      end)
      actions.toggle_selection:replace(function()
      end)
      actions.select_all:replace(function()
      end)
      actions.drop_all:replace(function()
      end)
      actions.toggle_all:replace(function()
      end)

      return true
    end
  }

  -- Opening the menu
  require("telescope.pickers").new({prompt_title = "Tree menu"}, default_options):find()
end

-- Set keymap for tree actions menu
vim.api.nvim_create_autocmd({'FileType'}, {
  pattern = 'NvimTree',
  callback = function()
    local buffer = vim.api.nvim_get_current_buf()
    vim.keymap.set("n", "h", tree_actions_menu, {buffer = buffer, noremap = true, silent = true})
  end
})
