require('Comment').setup({
  toggler = {
    ---line-comment keymap
    line = '<leader>ci',
    ---block-comment keymap
    block = '<leader>cb'
  },
  opleader = {
    ---operator pending mode mapping leader
    line = 'ci',
    block = 'cb'
  },
  mappings = {
    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
    basic = true,
    ---Extra mapping; `gco`, `gcO`, `gcA`
    extra = false
  }
})
