local M = {}

local function run_python_script(script, text)
  -- Escape double quotes in text
  text = text:gsub('"', '\\"')
  local command = 'python3 -c "' .. script .. '" "' .. text .. '"'
  local process = assert(io.popen(command, 'r'))
  local output = process:read("*a")
  process:close()
  return output
end

local function get_visual_selection()
  local _, start_row, start_col, _ = unpack(vim.fn.getpos("'<"))
  local _, end_row, end_col, _ = unpack(vim.fn.getpos("'>"))

  if start_row > end_row or (start_row == end_row and start_col > end_col) then
    start_row, end_row = end_row, start_row
    start_col, end_col = end_col, start_col
  end

  local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, true)

  if #lines == 0 then
    return ''
  end

  lines[#lines] = string.sub(lines[#lines], 1, end_col)
  lines[1] = string.sub(lines[1], start_col)

  return table.concat(lines, '\n')
end
local function replace_visual_selection(replacement_text)
  -- Correctly determine the end column for multiline replacements
  local _, start_row, start_col, _ = unpack(vim.fn.getpos("'<"))
  local _, end_row, end_col, _ = unpack(vim.fn.getpos("'>"))

  if start_row > end_row or (start_row == end_row and start_col > end_col) then
    start_row, end_row = end_row, start_row
    start_col, end_col = end_col, start_col
  end

  local buffer = vim.fn.bufnr('%')

  -- Adjust for last column in visual block selection
  if start_row ~= end_row then
    end_col = -1
  end

  vim.api.nvim_buf_set_text(buffer, start_row - 1, start_col - 1, end_row - 1, end_col,
                            {replacement_text})
end

function M.encode()
  local text = get_visual_selection()
  local script =
    [[import sys, urllib.parse; print(urllib.parse.quote(sys.argv[1], safe=''), end='')]]
  local processed = run_python_script(script, text)
  replace_visual_selection(processed)
end

function M.decode()
  local text = get_visual_selection()
  local script = [[import sys, urllib.parse; print(urllib.parse.unquote(sys.argv[1]), end='')]]
  local processed = run_python_script(script, text)
  replace_visual_selection(processed)
end

return M
