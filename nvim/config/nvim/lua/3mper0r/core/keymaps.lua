-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "[n]o [h]ighlight" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x', { desc = "[x]elete" })

-- window management
keymap.set("n", "<leader>wsv", "<C-w>v", { desc = "[w]orkspace [s]plit [v]ertically" }) -- split window vertically
keymap.set("n", "<leader>wsv", "<C-w>s", { desc = "[w]orkspace [s]plit [h]orizontally" }) -- split window horizontally
keymap.set("n", "<leader>wse", "<C-w>=", { desc = "[w]orkspace [s]plit [e]qual" }) -- make split windows equal width & height
keymap.set("n", "<leader>wsx", ":close<CR>", { desc = "[w]orkspace [s]plit [c]lose" }) -- close current split window

keymap.set("n", "<leader>wto", ":tabnew<CR>", { desc = "[w]orkspace [t]ab [o]pen" }) -- open new tab
keymap.set("n", "<leader>wtx", ":tabclose<CR>", { desc = "[w]orkspace [t]ab [c]lose" }) -- close current tab
keymap.set("n", "<leader>wtn", ":tabn<CR>", { desc = "[w]orkspace [t]ab [n]ext" }) --  go to next tab
keymap.set("n", "<leader>wtp", ":tabp<CR>", { desc = "[w]orkspace [t]ab [p]revious" }) --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- neo-tree
keymap.set("n", "<leader>e", ":Neotree reveal<cr>", { desc = "Show [e]xplorer" }) -- toggle file explorer

-- telescope
-- See `:help telescope.builtin`
keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "[s]earch [h]elp" })
keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "[s]earch [k]eymaps" })
keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "[s]earch [f]iles" })
keymap.set("n", "<leader>ss", "<cmd>Telescope builtin<cr>", { desc = "[s]earch [s]elect Telescope" })
keymap.set("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "[s]earch current [w]ord" })
keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "[s]earch by [g]rep" })
keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", { desc = "[s]earch [d]iagnostics" })
keymap.set("n", "<leader>sr", "<cmd>Telescope resume<cr>", { desc = "[s]earch [r]esume" })
keymap.set("n", "<leader>s.", "<cmd>Telescope oldfiles<cr>", { desc = '[s]earch Recent Files ("." for repeat)' })
keymap.set("n", "<leader><leader>", "<cmd>Telescope buffers<cr>", { desc = "[ ] Find existing buffers" })

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>lrs", ":LspRestart<CR>", { desc = "[l]sp [r]e[s]tart" }) -- mapping to restart lsp if necessary

-- python env w/ swenv
keymap.set("n", "<leader>sp", "<cmd>lua require('swenv.api').pick_venv()<cr>", { desc = "[s]earch [p]ython env" })

-- auto-session
keymap.set("n", "<leader>sa", "<cmd>SessionSearch<cr>", {
	desc = "[s]earch [a]uto Session",
	noremap = true,
})
keymap.set("n", "<leader>wsr", "<cmd>SessionRestore<CR>", { desc = "[w]orkspace [w]ession [r]estore" }) -- restore last workspace session for current directory
keymap.set("n", "<leader>wss", "<cmd>SessionSave<CR>", { desc = "[w]orkspace [s]ession [s]ave" }) -- save workspace session for current working directory

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
