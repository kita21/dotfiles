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
vim.lsp.log.set_level(vim.log.levels.ERROR)
local lua_ls_opts = require('lsp.lua_ls')
vim.lsp.config('lua_ls', lua_ls_opts)
vim.lsp.enable('lua_ls', 'ts_ls', 'rust_analyzer', 'pyright', 'terraformls')
vim.o.pumborder = 'rounded' -- ポップアップの枠線を追加
vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'fuzzy', 'popup' }

-- GitHubCopilot
vim.lsp.enable('copilot')
vim.lsp.inline_completion.enable()
