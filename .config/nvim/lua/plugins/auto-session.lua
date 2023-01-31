local status_ok, as = pcall(require, 'auto-session')
if not status_ok then
  return
end

local function restore_nvim_tree()
    local nvim_tree = require('nvim-tree')
    nvim_tree.change_dir(vim.fn.getcwd())
    nvim_tree.refresh()
end

as.setup({
  log_level = 'error',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  auto_session_suppress_dirs = { "~/", "~/projects", "~/Downloads", "/"},
  auto_session_enabled = true,
  auto_save_enabled = nil,
  auto_restore_enabled = nil,
  auto_session_suppress_dirs = nil,
  auto_session_use_git_branch = nil,
  bypass_session_save_file_types = nil,
  postrestore_cmds = {"{vim_cmd_1}", restore_nvim_tree, "{vim_cmd_2}"},
})
