-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- register Rscript file
autocmd({'BufRead','BufNewFile'}, {
  pattern = '*.R',
  command = "set filetype=R"
})
autocmd({'BufRead','BufNewFile'}, {
  pattern = '*.jl',
  command = "set filetype=julia"
})

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '*',
  command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '*',
  command = 'set fo-=c fo-=r fo-=o'
})

-- Settings for filetypes:
-- Disable line length marker
augroup('setLineLength', { clear = true })
autocmd('Filetype', {
  group = 'setLineLength',
  pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescript' },
  command = 'setlocal cc=0'
})

-- Set indentation to 2 spaces
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
    'yaml', 'lua'
  },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

-- Terminal settings:
-- Open a Terminal on the right tab
autocmd('CmdlineEnter', {
  command = 'command! Term :botright vsplit term://$SHELL'
})

-- Enter insert mode when switching to terminal
autocmd('TermOpen', {
  command = 'setlocal listchars= nonumber norelativenumber nocursorline',
})

autocmd('TermOpen', {
  pattern = '*',
  command = 'startinsert'
})

-- Close terminal buffer on process exit
autocmd('BufLeave', {
  pattern = 'term://*',
  command = 'stopinsert'
})

-- AsyncRun Code File
function AsyncRunFile(event)
  if vim.bo[event.buf].filetype == 'python' then
    return "AsyncRun! time /home/x/venvs/DataAnalytics/bin/python3 %"
  end
  if vim.bo[event.buf].filetype == 'lua' then
    return "AsyncRun! time lua %"
  end
  if vim.bo[event.buf].filetype == 'julia' then
    return "AsyncRun! time julia %"
  end
  if vim.bo[event.buf].filetype == 'c' then
    return "AsyncRun! gcc % -o %<; time ./%<"
  end
  if vim.bo[event.buf].filetype == 'cpp' then
    return "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
  end
  if vim.bo[event.buf].filetype == 'java' then
    return "AsyncRun! javac %; time java %<"
  end
  if vim.bo[event.buf].filetype == 'sh' then
    return "AsyncRun! time bash %"
  end
  if vim.bo[event.buf].filetype == 'R' then
    return "AsyncRun! time Rscript %"
  end
  if vim.bo[event.buf].filetype == 'go' then
    return "AsyncRun! time go run %"
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "lua","julia","c", "cpp", "sh", "R", "go", "java" },
  callback = function(event)
    vim.keymap.set('n', '<leader>rr', "<cmd>w|" .. AsyncRunFile(event) .. "<cr><cmd>copen<cr>",
      { buffer = event.buf ,desc = "AsyncRunFile"})
  end
})
