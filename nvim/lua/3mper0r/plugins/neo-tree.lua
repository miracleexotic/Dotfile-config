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
  window = {
    mappings = {
      ["<leader>e"] = "close_window"
    }
  },
  source_selector = {
    winbar = true,
    statusline = false
  }
})
