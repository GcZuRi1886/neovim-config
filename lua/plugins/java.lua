return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" }, -- load only for Java files
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local jdtls = require("jdtls")

      -- project root detection
      local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
      local root_dir = require("jdtls.setup").find_root(root_markers)
      if root_dir == "" then
        return
      end

      -- workspace directory
      local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

      -- mason paths
      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
      local launcher = vim.fn.glob(mason_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
      local config_os = "config_linux" -- change to config_mac / config_win if needed

      -- debug/test bundles
      local bundles = {
        vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", 1),
      }
      vim.list_extend(bundles, vim.split(vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/java-test/extension/server/*.jar", 1), "\n"))

      local config = {
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-Xmx1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens", "java.base/java.util=ALL-UNNAMED",
          "--add-opens", "java.base/java.lang=ALL-UNNAMED",
          "-jar", launcher,
          "-configuration", mason_path .. "/" .. config_os,
          "-data", workspace_dir,
        },
        root_dir = root_dir,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        init_options = {
          bundles = bundles,
        },
      }

      -- start or attach jdtls
      jdtls.start_or_attach(config)

      -- debugging setup
      require("jdtls.dap").setup_dap_main_class_configs()

      -- keymaps
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader>dt", jdtls.test_nearest_method, opts)
      vim.keymap.set("n", "<leader>dT", jdtls.test_class, opts)
      vim.keymap.set("n", "<leader>dr", require("jdtls.dap").setup_dap_main_class_configs, opts)
    end,
  },
}

