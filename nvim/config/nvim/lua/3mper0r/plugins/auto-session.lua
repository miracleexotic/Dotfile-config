-- import auto-session plugin safely
local setup, session = pcall(require, "auto-session")
if not setup then
	return
end

-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

telescope.load_extension("session-lens")

-- enable auto-session
local function close_neo_tree()
	require("neo-tree.sources.manager").close_all()
	vim.notify("closed all")
end

local function open_neo_tree()
	vim.notify("opening neotree")
	require("neo-tree.sources.manager").show("filesystem")
end

session.setup({
	-- log_level = "info",
	-- auto_session_enable_last_session = false,
	-- auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
	-- auto_session_enabled = true,
	auto_session_create_enabled = true,
	auto_save_enabled = true,
	auto_restore_enabled = true,
	auto_session_suppress_dirs = nil,
	auto_session_use_git_branch = true,
	-- the configs below are lua only
	bypass_session_save_file_types = { "neo-tree" },
	pre_save_cmds = {
		close_neo_tree,
	},
	post_restore_cmds = {
		open_neo_tree,
	},
	session_lens = {
		-- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
		buftypes_to_ignore = { "neo-tree" }, -- list of buffer types what should not be deleted from current session
		load_on_setup = true,
		theme_conf = { border = true },
		previewer = false,
	},
})
