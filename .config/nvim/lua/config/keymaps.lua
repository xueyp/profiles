-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end


-- Tagbar
map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close
-- markdown preview
map('n','<leader>mps','<cmd>MarkdownPreview<CR>')
map('n','<leader>mpe','<cmd>MarkdownPreviewStop<CR>')
map('n','<leader>mpt','<cmd>MarkdownPreviewToggle<CR>')
-- buffers jump
map('n','<leader>B',':buffers<CR>:buffer<Space>')

