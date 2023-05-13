return {
	-- only when sh, py, go, lua, r files are opened, copilot.lua will be loaded
	{ import = "lazyvim.plugins.extras.coding.copilot" },
	{
		"copilot.lua",
		ft = {"sh","py","go","lua","r"},
	},

	-- ensure r_language_server, pyright and lua_ls is installed
	{
		"williamboman/mason-lspconfig.nvim",
		config = function ()
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			mason_lspconfig.setup({
				ensure_installed = {
					"pyright",
					"r_language_server",
					"lua_ls",
				},
			})

			-- Add additional capabilities supported by nvim-cmp
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				require("cmp_nvim_lsp").default_capabilities(),
				{}
			)
			----------enable foldingRange to ensure nvim-ufo work---------------------------
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}
			mason_lspconfig.setup_handlers({
				-- default setup
				function(server)
					lspconfig[server].setup({
						capabilities = capabilities,
					})
				end,

				-- provide targeted overrides for specific servers.
				["r_language_server"] = function()
					lspconfig["r_language_server"].setup({
						capabilities = capabilities,
						settings = {
							r = {
								lsp = {
									diagnostics = false,
								},
							},
						},
					})
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
			})
		end

	},

	-- plugin to provide vim.api.* completion
	{
		'hrsh7th/cmp-nvim-lua',
		ft={"lua"}
	},


	--Use <tab> for completion and snippets (supertab).
	{
		"L3MON4D3/LuaSnip",
		keys = function()
			--disable default
			return {}
		end,
	},

	--Use <tab> for completion and snippets (supertab).
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local luasnip = require("luasnip")
			local cmp = require("cmp")

			opts.mapping = vim.tbl_extend("force", opts.mapping, {
			  ["<CR>"] = cmp.mapping.confirm({
			  	behavior = cmp.ConfirmBehavior.Replace,
			  	select = true,
			  }),
			  ["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
				  cmp.select_next_item()
				-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
				-- they way you will only jump inside the snippet region
				elseif luasnip.expand_or_jumpable() then
				  luasnip.expand_or_jump()
				elseif has_words_before() then
				  cmp.complete()
				else
				  fallback()
				end
			  end, { "i", "s" }),
			  ["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
				  cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
				  luasnip.jump(-1)
				else
				  fallback()
				end
			  end, { "i", "s" }),
			})
		end,
	}
}
