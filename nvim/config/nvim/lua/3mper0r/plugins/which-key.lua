-- import which-key plugin safely
local status, which_key = pcall(require, "which-key")
if not status then
	return
end

-- enable which-key
which_key.setup({
	icons = {
		-- disable all icons mappings
		mappings = false,
	},

	-- Document existing key chains
	spec = {
		{ "<leader>b", group = "[b]uffer" },
		{ "<leader>c", group = "[c]ode / [c]ursor", mode = { "n", "x" } },
		{ "<leader>d", group = "[d]ocument" },
		{ "<leader>l", group = "[l]ine / [l]sp" },
		{ "<leader>n", group = "[n]o" },
		{ "<leader>r", group = "[r]ename" },
		{ "<leader>s", group = "[s]earch" },
		{ "<leader>t", group = "[t]oggle" },
		{ "<leader>w", group = "[w]orkspace" },
		{ "<leader>ws", group = "[w]orkspace [s]plit / [s]ession" },
		{ "<leader>wt", group = "[w]orkspace [t]ab" },
	},
})
