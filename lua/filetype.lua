local api = vim.api

local register = function(filetype, options)
  options = options or {}

  local option_text = ""
  for key, value in pairs(options) do
    local format
    if type(value) == "string" or type(value) == "boolean" then
      format = string.format("%s=%s", key, value)
    elseif type(value) == "number" then
      format = string.format("%s=%i", key, value)
    elseif type(value) == "function" then
      local t = value()
      if type(t) == "string" or type(t) == "boolean" then
        format = string.format("%s=%s", key, t)
      else if type(t) == "number" then
        format = string.format("%s=%i", key, t)
      end
    end
  else
    print("not supported")
  end
  option_text = option_text .. format .. " "
end

vim.cmd(string.format([[
autocmd FileType %s setlocal %s 
]], filetype, option_text))

end

--[[ 
local default_options = {
  textwidth = 120,
  shiftwidth = 2
}

{
  enable = true,
  config = {
    c = {
      textwidth = 120,
      shiftwidth = 2
    },
    lua = default_options
  }
}
--]]
local setup = function(setup_options)
  setup_options = setup_options or {}
  setup_options.enable = setup_options.enable or false 
  setup_options.config = setup_options.config or {}

  if setup_options.enable then
    for filetype, options in pairs(setup_options.config) do
      register(filetype, options)
    end
  end
end

return {
  register = register,
  setup = setup
}
