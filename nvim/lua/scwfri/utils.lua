local M = {}

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

function M.t(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function M.mapper(opts)
  -- return function with default opts to map keybindings
  -- opts default to noremap if opts=nil
  opts = opts or {noremap = true}
  local map = function(mode, map, cmd)
    vim.api.nvim_set_keymap(mode, map, cmd, opts)
  end
  return map
end

function M.source_dir(dir)
  -- inspiration: https://github.com/tjdevries/astronauta.nvim/blob/master/lua/astronauta/plugin.lua
  local source_path = string.format("%s/**/*.lua", dir)
  for _, mod in ipairs(vim.api.nvim_get_runtime_file(source_path, true)) do
    local ok, msg = pcall(loadfile(mod))
    if not ok then
      print("Failed to load: ", mod)
      print("\t", msg)
    end
  end
end

return M
