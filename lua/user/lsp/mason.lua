
local servers = {
	-- "sumneko_lua",
	-- "pyright",
	-- "jsonls",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
  --[[ vim.diagnositic.config({ ]]
  --[[   virtual_text = false, ]]
  --[[   signs = false, ]]
  --[[   underline = false, ]]
  --[[ }), ]]
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})
