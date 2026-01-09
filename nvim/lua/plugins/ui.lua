return {
  -- Colorscheme
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      contrast = "hard",
    },
  },

  -- Configure LazyVim to use gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- Telescope configuration (simplified to avoid conflicts)
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- Lualine uses default LazyVim configuration

  -- Trouble (diagnostics)
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },
}
