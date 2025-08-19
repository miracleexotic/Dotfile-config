-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- import mason-tool-installer plugin safely
local mason_tool_installer_status, mason_tool_installer = pcall(require, "mason-tool-installer")
if not mason_tool_installer_status then
	return
end

-- enable mason
mason.setup()

local servers = {
	"vtsls",
	"html",
	"cssls",
	"tailwindcss",
	"lua_ls",
	"emmet_ls",
	"pyright",
	"intelephense",
}
mason_tool_installer.setup({ ensure_installed = servers })
mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = servers,
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
	-- disabled vim.lsp.enable()
	automatic_enable = false,
})

local form_lint = {
	"prettier", -- ts/js formatter
	"stylua", -- lua formatter
	"eslint_d", -- ts/js linter
	"flake8", -- python linter
	"black", -- python formatter
	"phpcs", -- php linter
	"phpcbf", -- php formatter
}
mason_tool_installer.setup({ ensure_installed = form_lint })
mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = form_lint,
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
