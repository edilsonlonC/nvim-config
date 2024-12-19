local jdtls_ok, jdtls = pcall(require, 'jdtls')
if not jdtls_ok then
  vim.notify("jdtls not found", vim.log.levels.ERROR)
  return
end

local jdtls_path = vim.fn.stdpath('data') .. '/mason/packages/jdtls' 
local path_to_config = jdtls_path .. '/config_mac'
local path_to_plugins = jdtls_path .. '/plugins'
local path_to_jar = path_to_plugins .. '/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar'
local root_markers = {'build.gradle', 'settings.gradle', 'gradlew', 'pom.xml' }
local root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew"})

if root_dir == "" then
  return
end
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name
local home = os.getenv("HOME")
local lombok_path = home .. '/.m2/repository/org/projectlombok/lombok/1.18.34/lombok-1.18.34.jar'
local bundles = {
	vim.fn.glob('/Users/edilson.londono/.m2/repository/com/microsoft/java/com.microsoft.java.debug.plugin/0.53.1/com.microsoft.java.debug.plugin-*.jar')
}

local config = {
  cmd = {
    '/Users/edilson.londono/Library/Java/JavaVirtualMachines/corretto-21.0.5/Contents/Home/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '-javaagent:/Users/edilson.londono/Projects/lombok.jar',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 
		'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 
		'java.base/java.lang=ALL-UNNAMED',
    '-jar', path_to_jar,
    '-configuration', path_to_config,
    '-data', workspace_dir,
  },

	root_dir = root_dir,

  settings = {
    java = {
			eclipse = {
				downloadSources = true,
			},
			maven = {
				downloadSources = true,
				updateSnapshots = true,
			},
completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*"
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*", "sun.*",
        },
      },
      -- Specify any options for organizing imports
      sources = {
        organizeImports = {
          starThreshold = 9999;
          staticStarThreshold = 9999;
        },
      },
      -- How code generation should act
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },
      configuration = {
				updateBuildConfiguration = 'interactive',
        runtimes = {
          {
            name = "JavaSE-21",
            path = "/Users/edilson.londono/Library/Java/JavaVirtualMachines/corretto-21.0.5/Contents/Home",
            default = true,
          },
        },
      },
    },
  },
	init_options = {
		bundles = bundles,
	},
	--on_attach = function(client, bufnr)
	---- Regular Neovim LSP client keymappings
	--local bufopts = { noremap=true, silent=true, buffer=bufnr }
	--nnoremap('gD', vim.lsp.buf.declaration, bufopts, "Go to declaration")
	--nnoremap('gd', vim.lsp.buf.definition, bufopts, "Go to definition")
	--nnoremap('gi', vim.lsp.buf.implementation, bufopts, "Go to implementation")
	--nnoremap('K', vim.lsp.buf.hover, bufopts, "Hover text")
	--nnoremap('<C-k>', vim.lsp.buf.signature_help, bufopts, "Show signature")
	--nnoremap('<space>wa', vim.lsp.buf.add_workspace_folder, bufopts, "Add workspace folder")
	--nnoremap('<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
	--nnoremap('<space>wl', function()
		--print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	--end, bufopts, "List workspace folders")
	--nnoremap('<space>D', vim.lsp.buf.type_definition, bufopts, "Go to type definition")
	--nnoremap('<space>rn', vim.lsp.buf.rename, bufopts, "Rename")
	--nnoremap('<space>ca', vim.lsp.buf.code_action, bufopts, "Code actions")
	--vim.keymap.set('v', "<space>ca", "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
		--{ noremap=true, silent=true, buffer=bufnr, desc = "Code actions" })
	--nnoremap('<space>f', function() vim.lsp.buf.format { async = true } end, bufopts, "Format file")

	---- Java extensions provided by jdtls
	--nnoremap("<C-o>", jdtls.organize_imports, bufopts, "Organize imports")
	--nnoremap("<space>ev", jdtls.extract_variable, bufopts, "Extract variable")
	--nnoremap("<space>ec", jdtls.extract_constant, bufopts, "Extract constant")
	--vim.keymap.set('v', "<space>em", [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
		--{ noremap=true, silent=true, buffer=bufnr, desc = "Extract method" })
--end


  -- Función on_attach
  --on_attach = function(client, bufnr)
    --require'keymaps'.map_java_keys(bufnr)
    --require "lsp_signature".on_attach({
      --bind = true, -- Esto es obligatorio, de lo contrario la configuración del borde no se registrará
      --floating_window_above_cur_line = false,
      --padding = '',
      --handler_opts = {
        --border = "rounded",
      --},
    --}, bufnr)
  --end,
}


config['on_attach'] = function(client, bufnr)
  -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
  -- you make during a debug session immediately.
  -- Remove the option if you do not want that.
  require('jdtls').setup_dap({ hotcodereplace = 'auto' })
end
--require('dap.ext.vscode').load_launchjs()

-- Ahora intentamos iniciar o adjuntar el servidor
--require('jdtls.setup').add_commands()
require('jdtls').start_or_attach(config)

