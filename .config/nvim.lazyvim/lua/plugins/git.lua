-- Git related plugins
return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      attach_to_untracked = true,
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 300,
      },
    },
  },
}
