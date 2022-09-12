local map = require("utils").map

vim.g.mapleader = ","

map("n", "<Space>", ":nohlsearch<CR>", { silent = true })
map("n", "<Leader>w", ":w<CR>", { silent = true })
map("n", "<Leader>e", ":Ex<CR>", { silent = true })
map("n", "<Leader>c", ":q<CR>", { silent = true })

map("i", "jk", "<Esc>", { silent = true })
map("i", "<Leader>s", "<Esc>:w<CR>", { silent = true })

-- Macos random stuff, alt + key is an unicode char
map("n", "∆", "<C-W>j")
map("n", "˚", "<C-W>k")
map("n", "˙", "<C-W>h")
map("n", "¬", "<C-W>l")
