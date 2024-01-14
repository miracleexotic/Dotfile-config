-- import barbecue plugin safely
local setup, barbecue = pcall(require, "barbecue")
if not setup then
  return
end

require("barbecue.ui").toggle(true)

-- enable barbecue
barbecue.setup()

