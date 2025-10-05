-- Themes
return {
  {
    "zaldih/themery.nvim",
    opts = {
      livePreview = true,
      themes = {
        "catppuccin-latte",
        "tokyonight-day",
        "catppuccin-frappe",
        "catppuccin-macchiato",
        "catppuccin-mocha",
        "tokyonight-storm",
        "tokyonight-moon",
        "tokyonight-night",
      },
    },
  },
  {
    "catppuccin/nvim",
    priority = 1000,
    opts = {
      transparent_background = true,
    },
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
  },
}
