local jdtls_ok, jdtls = pcall(require, 'jdtls')
if not jdtls_ok then
  vim.notify("jdtls not found", vim.log.levels.ERROR)
  return
end

local jdtls_path = vim.fn.stdpath('data') .. '/mason/packages/jdtls' 
local path_to_config = jdtls_path .. '/config_linux'
local path_to_plugins = jdtls_path .. '/plugins'
local path_to_jar = path_to_plugins .. '/org.eclipse.equinox.launcher.jar'
local root_markers = {'build.gradle', 'settings.gradle', 'gradlew', 'pom.xml' }
local root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew"})
if root_dir == "" then
  return
end
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name
local home = os.getenv("HOME")
local lombok_path = home .. '/.m2/repository/org/projectlombok/lombok/1.18.34/lombok-1.18.34.jar'

local bundles = {}
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "packages/java-test/extension/server/*.jar"), "\n"))
vim.list_extend(
  bundles,
  vim.split(
    vim.fn.glob(mason_path .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
    "\n"
  )
)

local config = {
  cmd = {
    '/usr/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '-javaagent:/home/eddylson/.config/lombok/lombok.jar',--add-modules=ALL-SYSTEM',
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
            path = "/usr/lib/jvm/java-21-openjdk-amd64",
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



--vim.cmd [[autocmd BufWritePre *.java lua vim.lsp.buf.format()]]

-- Cierra automáticamente la ventana quickfix si se abre después de guardar
--vim.api.nvim_create_autocmd("BufWritePost", {
  --callback = function()
    --for _, win in ipairs(vim.fn.getwininfo()) do
      --if win.quickfix == 1 then
        --vim.cmd("cclose")
        --return
      --end
    --end
  --end,
--})



-- Cierra la quickfix si se abre después de guardar un archivo Java
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    local buftype = vim.api.nvim_buf_get_option(0, "buftype")
    if buftype == "quickfix" then
      -- Espera unos milisegundos para evitar conflictos y la cierra
      vim.defer_fn(function()
        vim.cmd("cclose")
      end, 100)
    end
  end
})


-- En ftplugin/java.lua

config['on_attach'] = function(client, bufnr) 
  require('jdtls').setup_dap({ hotcodereplace = 'auto' })
end
-- start server jdls
require('jdtls').start_or_attach(config)



