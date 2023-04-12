
local config = {
  cmd = {
    "/Library/Java/JavaVirtualMachines/jdk-18.0.2.jdk/Contents/Home/bin/java",
	"-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-javaagent:/Users/renyongzhen/.local/share/nvim/lsp/jdt-language-server/lombok.jar",
    -- "-Xbootclasspath/a:/Users/renyongzhen/.local/share/nvim/lsp/jdt-language-server/lombok.jar",
    "-jar",
    "/Users/renyongzhen/.local/share/nvim/lsp/jdt-language-server/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
    "-configuration",
    "/Users/renyongzhen/.local/share/nvim/lsp/jdt-language-server/config_mac",
    "-data",
    "/Users/renyongzhen/.local/share/nvim/lsp/jdt-language-server/workspace/folder"
  },
  root_dir = require("jdtls.setup").find_root({".git", "mvnw", "gradlew"}),
  settings = {
    java = {}
  },
  init_options = {
    bundles = {
      vim.fn.glob("/Users/renyongzhen/.local/share/nvim/lsp/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1)
    }
  }
}

config['on_attach'] = function(client, bufnr)
  require('jdtls').setup_dap({ hotcodereplace = 'auto' })
end

require("jdtls").start_or_attach(config)



