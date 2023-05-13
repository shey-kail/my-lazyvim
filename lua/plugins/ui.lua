return {

  { "Mofiqul/vscode.nvim", opts = { transparent = true } },

  { "LazyVim/LazyVim", opts = {
    colorscheme = "vscode",
  } },

  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,

    opts = {
      icons = {
        -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
        buffer_index = true,
        --buffer_number = true,
        -- button = '',

        -- Configure the icons on the bufferline when modified or pinned.
        -- Supports all the base icon options.
        modified = { button = "●" },
        pinned = { button = "", filename = true, separator = { right = "" } },
      },
    },
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
  },
}
