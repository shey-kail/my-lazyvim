return {

  -- open ranger in neovim
  {
    "is0n/fm-nvim",
    opts = {
      edit_cmd = "edit",
      cmds = {
        gitui_cmd = "gitui",
        lf_cmd = "lf",
        --ranger_cmd = "ranger",
        --joshuto_cmd = "joshuto",
      },
      -- Mappings used with the plugin
      mappings = {
        vert_split = "<C-v>",
        horz_split = "<C-h>",
        tabedit = "<C-t>",
        edit = "<C-e>",
        ESC = "<ESC>",
      },
    },
    keys = {
      { "<leader>lf", "<cmd>Lf<cr>",     desc = "lf" },
    },
  },
}
