local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

g.clipboard = "osc52"

opt.clipboard = "unnamed,unnamedplus"
opt.swapfile = false -- Don't use swapfile
opt.confirm = false
opt.showmatch = true -- Highlight matching parenthesis
opt.foldmethod = "marker" -- Enable folding (default 'foldmarker')
opt.colorcolumn = "80" -- Line lenght marker at 80 columns
opt.linebreak = true -- Wrap on word boundary
opt.laststatus = 3 -- Set global statusline
opt.smartindent = true -- Autoindent new lines
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.lazyredraw = false -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.fileencodings = "utf-8,gbk,gb2312,gb18030,chinese,latin1"
opt.wrap = true

-----------------------------------------------------------
-- plugins
-----------------------------------------------------------
-- asyncrun
g.asyncrun_open = 15

if vim.fn.has("wsl") == 1 then
  clip = "/mnt/c/windows/system32/clip.exe"
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("Yank", { clear = true }),
    callback = function()
      vim.fn.system(clip, vim.fn.getreg('"'))
    end,
  })
end

-- vim-dadbod
vim.g.dbs = {
  { name = "pg-183", url = "postgres://postgres:111111qQ@192.168.12.183/postgres" },
  { name = "staging", url = "Replace with your database connection URL." },
}
