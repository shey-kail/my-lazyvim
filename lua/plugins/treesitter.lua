return {
  {
    "nvim-treesitter/nvim-treesitter",
    indent = {
      enable = true,
    },
    context_commentstring = { enable = true, enable_autocmd = false },

    -- set github mirror site
    config = function()
      for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
        config.install_info.url = config.install_info.url:gsub("https://github.com/", "https://kgithub.com/")
      end
    end,

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
      "kotlin",
    },
  },
}
