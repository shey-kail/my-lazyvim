return {
  {
    "hkupty/iron.nvim",
    ft = { "sh", "py", "lua", "r" },
    config = function()
      local iron = require("iron.core")
      iron.setup({
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          -- Your repl definitions come here
          repl_definition = {
            python = {
              command = function()
                if os.getenv("CONDA_PREFIX") == nil then
                  return { "python3" }
                else
                  return { os.getenv("CONDA_PREFIX") .. "/bin/python3" }
                end
              end,
            },
            r = { command = "radian" },
          },
          repl_open_cmd = "rightbelow 40vsplit | set nonu | set signcolumn=no ",
        },
        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        highlight = {
          italic = true,
        },
        -- ignore blank lines when sending visual select lines
        ignore_blank_lines = false,
      })
    end,
  },

  -- keymaps settings
  {
    "iron.nvim",
    keys = {
      {
        "<localleader><leader>",
        function()
          require("iron.core").visual_send()
        end,
        desc = "Send visual selection to repl",
      },

      {
        "<localleader><leader>",
        function()
          require("iron.core").send_line()
        end,
        desc = "Send line to repl",
      },

      {
        "<localleader>sq",
        function()
          require("iron.core").close_repl()
        end,
        desc = "Close repl",
      },

      {
        "<localleader>s<space>",
        function()
          require("iron.core").send(nil, string.char(03))
        end,
        desc = "Interrupt",
      },

      {
        "<localleader>s<cr>",
        function()
          require("iron.core").send(nil, string.char(13))
        end,
        desc = "Send Enter",
      },
    },
  },
}
