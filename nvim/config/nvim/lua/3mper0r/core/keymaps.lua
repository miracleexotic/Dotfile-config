-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "[N]o [H]ighlight" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x', { desc = "[X]elete" })

-- window management
keymap.set("n", "<leader>wsv", "<C-w>v", { desc = "[W]orkspace [S]plit [V]ertically" }) -- split window vertically
keymap.set("n", "<leader>wsv", "<C-w>s", { desc = "[W]orkspace [S]plit [H]orizontally" }) -- split window horizontally
keymap.set("n", "<leader>wse", "<C-w>=", { desc = "[W]orkspace [S]plit [E]qual" }) -- make split windows equal width & height
keymap.set("n", "<leader>wsx", ":close<CR>", { desc = "[W]orkspace [S]plit [C]lose" }) -- close current split window

keymap.set("n", "<leader>wto", ":tabnew<CR>", { desc = "[W]orkspace [T]ab [O]pen" }) -- open new tab
keymap.set("n", "<leader>wtx", ":tabclose<CR>", { desc = "[W]orkspace [T]ab [C]lose" }) -- close current tab
keymap.set("n", "<leader>wtn", ":tabn<CR>", { desc = "[W]orkspace [T]ab [N]ext" }) --  go to next tab
keymap.set("n", "<leader>wtp", ":tabp<CR>", { desc = "[W]orkspace [T]ab [P]revious" }) --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- neo-tree
keymap.set("n", "<leader>e", ":Neotree reveal<cr>", { desc = "Neotree [E]xplorer" }) -- toggle file explorer

-- telescope
-- See `:help telescope.builtin`
keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "[S]earch [H]elp" })
keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "[S]earch [K]eymaps" })
keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "[S]earch [F]iles" })
keymap.set("n", "<leader>ss", "<cmd>Telescope builtin<cr>", { desc = "[S]earch [S]elect Telescope" })
keymap.set("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "[S]earch current [W]ord" })
keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "[S]earch by [G]rep" })
keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", { desc = "[S]earch [D]iagnostics" })
keymap.set("n", "<leader>sr", "<cmd>Telescope resume<cr>", { desc = "[S]earch [R]esume" })
keymap.set("n", "<leader>s.", "<cmd>Telescope oldfiles<cr>", { desc = '[S]earch Recent Files ("." for repeat)' })
keymap.set("n", "<leader><leader>", "<cmd>Telescope buffers<cr>", { desc = "[ ] Find existing buffers" })

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>lrs", ":LspRestart<CR>", { desc = "[L]SP [R]e[S]tart" }) -- mapping to restart lsp if necessary

-- python env w/ swenv
keymap.set("n", "<leader>sp", "<cmd>lua require('swenv.api').pick_venv()<cr>", { desc = "[S]earch [P]ython env" })

-- auto-session
vim.keymap.set("n", "<leader>sa", require("auto-session.session-lens").search_session, {
	desc = "[S]earch [A]uto Session",
	noremap = true,
})

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
