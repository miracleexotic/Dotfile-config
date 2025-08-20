-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- NOTE: LSP Keybinds

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings
		-- Check `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf, silent = true }

		-- keymaps
		opts.desc = "Show LSP [F]inder"
		vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references

		opts.desc = "Goto [D]eclaration"
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

		opts.desc = "Show LSP [d]efinitions"
		vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- show lsp definitions

		opts.desc = "Show LSP [i]mplementations"
		vim.keymap.set("n", "gi", "<cmd>Lspsaga goto_definition<CR>", opts) -- show lsp implementations

		opts.desc = "[G]oto [T]ype definitions"
		vim.keymap.set("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>", opts) -- show lsp type definitions

		opts.desc = "Show LSP [t]ype definitions"
		vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts) -- show lsp type definitions

		opts.desc = "Show LSP [c]ode [a]ctions"
		vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions, in visual mode will apply to selection

		opts.desc = "Smart [r]e[n]ame"
		vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename

		opts.desc = "Show [b]uffer [d]iagnostics"
		vim.keymap.set("n", "<leader>bd", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts) -- show  diagnostics for file

		opts.desc = "Show [l]ine [d]iagnostics"
		vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show diagnostics for line

		opts.desc = "Show [c]ursor [d]iagnostics"
		vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for line

		opts.desc = "Show do[K]umentation"
		vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor

		opts.desc = "Show [o]utline"
		vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- show documentation for what is under cursor

		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
	end,
})

-- NOTE : Moved all this to Mason including local variables
-- used to enable autocompletion (assign to every lsp server config)
-- local capabilities = cmp_nvim_lsp.default_capabilities()
-- Change the Diagnostic symbols in the sign column (gutter)

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰠠 ",
			[vim.diagnostic.severity.INFO] = " ",
		},
		virtual_text = true, -- Specify Enable virtual text for diagnostics
		underline = true, -- Specify Underline diagnostics
		update_in_insert = false, -- Keep diagnostics active in insert mode
	},
})

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
})

-- configure typescript server with plugin
lspconfig["vtsls"].setup({
	capabilities = capabilities,
})

-- configure css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			completion = {
				callSnippet = "Replace",
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

-- configure python server
lspconfig["pyright"].setup({
	capabilities = capabilities,
	filetypes = { "python" },
	settings = {
		pyright = {
			disableOrganizeImports = false,
		},
		python = {
			analysis = {
				autoSearchPaths = true,
				autoImportCompletions = true,
				useLibraryCodeForTypes = true,
				typeCheckingMode = "basic", --  ["off", "basic", "strict"]:
				diagnosticMode = "workspace", -- ["openFilesOnly", "workspace"]
				diagnosticSeverityOverrides = { -- "error," "warning," "information," "true," "false," or "none"
					reportDuplicateImport = "warning",
					reportImportCycles = "warning",
					reportMissingImports = "error",
					reportMissingModuleSource = "error",
				},
			},
		}, -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md, https://github.com/microsoft/pyright/blob/main/docs/settings.md
	},
})

-- configure php server
lspconfig["intelephense"].setup({
	capabilities = capabilities,
	filetypes = { "php" },
})
