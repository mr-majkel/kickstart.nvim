return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {

      { 'github/copilot.vim' },
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    opts = {
      model = 'claude-sonnet-4.6', -- AI model to use
      temperature = 0.1, -- Lower = focused, higher = creative
      window = {
        layout = 'vertical',
        width = 0.5,
      },

      headers = {
        user = '👤 You',
        assistant = '🤖 Copilot',
        tool = '🔧 Tool',
      },

      separator = '━━',
      auto_fold = true, -- Automatically folds non-assistant messages
      auto_insert_mode = true, -- Enter insert mode when opening
      mappings = {
        complete = {
          insert = '<C-t>',
        },
      },
    },
    -- See Configuration section for options
  },
  vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChat<cr>', { desc = 'Chat with Copilot' }),
}
