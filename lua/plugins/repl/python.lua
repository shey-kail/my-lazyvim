return {
  {
    "hkupty/iron.nvim",
    config = function()
      require("iron.core").setup({
        config = {
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
          },
        },
      })
    end,
  },
}
