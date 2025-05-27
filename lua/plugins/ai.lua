local function from_command(command)
  -- save my api url in kwallet, use this to get the url that deployed in deno
  local prog, err = io.popen(command, "r")
  if not prog then
    -- 如果无法打开管道，打印错误信息
    print("无法打开管道，错误信息：")
    print(err)
    return
  end

  -- 如果成功执行命令，读取输出
  local output = prog:read("*a")
  prog:close()

  -- 去掉输出结果末尾的换行符（如果存在）
  return (output:gsub("%s+$", ""))
end

local get_url_command_pattern = "kwallet-query --folder API_KEY --read-password %s kdewallet 2>/dev/null"

local openai_deno_url = from_command(string.format(get_url_command_pattern, "gemini_to_openai_deno"))
local openai_vercel_url = from_command(string.format(get_url_command_pattern, "gemini_to_openai_vercel"))

-- local get_handle_command = 'qdbus org.kde.kwalletd5 /modules/kwalletd5 org.kde.KWallet.open "kdewallet" 0 "cli"'
-- local handle = from_command(get_handle_command)

-- local function get_key_command(the_handle, index)
--   return string.format(
--     "cmd:qdbus org.kde.kwalletd5 /modules/kwalletd5 org.kde.KWallet.readPassword %s API_KEY %s cli",
--     the_handle,
--     index
--   )
-- end

-- local function get_key_command(the_handle, index)
--   return {
--     "qdbus",
--     "org.kde.kwalletd5",
--     "/modules/kwalletd5",
--     "org.kde.KWallet.readPassword",
--     the_handle,
--     '"API_KEY"',
--     index,
--     '"cli"',
--   }
-- end
--
-- -- command to get the api key from kwallet (must must prefixed with `^cmd:(.*) because avante.nvim's config regular)
-- local get_gemini_api_key = get_key_command(handle, '"GEMINI_API_KEY"')
-- local get_requesty_api_key = get_key_command(handle, '"REQUESTY_API_KEY"')
-- local get_openrouter_api_key = get_key_command(handle, '"OPENROUTER_API_KEY"')

local get_gemini_api_key = "GEMINI_API_KEY"
local get_requesty_api_key = "REQUESTY_API_KEY"
local get_openrouter_api_key = "OPENROUTER_API_KEY"

return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = "v0.0.23",
    opts = {
      provider = "gemini_requesty",
      behaviour = {
        -- auto_suggestions是高频调用的,所以难免很贵，建议使用便宜或者免费的服务。这里我直接停了。copilot不大行。我用的是codeium，并不使用此插件进行设置，我直接用lazytraes安装的codium
        auto_suggestions_provider = nil,
        -- auto_suggestions = false, -- Experimental stage
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
      },
      --openai = {
      --  -- @see https://ai.google.dev/gemini-api/docs/models/gemini
      --  -- trans gemini api to openai api
      --  endpoint = openai_deno_url,
      --  -- model = "gemini-2.0-flash",
      --  model = "gemini-2.5-pro-exp-03-25",
      --  temperature = 0.7,
      --  -- max_tokens = 4096,
      --},
      vendors = {
        -- deno转发gemini官方
        gemini_deno = {
          __inherited_from = "openai",
          endpoint = openai_deno_url,
          api_key_name = get_gemini_api_key,
          -- model = "gemini-2.0-flash",
          model = "gemini-2.5-pro-exp-03-25",
        },
        -- vercel转发gemini官方
        gemini_vercel = {
          __inherited_from = "openai",
          endpoint = openai_vercel_url,
          api_key_name = get_gemini_api_key,
          -- model = "gemini-2.0-flash",
          model = "gemini-2.5-pro-exp-03-25",
        },
        -- requesty的gemini
        gemini_requesty = {
          __inherited_from = "openai",
          endpoint = "https://router.requesty.ai/v1",
          api_key_name = get_requesty_api_key,
          model = "google/gemini-2.5-pro-exp-03-25",
        },
        -- openrouter的gemini，比官方的限制小
        gemini_openrouter = {
          __inherited_from = "openai",
          endpoint = "https://openrouter.ai/api/v1",
          api_key_name = get_openrouter_api_key,
          model = "google/gemini-2.5-pro-exp-03-25:free",
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
