-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ToggleTerm Keybinds
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Extends toggleterm terminal class
local Terminal = require("toggleterm.terminal").Terminal
local verticalSize = 80

-- Default opening keyset
local wk = require("which-key")
wk.add({
  {
    mode = { "n" },
    { "<leader>t", group = "ToggleTerm" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Horizontal mode" },
    { "<leader>tv", "<cmd>ToggleTerm size=" .. verticalSize .. " direction=vertical<CR>", desc = "Vertical mode" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", desc = "Float mode" },
  },
})

-- Multiple terms (by id)
-- Cache of terminals to guarantee direction response
local term_cache = {}
for i = 1, 99 do
  term_cache[i] = {} -- Initializing terminal

  vim.keymap.set("n", i .. "th", function()
    if not term_cache[i]["h"] then
      term_cache[i]["h"] = Terminal:new({
        id = i * 2,
        count = i * 2,
        direction = "horizontal",
      })
    end
    term_cache[i]["h"]:toggle()
  end)

  vim.keymap.set("n", i .. "tv", function()
    if not term_cache[i]["v"] then
      term_cache[i]["v"] = Terminal:new({
        id = (i * 2) + 1,
        count = (i * 2) + 1,
        direction = "vertical",
      })
    end
    term_cache[i]["v"]:toggle(verticalSize)
  end)
end

-- Aider Terminal
local VARS = require("config.shared-vars")
local aiderCommand = "aider --model " .. VARS.AIDER_MODEL .. " --api-key " .. VARS.AIDER_API_KEY
vim.keymap.set("n", "<leader>ta", function()
  Terminal:new({
    id = 999,
    direction = "vertical",
    cmd = aiderCommand,
  }):toggle(verticalSize)
end, { desc = "Use Aider CLI" })
