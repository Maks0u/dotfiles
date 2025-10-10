-- Noice.nvim configuration
-- GitHub: https://github.com/folke/noice.nvim
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    presets = {
      bottom_search = true,
      command_palette = true,
      lsp_doc_border = true,
    },

    cmdline = {
      view = "cmdline",
      format = {
        cmdline = { icon = " " },
        filter = { icon = " " },
        search_down = { icon = " " },
        search_up = { icon = " " },
      },
    },

    lsp = {
      hover = {
        opts = {
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
        },
      },
    },

    messages = {
      view = "mini",
    },

    -- Custom views for various UI components
    views = {
      cmdline = {
        position = {
          row = -1,
        },
      },
      -- Popupmenu view style and position
      -- popupmenu = {
      --   position = {
      --     row = -3,
      --     col = 0,
      --   },
      --   border = {
      --     style = "rounded",
      --     padding = { 0, 1 },
      --   },
      -- },
    },
  },
}
