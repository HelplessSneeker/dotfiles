return {
  -- Python LSP Configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
            },
          },
        },
      },
    },
  },

  -- Ensure Python tools are installed
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright", -- LSP server
        "ruff", -- Fast linter
        "black", -- Formatter
        "debugpy", -- Debugger
      },
    },
  },
}
