-- import conform plugin safely
local setup, conform = pcall(require, "conform")
if not setup then
	return
end

-- enable conform
conform.setup({
	notify_on_error = false,
	format_on_save = function(bufnr)
		-- Disable "format_on_save lsp_fallback" for languages that don't
		-- have a well standardized coding style. You can add additional
		-- languages here or re-enable it for the disabled ones.
		local disable_filetypes = { c = true, cpp = true }
		local lsp_format_opt
		if disable_filetypes[vim.bo[bufnr].filetype] then
			lsp_format_opt = "never"
		else
			lsp_format_opt = "fallback"
		end
		return {
			timeout_ms = 500,
			lsp_format = lsp_format_opt,
		}
	end,
	formatters = {
		["markdown-toc"] = {
			condition = function(_, ctx)
				for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
					if line:find("<!%-%- toc %-%->") then
						return true
					end
				end
			end,
		},
		["markdownlint-cli2"] = {
			condition = function(_, ctx)
				local diag = vim.tbl_filter(function(d)
					return d.source == "markdownlint"
				end, vim.diagnostic.get(ctx.buf))
				return #diag > 0
			end,
		},
	},
	formatters_by_ft = {
		typescript = { "biome-check" },
		javascriptreact = { "biome-check" },
		typescriptreact = { "biome-check" },
		css = { "biome-check" },
		html = { "biome-check" },
		svelte = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		graphql = { "prettier" },
		liquid = { "prettier" },
		lua = { "stylua" },
		-- Conform can also run multiple formatters sequentially
		python = { "isort", "black" },
		markdown = { "prettier", "markdown-toc" },
		-- You can use 'stop_after_first' to run the first available formatter from the list
		javascript = { "prettierd", "prettier", stop_after_first = true },
	},
})

-- Configure individual formatters
conform.formatters.prettier = {
	args = {
		"--stdin-filepath",
		"$FILENAME",
		"--tab-width",
		"4",
		"--use-tabs",
		"false",
	},
}
conform.formatters.shfmt = {
	prepend_args = { "-i", "4" },
}

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "[f]ormat whole file or range (in visual mode)" })
