local mapping = require("core.mapping")

require('code_runner').setup {
	term = {
		position = "belowright",
		size = 8,
		mode = "startinsert"
	},
    filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "/home/x/venvs/quant/bin/python",
		typescript = "deno run",
		rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
        r = "Rscript $fileName"
	}
}