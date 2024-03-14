local g               = vim.g   -- Global variables
local opt             = vim.opt -- Set options (global/buffer/windows-scoped)

opt.clipboard         = 'unnamed,unnamedplus'
opt.swapfile          = false    -- Don't use swapfile
opt.confirm           = false
opt.showmatch         = true     -- Highlight matching parenthesis
opt.foldmethod        = 'marker' -- Enable folding (default 'foldmarker')
opt.colorcolumn       = '80'     -- Line lenght marker at 80 columns
opt.linebreak         = true     -- Wrap on word boundary
opt.laststatus        = 3        -- Set global statusline
opt.smartindent       = true     -- Autoindent new lines
opt.hidden            = true     -- Enable background buffers
opt.history           = 100      -- Remember N lines in history
opt.lazyredraw        = false    -- Faster scrolling
opt.synmaxcol         = 240      -- Max column for syntax highlight
opt.fileencodings     = 'utf-8,gbk,gb2312,gb18030,chinese,latin1'
opt.wrap              = true

-----------------------------------------------------------
-- plugins
-----------------------------------------------------------
-- asyncrun
g.asyncrun_open       = 15
-- markdownpreview
g.mkdp_path_to_chrome = "google-chrome-stable"
-- xkb-switch
if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 or vim.fn.has("win16") == 1
--then if vim.fn.has("gui_running") == 1
then
  vim.cmd 'source $LOCALAPPDATA/nvim/plugin/xkb-switch.vim'
  --vim.cmd 'source $XDG_CONFIG_HOME/nvim/plugin/xkb-switch.vim'
  --	end
end

if vim.fn.has('wsl') == 1 then
  clip = '/mnt/c/windows/system32/clip.exe'
  vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('Yank', { clear = true }),
    callback = function()
      vim.fn.system(clip, vim.fn.getreg('"'))
    end,
  })
end
