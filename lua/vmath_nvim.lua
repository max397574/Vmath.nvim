local M = {}

-- vnoremap ++ <ESC> :Vmath<CR>
local function create_commands()
  vim.cmd("command! -bang -nargs=0 Vmath :lua require('vmath_nvim').calculate()")
end

local function bigger(a,b)
  return a < b
end

function M.calculate()
  local numbers = {}
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local input = vim.api.nvim_buf_get_lines(0,start_pos[2]-1,end_pos[2],false)
  local input_str = table.concat(input)
  for number in string.gmatch(input_str, "%d+%.?%d*") do
    table.insert(numbers,tonumber(number))
  end
  local sum = 0
  local count = 0
  table.sort(numbers, bigger)
  for index,number in pairs(numbers) do
    sum = sum + number
    count = count + 1
  end
  local average = sum/count
  print("Sum: " .. sum)
  print("Count: " .. count)
  print("Average: " .. average)
  print("Smallest: " .. numbers[1])
  print("Biggest: " .. numbers[#numbers])
  print("Range: " .. (numbers[#numbers]-numbers[1]))

end

function M.init()
  create_commands()
end

return M
