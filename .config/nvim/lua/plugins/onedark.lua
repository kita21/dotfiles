return {
  "navarasu/onedark.nvim",
  config = function()
    require('onedark').setup {
      style = 'darker',
      transparent = true, -- falseにすると透明になる
    }
    require('onedark').load()
  end
}
