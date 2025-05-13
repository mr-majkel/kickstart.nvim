return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>ee', '<Cmd>Git<cr>', { desc = 'Git status' })
  end,
}
