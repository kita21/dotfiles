-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
vim.cmd("colorscheme onedark")

vim.opt.clipboard = "unnamedplus"
-- 新しい行を改行で追加した時に、ひとつ上の行のインデントを引き継がせる
vim.opt.autoindent = true
vim.opt.smartindent = true

-- TABキーを押した時に、2文字分の幅を持ったTABが表示されます。
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
-- tabstop で設定した数の分の半角スペースが入力されます。
vim.opt.expandtab = true
-- 絶対行番号を表示する
vim.opt.number = true
vim.opt.termguicolors = true

require("lsp")

--- lspconfig
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')

