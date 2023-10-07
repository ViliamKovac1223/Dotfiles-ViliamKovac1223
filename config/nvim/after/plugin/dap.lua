-- Documentation:
-- https://github.com/mfussenegger/nvim-dap
-- Available addapters: https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
-- Installation and configuration: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
-- 
-- local port = '9090';
local dap = require('dap')

-- Java config (doesn't work ;) )
dap.adapters.java = {
    type = 'executable',
    command = 'java',
    -- args = {'your-debug-adapter-jar-file.jar'},
    args = {
        -- '-jar',
        -- '/home/sorig/Downloads/java-debug-0.45.0/com.microsoft.java.debug.repository/target/repository/plugins/com.microsoft.java.debug.plugin_0.45.0.jar'
        -- '/home/sorig/Downloads/java-debug-0.45.0/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.45.0.jar'
        '/home/sorig/Documents/java/save/tuke/kp/my-java-hello/App.java'
    },
}

-- python config
dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    cb({
      type = 'executable',
      -- command = 'path/to/virtualenvs/debugpy/bin/python',
      command = 'python',
      args = { '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    })
  end
end

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

-- cpp config (vscode cpptools)
-- dap.adapters.cppdbg = {
--     id = 'cppdbg',
--     type = 'executable',
--     command = '/home/sorig/.local/share/nvim-dap/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
-- }
--
-- dap.configurations.cpp = {
--   {
--     name = "Launch file",
--     type = "cppdbg",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopAtEntry = true,
--     setupCommands = {
--         {
--             text = '-enable-pretty-printing',
--             description =  'enable pretty printing',
--             ignoreFailures = false
--         },
--     },
--
--   },
--   {
--     name = 'Attach to gdbserver :1234',
--     type = 'cppdbg',
--     request = 'launch',
--     MIMode = 'gdb',
--     miDebuggerServerAddress = 'localhost:1234',
--     miDebuggerPath = '/usr/bin/gdb',
--     cwd = '${workspaceFolder}',
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     setupCommands = {
--         {
--             text = '-enable-pretty-printing',
--             description =  'enable pretty printing',
--             ignoreFailures = false
--         },
--     },
--
--   },
-- }

-- Cpp config (lldb-vscode)
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode-14', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
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
    -- runInTerminal = false,
  },
}

-- If you want to use this for Rust and C, add something like this:
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- Rust config (lldb-vscode)
dap.configurations.rust = {
  {
    -- Cpp config
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- Rust specific config
    initCommands = function()
      -- Find out where to look for the pretty printer Python module
      local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))

      local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
      local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'

      local commands = {}
      local file = io.open(commands_file, 'r')
      if file then
        for line in file:lines() do
          table.insert(commands, line)
        end
        file:close()
      end
      table.insert(commands, 1, script_import)

      return commands
    end,
  }
}


vim.keymap.set('n', '<F5>', ':lua require"dap".continue()<CR>', { desc = "Continue debug session" }) -- also start new debugging session
vim.keymap.set('n', '<F8>', ':lua require"dap".step_over()<CR>', { desc = "Debug step over" })
vim.keymap.set('n', '<F7>', ':lua require"dap".step_into()<CR>', { desc = "Debug step into" })
vim.keymap.set('n', '<F6>', ':lua require"dap".step_out()<CR>', { desc = "Debug step out" })

vim.keymap.set('n', '<leader>B', ':lua require"dap".toggle_breakpoint()<CR>', { desc = 'Toggle breakpoint' })
-- vim.keymap.set('n', '<leader>B', ':lua require"dap".set_breakpoint()<CR>')

-- Load configuraiton from launch.json
require('dap.ext.vscode').load_launchjs(nil, {})
