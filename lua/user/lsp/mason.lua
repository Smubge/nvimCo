
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
  providers = {
            "mason.providers.client",
            "mason.providers.registry-api",
  },
	log_level = vim.log.levels.DEBUG,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})
