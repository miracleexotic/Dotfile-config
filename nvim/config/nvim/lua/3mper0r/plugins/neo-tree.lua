-- import neo-tree plugin safely
local setup, neotree = pcall(require, "neo-tree")
if not setup then
	return
end

-- vim.cmd([[ highlight NeoTreeRootName guifg=#FFFFFF ]])
vim.cmd([[
highlight link NeoTreeDirectoryIcon NvimTreeFolderIcon
highlight link NeoTreeDirectoryName NvimTreeFolderName
highlight link NeoTreeSymbolicLinkTarget NvimTreeSymlink
highlight link NeoTreeRootName NvimTreeRootFolder
highlight link NeoTreeDirectoryName NvimTreeOpenedFolderName
highlight link NeoTreeFileNameOpened NvimTreeOpenedFile
]])

-- enable neo-tree
neotree.setup({
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	event_handlers = {
		{
			event = "neo_tree_popup_input_ready",
			---@param args { bufnr: integer, winid: integer }
			handler = function(args)
				vim.cmd("stopinsert")
				vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
			end,
		},
	},
	window = {
		mappings = {
			["<leader>e"] = "close_window",
		},
	},
	source_selector = {
		winbar = false,
		statusline = false,
	},
	filesystem = {
		filtered_items = {
			never_show_by_pattern = {
				"__pycache__",
			},
			always_show = {
				".env",
			},
		},
		follow_current_file = {
			enabled = true,
		},
	},
})
