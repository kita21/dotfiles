-- Insert Modeでjjを入力すると、ノーマルモードに戻る
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true, desc = 'Return to Normal Mode' })
vim.keymap.set('i', '<c-b>', '<left>', { noremap = true, silent = true, desc = 'Emacs like left' })
vim.keymap.set('i', '<c-f>', '<right>', { noremap = true, silent = true, desc = 'Emacs like right' })

-- GitHubCopilotのキーマップ
-- 挿入モードで Tab を押したとき、インライン補完の候補があればそれを確定（accept）する 
-- 候補がなければ <Tab> をそのまま入力（通常のタブ動作にフォールバック）
vim.keymap.set('i', '<Tab>', function()
  if not vim.lsp.inline_completion.get() then
    return '<Tab>'
  end
end, { expr = true, desc = 'Accept inline completion' })
-- インライン補完の次の候補を選択
vim.keymap.set('i', '<C-j>', function()
  vim.lsp.inline_completion.select({ count = 1 })
end, { desc = 'Next inline completion' })
-- インライン補完の前の候補を選択
vim.keymap.set('i', '<C-k>', function()
  vim.lsp.inline_completion.select({ count = -1 })
end, { desc = 'Prev inline completion' })

-- LSP keymaps
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')

