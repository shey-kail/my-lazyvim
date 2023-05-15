return {
  {
    "nvim-treesitter/nvim-treesitter",
      indent = {
        enable = true,
      },
      context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = {
        "awk",
        "bash",
        "json",
        "lua",
        "python",
        "r",
        "vim",
        "markdown",
        "markdown-inline",
      },
  },
}
