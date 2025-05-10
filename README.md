# My LazyVim 💤

A simple repo to save my setup configurations.

Using template of [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation).

## Colorscheme

This setup already comes with multiples custom themes, you can browse the availables ones using `<leader>+<u>+<C>`.

To set a default theme to be loaded on opening you need to modify the [colorscheme plugin](./lua/plugins/colorscheme.lua).

```lua
...
  -- Setting Plugin spec
  {
    "LazyVim/lazyVim",
    opts = {
      colorscheme = "<your color theme>",
    },
  },
...
```

## Aider console

I like to have a predefined aider console to use on work, if you want to use it its needed to create `lua/config/shared-vars.lua` file and put the following:

```lua
local M = {}

M.AIDER_API_KEY = "<provider>=<api-key>"
M.AIDER_MODEL = "<llm-model>"

return M
```
