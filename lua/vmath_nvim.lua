local M = {}

-- vnoremap ++ <ESC> :Vmath<CR>
local function create_commands()
  vim.cmd("command! -bang -nargs=0 Vmath :lua require('vmath_nvim').calculate()")
end

local function bigger(a,b)
  return a < b
end

Show_sum = true
Show_average = true
Show_count = true
Show_lowest = true
Show_highest = true
Show_range = true
Show_median = true
Debug = false

function M.calculate()
  local start = vim.fn['reltime']()
  local numbers = {}
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local input = vim.api.nvim_buf_get_lines(0,start_pos[2]-1,end_pos[2],false)
  local input_str = table.concat(input)
  local i = 1
  for number in string.gmatch(input_str, "%d+%.?%d*") do
    numbers[i] = tonumber(number)
    i = i + 1
    -- print(number)
  end
  local sum = 0
  local count = 0
  table.sort(numbers, bigger)
  for _,number in ipairs(numbers) do
    sum = sum + number
    count = count + 1
  end
  local average = sum/count
  local median = 0
  if (count%2==1) then
    median = numbers[(count-1)/2+1]
  else
    median = (numbers[count/2]+numbers[count/2+1])/2
  end
  if Show_sum then
    print("Sum: " .. sum)
  end
  if Show_count then
    print("Count: " .. count)
  end
  if Show_average then
    print("Average: " .. average)
  end
  if Show_lowest then
    print("Lowest: " .. numbers[1])
  end
  if Show_highest then
    print("Highest: " .. numbers[#numbers])
  end
  if Show_range then
    print("Range: " .. (numbers[#numbers]-numbers[1]))
  end
  if Show_median then
    print("Median: " .. median)
  end
  if Debug then
    print("used time")
    vim.cmd(string.format([[%s %s]], 'echo', vim.fn['reltimestr'](vim.fn['reltime'](start))))
  end
end

function M.init()
  create_commands()
end

return M
