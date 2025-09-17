return {
  "nvim-treesitter/nvim-treesitter",
	event = "BufRead",
	build = ":TSUpdate",
	main = 'nvim-treesitter.configs',
	opts = {
	  highlight = { enable = true },
	  indent = { enable = true },
	  ensure_installed = {
	    "bash",
      "diff",
	    "html",
	    "json",
      "lua",
      "luadoc",
      "markdown",
	    "python",
	    "toml",
	    "vim",
	    "vimdoc",
	    "yaml",
      "typescript",
      "terraform"
	  }
	}
}
