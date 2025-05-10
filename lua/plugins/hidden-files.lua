return {
  { -- For file explorer
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true,
        ignored = true,
      },
    },
  },
  { -- For file finder
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true,
        },
        live_grep = {
          hidden = true,
        },
      },
    },
  },
}
