local map = require("lua.utils").map
local neogit = require("neogit")

neogit.setup {}

map("n", "<Leader>gi", "<cmd>Neogit<CR>")
