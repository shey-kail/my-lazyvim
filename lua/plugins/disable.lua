--disable some plugins that lazyvim has by default

return {
  -- disable tokyonight (theme)
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },

  -- disable catppuccin (theme)
  {
    "catppuccin/nvim",
    enabled = false,
  },

  -- disable neo-tree (file explorer)
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },

  -- disable nvim-spectre (find/replace in multiple files)
  {
    "nvim-pack/nvim-spectre",
    enabled = false,
  },

  -- disable alpha-nvim (dashboard)
  {
    "goolord/alpha-nvim",
    enabled = false,
  },

  -- disable bufferline (bufferline) (I use barbar.nvim instead)
  {
    "akinsho/nvim-bufferline.lua",
    enabled = false,
  },

  -- disable nvim-notify (better notify) (I use barbar.nvim instead)
  {
    "rcarriga/nvim-notify",
    enabled = false,
  },

  -- disable nvim-notify (better notify)
  {
    "rcarriga/nvim-notify",
    enabled = false,
  },

  -- disable mini.bufremove (bufremove)
  {
    "echasnovski/mini.bufremove",
    enabled = false,
  },

  -- disable mini.ai (extend and create `a`/`i` textobjects)
  {
    "echasnovski/mini.ai",
    enabled = false,
  },

  -- disable mini.indentscope
  {
    "echasnovski/mini.indentscope",
    enabled = false,
  },
}
