
-- see https://github.com/telemachus/dotfiles/blob/main/config/nvim/lua/bitly.lua
-- for example of plugin that changes visual selection

local datemod = function()
  if vim.fn.mode() ~= "v" then
    return
  end

  local start_pos = vim.fn.getpos("v")
  local end_pos = vim.fn.getpos(".")
  local selection = vim.fn.getregion(start_pos, end_pos)

  -- local output = vim.fn.system { 'echo', 'hi' }


  local command = "ruby ~/.local/share/nvim/datemod/datemod.rb " .. "'" .. selection[1] .. "'"
  -- print(command)

  local fp = io.popen(command, "r")
  local output = fp:read("*a")
  fp:close()

  -- print(vim.inspect(fp))
  -- print("output:")
  -- print(vim.inspect(output))

  local newdate = output:gsub("%s+", "")
  -- print("newdate:")
  -- print(vim.inspect(newdate))


  vim.api.nvim_buf_set_text(
    start_pos[1],
    start_pos[2] - 1,
    start_pos[3] - 1,
    end_pos[2] - 1,
    end_pos[3],
    { newdate }
  )


  -- #-------------------------------

    -- if _should_swap(start_pos, end_pos) then
    --     start_pos, end_pos = end_pos, start_pos
    -- end
    --
    -- local strings = getregion(start_pos, end_pos)
    -- if #strings < 1 then
    --     return
    -- end
    -- local url = _bitly_cmd(strings[1])
    -- if url == "" then
    --     return
    -- end
    --
    -- -- buf_set_text takes six arguments.
    -- --     1. A buffer number
    -- --     2. The starting row (i.e., line)
    -- --     3. The starting column
    -- --     4. The ending row
    -- --     5. The ending column
    -- --     6. A list of strings to insert
    -- --
    -- --     Row and column indices start from zero, so we need to subtract
    -- --     one from the results of getpos. End indices for rows are inclusive,
    -- --     but end indices for columns are exclusive. Hence, we don't adjust
    -- --     the fifth argument.
    -- buf_set_text(
    --     start_pos[1],
    --     start_pos[2] - 1,
    --     start_pos[3] - 1,
    --     end_pos[2] - 1,
    --     end_pos[3],
    --     { url }
    -- )
    -- feedkeys(replace_termcodes("<Esc>", true, false, true), "x", false)
end

return {
  datemod = datemod,
}
