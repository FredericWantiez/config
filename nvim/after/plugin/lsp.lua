local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete()
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  sign_icons = {}
})

vim.diagnostic.config({
  virtual_text = true
})

local on_attach = function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  if client.name == "eslint" then
    vim.cmd.LspStop("eslint")
  end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end

lsp.on_attach(on_attach)

lsp.setup()
