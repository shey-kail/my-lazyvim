-- dap config
return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "kotlin-debug-adapter" },
      handlers = {
        kotlin = function()
          local dap = require("dap")
          dap.adapters.kotlin = {
            type = "executable",
            command = vim.fn.stdpath("data") .. "mason/bin/kotlin-debug-adapter",
            args = { "--interpreter=vscode" },
          }
          dap.configurations.kotlin = {
            {
              type = "kotlin",
              request = "launch",
              name = "Launch kotlin",
              program = "${file}", -- This configuration will launch the current file if used.
              args = function()
                local input = vim.fn.input("Input args: ")
                return require("util.dap").str2argtable(input)
              end,
              projectRoot = vim.fn.getcwd() .. "/app",
              mainClass = function()
                -- return vim.fn.input("Path to main class > ", "myapp.sample.app.AppKt", "file")
                return vim.fn.input("Path to main class > ")
              end,
            },
          }
        end,
      },
    },
  },
}
