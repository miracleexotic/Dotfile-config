-- set colorscheme to nightfly with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme dracula-soft")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end

local status, _ = pcall(vim.cmd, "highlight CursorLine ctermbg=NONE guibg=#444444")
if not status then
	print("CursorLine cannot apply highlight")
	return
end
