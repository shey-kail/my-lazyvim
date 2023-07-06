-- Iron.nvim keymaps config is in config/keymaps.lua

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
          repl_open_cmd = "rightbelow 40vsplit | set nonu | set norelativenumber | set signcolumn=no ",
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
}
