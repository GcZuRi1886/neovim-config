return {
        "mason-org/mason-lspconfig.nvim",
        opts = {
          ensure_installed = {
            "marksman", -- markdown
            "yamlls", -- yaml
            "jsonls", -- json
            "lua_ls", -- lua
            "bashls", -- bash
            "pylint", -- python linter
            "pyright", -- python lsp
            "ruff", -- python linter/formatter
            "dockerls", -- docker
            "docker_compose_language_service", -- docker-compose
            "gitlab_ci_ls", -- gitlab ci
            "vimls", -- vim script
            "jdtls", -- java lsp
          },
          automatic_installation = true,
        },
        dependencies = {
        {
          "mason-org/mason.nvim",
          opts = { 
            ensure_installed = {
              "markdownlint-cli2",
              "markdown-toc",
              "marksman",
              "gitlab_ci_ls",
              "docker_compose_language_service",
              "dockerls",
              "yamlls",
              "vimls",
              "lua_ls",
              "jsonls",
              "bashls",
              "pylint",
              "pyright",
              "ruff",
              "java-debug-adapter",
              "java-test"
          },
          automatic_installation = true
      },
    },
        "neovim/nvim-lspconfig"
    },
}
