open_terminal = function()
  source_window = vim.api.nvim_get_current_win()
  source_buffer = vim.api.nvim_win_get_buf(0)
  empty_buffer = vim.api.nvim_create_buf(true, true)
  term_window = vim.api.nvim_open_win(empty_buffer, false, {
    split = 'right',
    win = 0
  })

  term_job_id = vim.api.nvim_win_call(term_window, function() vim.api.nvim_exec2("term bash", {output=false}) return channel end)
  vim.api.nvim_buf_set_var(source_buffer, "slime_config", {job_id=term_job_id})
  vim.api.nvim_set_current_win(source_window)
end

return { 'jpalardy/vim-slime', 
init = function()
    vim.g.slime_target = "neovim"
    vim.g.slime_no_mappings = true
end,
config =  function()
    vim.g.slime_input_pid = false
    vim.g.slime_suggest_default = true
    vim.g.slime_menu_config = false
    vim.g.slime_neovim_ignore_unlisted = false
    -- options not set here are g:slime_neovim_menu_order, g:slime_neovim_menu_delimiter, and g:slime_get_jobid
    -- see the documentation above to learn about those options

    -- called MotionSend but works with textobjects as well
    vim.keymap.set("n", "st", open_terminal, { desc = "Slime open terminal"})
    vim.keymap.set("n", "sz", "<Plug>SlimeMotionSend", { desc = "Slime send motion"})
    vim.keymap.set("n", "ss", "<Plug>SlimeLineSend", { desc = "Slime send line"})
    vim.keymap.set("x", "ss", "<Plug>SlimeRegionSend", { desc = "Slime send selection"})
    vim.keymap.set("n", "sc", "<Plug>SlimeConfig", { desc = "Slime config"})
end
}
