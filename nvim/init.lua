require("plugins")
require("highlights")
require("keymap")
require("settings")

local autocmd = vim.api.nvim_create_autocmd

vim.g.netrw_browse_split = 0
vim.wo.number = true
vim.wo.cursorline = true

autocmd({"BufWritePre"}, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
