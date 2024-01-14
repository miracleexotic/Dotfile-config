-- import indent plugin safely
local setup, indent = pcall(require, "ibl")
if not setup then
	return
end

-- enable indent
indent.setup()
