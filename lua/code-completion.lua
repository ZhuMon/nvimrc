local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  -- Configuration
  -- sources are used to define where the suggestions come from
  sources = {
    {name = 'copilot'},
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 2},
    {name = 'nvim_lsp_signature_help'},
    {name = 'nvim_lua'},
    {name = 'buffer'},
    {name = 'treesitter'},
    {name = 'spell'},
    {name = 'tags'},
    {name = 'calc'},
    {name = 'emoji'}
  },

  -- Window
  -- The window configuration is used to define the appearance of the completion menu
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
    prompt = cmp.config.window.bordered()
  },

  -- Formatting
  -- The formatting configuration is used to define the appearance of the completion menuone
  formatting = {
    fields = {'abbr', 'kind', 'menu'},
    format = lspkind.cmp_format({
      -- show both icon and text
      with_text = true,
      maxwidth = 20, -- max width of the completion menu
      ellipsis = '…' -- show ellipsis when the item is too long
    }),

    -- The completion menu will show the kind of the item
    -- The function below will be called before any actual modifications from lspkind
    before = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        buffer = "[Buffer]",
        treesitter = "[TS]",
        spell = "[Spell]",
        tags = "[Tags]",
        calc = "[Calc]",
        emoji = "[Emoji]",
        copilot = "[Copilot]",
        path = "[Path]"
      })[entry.source.name]
      return vim_item
    end
  },

  -- Mapping
  -- The mapping table is used to define the keybindings for the completion menu
  mapping = {
    -- Downward will select the current item
    ['<Down>'] = cmp.mapping.select_next_item(),
    -- Upward will select the previous item
    ['<Up>'] = cmp.mapping.select_prev_item(),
    -- Ctrl+d will scroll down the list
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    -- Ctrl+u will scroll up the list
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    -- Right arrow will close the completion menu
    ['<Right>'] = cmp.mapping.close(),
    -- CR (enter or return) will confirm the selection
    ['<CR>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = true})
  }
})
