local api = require("utils.api")

local options = {}

options.platform_info = vim.bo.fileformat:upper()
options.transparency_background = false
options.python_interpreter_path = "/home/x/venvs/quant/bin/python3"
options.code_snippet_directory = api.path.join(vim.fn.stdpath("config"), "snippets")
options.nvim_lint_dir = api.path.join(vim.fn.stdpath("config"), "lint")
options.icons = "kind"

options.database_config = {
    {
        name = "mysql",
        url = "mysql://x@192.168.56.3/testdb"
    }

}


return options
