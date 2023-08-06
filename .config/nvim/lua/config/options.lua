
local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

opt.swapfile = false                  -- Don't use swapfile
opt.confirm  =  false
opt.showmatch = true        -- Highlight matching parenthesis
opt.foldmethod = 'marker'   -- Enable folding (default 'foldmarker')
opt.colorcolumn = '80'      -- Line lenght marker at 80 columns
opt.linebreak = true        -- Wrap on word boundary
opt.laststatus=3            -- Set global statusline
opt.smartindent = true      -- Autoindent new lines
opt.hidden = true           -- Enable background buffers
opt.history = 100           -- Remember N lines in history
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight

-----------------------------------------------------------
-- plugins
-----------------------------------------------------------
g.mkdp_path_to_chrome = "google-chrome-stable"
-- QuickRun
vim.cmd 'source $XDG_CONFIG_HOME/nvim/plugin/compileandrun.vim'
-- xkb-switch
if vim.fn.has("win32") == 1
	--then if vim.fn.has("gui_running") == 1
		then vim.cmd 'source $XDG_CONFIG_HOME/nvim/plugin/xkb-switch.vim'
	--	end
end



