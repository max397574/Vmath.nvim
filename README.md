# Vmath.nvim

A lua version of Damian Conway's [vmath](https://www.youtube.com/watch?v=aHm36-na4-4&t=1740s).

Features
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

Usage
-----
`vnoremap <your mapping> <ESC>:Vmath<CR>`

Example:
`vnoremap <leader>vm <ESC>:Vmath<CR>`

Limitations
-----------
* Currently can't ignore dates
* Only works with full lines (visual-line mode)

Future Plans/Ideas
------------------
* Ignore dates
* More mathematical figures
* Save numbers in registers
* Add settings

Examples
--------

Extract out of list with text and $-signs

![example image](https://github.com/max397574/Vmath.nvim/blob/master/resources/month_list.png)
