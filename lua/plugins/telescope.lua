return {
  --fuzzy finder
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },

      -- disable Telescope buffers
      { "<leader>fb", false },
      -- disable Telescope defaule find files
      { "<leader><space>", false },
    },
  },
}
