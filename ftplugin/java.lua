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
    '-javaagent:/Users/edilson.londono/.m2/repository/org/projectlombok/lombok/1.18.36/lombok-1.18.36.jar',
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
			format = {
				settings = {
					url = '/Users/edilson.londono/Projects/eclipse-java-google-style.xml',
					profile = 'GoogleStyle',
			}
		},
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
	}	
}



vim.cmd [[autocmd BufWritePre *.java lua vim.lsp.buf.format()]]

config['on_attach'] = function(client, bufnr)
  
  require('jdtls').setup_dap({ hotcodereplace = 'auto' })
end

-- Ahora intentamos iniciar o adjuntar el servidor
--require('jdtls.setup').add_commands()
require('jdtls').start_or_attach(config)



