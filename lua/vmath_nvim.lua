local M = {}

-- example: `vnoremap <leader>vm <ESC> :Vmath<CR>`
local function create_commands()
  vim.cmd("command! -bang -nargs=0 Vmath :lua require('vmath_nvim').calculate()")
end

---@param a number
---@param b number
---@return boolean
---Returns _true_ if a is higher than b
---Else it returns _false_
local function bigger(a,b)
  return a < b
end

---@param print_str string
---Prints `print_str` if condition is true
local function print_condition(condition,print_str)
  if condition then
    print(print_str)
  end
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
    print_condition(settings.debug,number)
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
  print_condition(settings.show_sum,"'S'um: " .. sum)
  print_condition(settings.show_count,"'C'ount: " .. count)
  print_condition(settings.show_average,"'A'verage: " .. average)
  print_condition(settings.show_lowest,"'L'owest: " .. numbers[1])
  print_condition(settings.show_highest,"'H'ighest: " .. numbers[#numbers])
  print_condition(settings.show_range,"'R'ange: " .. (numbers[#numbers]-numbers[1]))
  print_condition(settings.show_median,"'M'edian: " .. median)
  if settings.debug then
    print("used time")
    vim.cmd(string.format([[%s %s]], 'echo', vim.fn['reltimestr'](vim.fn['reltime'](start))))
  end
  if settings.registers then
    vim.fn.setreg("s",tostring(sum))
    vim.fn.setreg("c",tostring(count))
    vim.fn.setreg("a",tostring(average))
    vim.fn.setreg("l",tostring(numbers[1]))
    vim.fn.setreg("h",tostring(numbers[#numbers]))
    vim.fn.setreg("r",tostring(numbers[#numbers]-numbers[1]))
    vim.fn.setreg("m",tostring(median))
  end
end

function M.init()
  create_commands()
end

return M
