-- import lsp_signature plugin safely
local setup, lsp_signature = pcall(require, "lsp_signature")
if not setup then
	return
end

-- enable lsp_signature
lsp_signature.setup({
	bind = true, -- This is mandatory, otherwise border config won't get registered.
	handler_opts = {
		border = "rounded",
	},
	hint_prefix = " ",
})
