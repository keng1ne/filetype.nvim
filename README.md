# filetype.nvim
ftplugin in lua

```lua
local default_options = {
  textwidth = 120,
  shiftwidth = 2
}
require('filetype.nvim').setup(
{
  enable = true,
  config = {
    c = {
      textwidth = 120,
      shiftwidth = 2
    },
    lua = default_options
  }
})
```
