require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "rust", "python", "julia" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}
