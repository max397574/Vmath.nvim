local M = {}

-- vnoremap ++ <ESC> :Vmath<CR>
local function create_commands()
  vim.cmd("command! -bang -nargs=0 Vmath :lua require('vmath_nvim').calculate()")
end

local function bigger(a,b)
  return a < b
end

local settings = {}

settings.show_sum = true
settings.show_average = true
settings.show_count = true
settings.show_lowest = true
settings.show_highest = true
settings.show_range = true
settings.show_median = true
settings.debug = false
settings.registers = true

function M.setup(update)
  settings = setmetatable(update, { __index = settings })
end

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
  if settings.show_sum then
    print("'S'um: " .. sum)
  end
  if settings.show_count then
    print("'C'ount: " .. count)
  end
  if settings.show_average then
    print("'A'verage: " .. average)
  end
  if settings.show_lowest then
    print("'L'owest: " .. numbers[1])
  end
  if settings.show_highest then
    print("'H'ighest: " .. numbers[#numbers])
  end
  if settings.show_range then
    print("'R'ange: " .. (numbers[#numbers]-numbers[1]))
  end
  if settings.show_median then
    print("'M'edian: " .. median)
  end
  if settings.debug then
    print("used time")
    vim.cmd(string.format([[%s %s]], 'echo', vim.fn['reltimestr'](vim.fn['reltime'](start))))
  end
  if settings.registers then
    vim.fn.setreg("s",sum)
    vim.fn.setreg("c",count)
    vim.fn.setreg("a",average)
    vim.fn.setreg("l",numbers[1])
    vim.fn.setreg("h",numbers[#numbers])
    vim.fn.setreg("r",numbers[#numbers]-numbers[1])
    vim.fn.setreg("m",median)
  end
end

function M.init()
  create_commands()
end

return M
