-- Configure diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
  },
})
vim.lsp.set_log_level("error")
local lua_ls_opts = require('lsp.lua_ls')
vim.lsp.config('lua_ls', lua_ls_opts)
vim.lsp.enable('lua_ls', 'tsgo', 'rust_analyzer', 'pyright', 'terraformls')

