"prevent loading the file twice
if exists("g:loaded_vmath_nvim")
    finish
endif

lua require("vmath_nvim").init()

let g:loaded_vmath_nvim = 1
