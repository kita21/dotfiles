return {
  'romus204/tree-sitter-manager.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  cmd = 'TSManager',
  opts = {
    ensure_installed = {
      'typescript',
      'tsx',
      'rust',
      'python',
      'lua',
      'terraform',
      'go',
      'json',
      'yaml',
      'bash',
    },
    highlight = true,
    auto_install = false,
  },
}
