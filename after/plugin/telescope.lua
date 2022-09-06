local map = require("lua.utils").map 

map("n", "<Leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<Leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>")
