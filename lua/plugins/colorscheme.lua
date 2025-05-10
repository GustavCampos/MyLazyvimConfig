return {
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup()
    end,
  },
  { "rebelot/kanagawa.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "Mofiqul/dracula.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },

  -- Setting Plugin spec
  {
    "LazyVim/lazyVim",
    opts = {
      colorscheme = "catppuccin-latte",
    },
  },
}
