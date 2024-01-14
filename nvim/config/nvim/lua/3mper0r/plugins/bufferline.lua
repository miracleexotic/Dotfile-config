-- import bufferline plugin safely
local setup, bufferline = pcall(require, "bufferline")
if not setup then
	return
end

vim.cmd([[
highlight BufferLineDuplicate guifg=#80a1be guibg=#1e1f27
highlight BufferLineDuplicateSelected guifg=#afd7ff
highlight BufferLineDuplicateVisible guifg=#80a1be guibg=#252630
]])

-- enable bufferline
bufferline.setup({
	options = {
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		offsets = {
			{
				filetype = "neo-tree",
				text = "File Explorer",
				highlight = "Directory",
				separator = true, -- use a "true" to enable the default, or set your own character
			},
		},
	},
})
