local dap = require('dap')
local dapgo = require('dap-go')
local port = 8000

--java 
dap.adapters.java = {
	type = 'server',
	host = '127.0.0.1',
	port = port,
}

--dap.adapters.java = function(callback)
	--callback({
		--type = 'server',
		--host = '127.0.0.1',
		--port = 5005,
	--})
--end

dap.configurations.java = {
	{
		type = 'java',
		request = 'attach',
		name = 'Debug (attach) - remote',
		hostName  = '127.0.0.1',
		port = port,
	}
}
require('dap-go').setup {
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
  -- delve configurations
  delve = {
    -- the path to the executable dlv which will be used for debugging.
    -- by default, this is the "dlv" executable on your PATH.
    path = "dlv",
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port.
    -- if you set a port in your debug configuration, its value will be
    -- assigned dynamically.
    port = "${port}",
    -- additional args to pass to dlv
    args = {},
    -- the build flags that are passed to delve.
    -- defaults to empty string, but can be used to provide flags
    -- such as "-tags=unit" to make sure the test suite is
    -- compiled during debugging, for example.
    -- passing build flags using args is ineffective, as those are
    -- ignored by delve in dap mode.
    -- avaliable ui interactive function to prompt for arguments get_arguments
    build_flags = {},
    -- whether the dlv process to be created detached or not. there is
    -- an issue on Windows where this needs to be set to false
    -- otherwise the dlv server creation will fail.
    -- avaliable ui interactive function to prompt for build flags: get_build_flags
    detached = vim.fn.has("win32") == 0,
    -- the current working directory to run dlv from, if other than
    -- the current working directory.
    cwd = nil,
  },
  -- options related to running closest test
  tests = {
    -- enables verbosity when running the test.
    verbose = false,
  },
}
require('dapui').setup({
    layouts = {
        {
            elements = {
                { id = 'scopes', size = 0.25 }, -- Añade la sección de scopes
                { id = 'breakpoints', size = 0.25 },
                { id = 'stacks', size = 0.25 },
                { id = 'repl', size = 0.25 },
								{ id = 'watches', size = 0.25 },
            },
            size = 40,
            position = 'left',
					},{
						elements = {
								{ id = 'console', size = 1, open_on_run = true, theme = 'dark' },
						},
						position = 'bottom',
						size = 12
					}

    },
})


require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})


for _, language in ipairs({ "typescript" }) do
  require("dap").configurations[language] = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
		--runtimeExecutable = "ts-node",
		--args = { "-r", "dotenv/config", "${workspaceFolder}/src/index.ts"},
		runtimeExecutable  = "npm",
		args = { "run", "start:dev"},
		sourceMaps = true,
		skipFiles = { 'node_modules/**', 'dist/**' },
    cwd = "${workspaceFolder}",
		protocol = "inspector",
		console = "integratedTerminal",
		stopOnEntry = true,
		terminate = true,
  },
  {
    type = "pwa-node",
    request = "attach",
    name = "Attach",
    processId = require'dap.utils'.pick_process,
    cwd = "${workspaceFolder}/src",
  }
}

end


