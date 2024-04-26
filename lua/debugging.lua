-- fetch the dap plugin
local dap = require('dap')

-- set up DapUI
local dapui = require('dapui')
dapui.setup()

-- Dap files events Before and After, Triggered when the dap adapter is started
dap.listeners.before.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.after.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

-- Set up the dap adapter for golang
-- Make sure delve is installed
-- $ go install github.com/go-delve/delve/cmd/dlv@latest
dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {command = 'dlv', args = {'dap', '-l', '127.0.0.1:${port}'}}
}

-- TODO: configure completion to trigger automatically:
-- au FileType dap-repl lua require('dap.ext.autocompl').attach()

dap.configurations.go = {
  {
    -- debug the current file
    type = 'delve',
    name = 'Debug',
    request = 'launch',
    program = '${file}',
    -- after chosen the configuration, open repl
    repl = {history = true, variables = true, evaluate = true}
  },
  {
    -- debug the test file
    type = 'delve',
    name = 'Debug test',
    request = 'launch',
    mode = 'test',
    program = '${file}'
  },
  {
    -- debug with go.mod packages and sub packages
    type = 'delve',
    name = 'Debug package (go.mod)',
    request = 'launch',
    mode = 'test',
    program = './${relativeFileDirname}'
  }
}
