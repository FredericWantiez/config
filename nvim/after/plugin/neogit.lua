local map = require("utils").map
local neogit = require("neogit")

neogit.setup {}

map("n", "<Leader>gi", "<cmd>Neogit<CR>")
