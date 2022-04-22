local options = require("core.options")

return {
    adapters = {
        type = "executable",
        command = options.lldb_vscode_path,
        name = "lldb"
    },
    configurations = {
        {
            name = "Launch file",
            type = "lldb",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
        
                -- 💀
                -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
                --
                --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
                --
                -- Otherwise you might get the following error:
                --
                --    Error on launch: Failed to attach to the target process
                --
                -- But you should be aware of the implications:
                -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
        
                runInTerminal = true,
        
                -- 💀
                -- If you use `runInTerminal = true` and resize the terminal window,
                -- lldb-vscode will receive a `SIGWINCH` signal which can cause problems
                -- To avoid that uncomment the following option
                -- See https://github.com/mfussenegger/nvim-dap/issues/236#issuecomment-1066306073
                postRunCommands = {'process handle -p true -s false -n false SIGWINCH'}
            },
               
        }
   
}