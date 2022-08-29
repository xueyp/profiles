-- https://github.com/akinsho/bufferline.nvim

local icons = require("utils.icons")

-- file types not shown in bufferline
local filter_bufname = {
    "translate",
    "repl",
    "query",
    "dev",
    "dbout"
}

require("bufferline").setup(
    {})
