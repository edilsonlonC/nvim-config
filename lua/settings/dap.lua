local dap = require('dap')
local dapgo = require('dap-go')
local port = 8000
local mason_registry = require("mason-registry")

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

local js_debug_path = mason_registry.get_package("js-debug-adapter"):get_install_path()
local complete_js_debug_path = js_debug_path .. "/js-debug/src/dapDebugServer.js"
require("dap").adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    -- 💀 Make sure to update this path to point to your installation
		args = { complete_js_debug_path,  "${port}" },
  }
}
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
		port = '${port}',
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


