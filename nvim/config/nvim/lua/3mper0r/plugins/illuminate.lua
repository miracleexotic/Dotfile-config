-- import illuminate plugin safely
local setup, illuminate = pcall(require, "illuminate")
if not setup then
	return
end

-- enable illuminate
illuminate.configure()
