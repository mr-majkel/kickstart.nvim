local map = vim.keymap.set
return {
  'tpope/vim-fugitive',
  config = function()
    map('n', '<leader>ee', '<Cmd>Git<cr>', { desc = 'Git status', silent = true })
    map('n', '<leader>ep', ':Git pull<return>', { desc = 'Git pull', silent = true })
    map('n', '<leader>eh', ':Git push<return>', { desc = 'Git push', silent = true })
    map('n', '<leader>em', ":Git commit --no-verify -m '", { desc = 'Git commit [no verify] with msg' })
  end,
}
