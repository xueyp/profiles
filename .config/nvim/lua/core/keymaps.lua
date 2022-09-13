-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Map Esc to kk
map('i', 'kk', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Toggle auto-indenting for code paste
map('n', '<F2>', ':set invpaste paste?<CR>')
vim.opt.pastetoggle = '<F2>'

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')
map('i', '<leader>s', '<C-c>:w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit
-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file

-- Tagbar
map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close
-- quickrun
--map('n', '<leader>rr', ':QuickRun<CR>',{noremap = true,silent = true})          -- open/Close
-- dap
map('n','<leader>db',"<cmd>lua require'dap'.toggle_breakpoint()<CR>")
map('n','<leader>dB',"<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<CR>")
map('n','<leader>dc',"<cmd>lua require'dap'.clear_breakpoints()<CR>")
map('n','<leader>du',"<cmd>lua require'dapui'.toggle()<CR>")
map('n','<leader>dh',"<cmd>lua require'dapui'.eval()<CR>")
map('n','<F5>',"<cmd>lua require'dap'.continue()<CR>")
map('n','<F6>',"<cmd>lua require'dap'.step_into()<CR>")
map('n','<F7>',"<cmd>lua require'dap'.step_over()<CR>")
map('n','<F8>',"<cmd>lua require'dap'.step_out()<CR>")
map('n','<F9>',"<cmd>lua require'dap'.run_last()<CR>")
map('n','<F10>',"<cmd>lua require'dap'.terminate()<CR>")
-- neoformat
map('n','<leader>cf','<cmd>Neoformat<CR>')
-- markdown preview
map('n','<leader>mps','<cmd>MarkdownPreview<CR>')
map('n','<leader>mpe','<cmd>MarkdownPreviewStop<CR>')
map('n','<leader>mpt','<cmd>MarkdownPreviewToggle<CR>')


