local M = {}

function M.toggle_line_numbers()
  vim.wo.number = not vim.wo.number
end

return M
