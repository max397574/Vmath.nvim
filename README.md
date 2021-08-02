# 🧮Vmath.nvim

A lua version of Damian Conway's [vmath](https://www.youtube.com/watch?v=aHm36-na4-4&t=1740s).

✨Features
--------

* Calculate mathematical figures of visual selection
    * Amount of numbers
    * Sum
    * Average
    * Highest
    * Lowest
    * Range
    * Median
* Automatic recognition of numbers
* Option to set registers to number
* Fast
<details>
    <summary>Speed Reference</summary>
        213,123,42152,324.234,2352.123,234.2123,523,235.4684.345,745.36,1247.45,25.213,422352613,1352.125,3,
        42152,324.234,2352.123,234.2123,523,235.4684.345,745.36,1247.45,25.213,422352613,1352.125213,123,
        42152,324.234,2352.123,234.2123,523,235.4684.345,745.36,1247.45,25.213,422352613,1352.125213,123,
        42152,324.234,2352.123,234.2123,523,235.4684.345,745.36,1247.45,25.213,422352613,1352.125213,123,
        42152,324.234,2352.123,234.2123,523,235.4684.345,745.36,1247.45,25.213,422352613,1352.125213,123,
        42152,324.234,2352.123,234.2123,523,235.4684.345,745.36,1247.45,25.213,422352613,1352.125213,123,
        42152,324.234,2352.123,234.2123,523,235.4684.345,745.36,1247.45,25.213,422352613,1352.125213,123,
        42152,324.234,2352.123,234.2123,523,235.4684.345,745.36,1247.45,25.213,422352613,1352.125213,123,
        42152,324.234,2352.123,234.2123,523,235.4684.345,745.36,1247.45,25.213,422352613,1352.125213,123,
        42152,324.234,2352.123,234.2123,523,235.4684.345,745.36,1247.45,25.213,422352613,1352.125213,123,
        42152,324.234,2352.123,234.2123,523,235.4684.345,745.36,1247.45,25.213,422352613,1352.125

        * Sum: 4646425087.0446
        * Count: 144
        * Average: 32266840.882254
        * Smallest: 3
        * Biggest: 422352613
        * Range: 422352610

    takes 0.000806s to calculate

</details>

📦Installation
------------
Use your favourite package manager. Example with [vim-plug](https://github.com/junegunn/vim-plug).
```
Plug 'max397574/vmath.nvim'
```

✅Usage
-----
Remap the command in visual mode.
`vnoremap <your mapping> <ESC>:Vmath<CR>`

Example:
`vnoremap <leader>vm <ESC>:Vmath<CR>`

⚙️Customization
-------------
You can customize with the following lines in a vim configuration. These are the default settings.
```lua
lua << EOF
require('vmath_nvim').setup{
  -- show these numbers
  show_sum = true,
  show_average = true,
  show_count = true,
  show_lowest = true,
  show_highest = true,
  show_range = true,
  show_median = true,
  -- show debug info (execution time and values)
  debug = false,
  -- save values in registers surrounded with ''
  -- example: 'A'verage gets saved in register a
  registers = true,
}
EOF
```
And this in a lua configuration:
```lua
require('vmath_nvim').setup{
  -- show these numbers
  show_sum = true,
  show_average = true,
  show_count = true,
  show_lowest = true,
  show_highest = true,
  show_range = true,
  show_median = true,
  -- show debug info (execution time and values)
  debug = false,
  -- save values in registers surrounded with ''
  -- example: 'A'verage gets saved in register a
  registers = true,
}
```

🚫Limitations
-----------
* Currently can't ignore dates
* Only works with full lines (visual-line mode)

💡Future Plans/Ideas
------------------
* Ignore dates
* More mathematical figures

👀Examples
--------

Extract out of list with text and $-signs

![example image](https://github.com/max397574/Vmath.nvim/blob/master/resources/month_list.png)
