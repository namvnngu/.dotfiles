local create_augroups = require("utils.autocmd").create_augroups

local auto_commands = {
	trim_space = {
		{ "BufWritePre", "*", ":lua require('utils.trim').trim_trailing_whitespace()" },
	},

	map_sass_to_scss = {
		{ "BufRead,BufNewFile", "*.scss", "set filetype=sass" },
	},

	-- In insert mode, no wait for each keystroke of the mapping
	-- before aborting it and carrying out the behaviour of the keys typed so far
	-- fast_escape = {
	--     { "InsertEnter", "*", "set timeoutlen=0" },
	--     { "InsertLeave", "*", "set timeoutlen=1000" },
	-- },

	-- open_folds = {
	-- 	{ "BufReadPost,FileReadPost", "*", "normal zR" },
	-- },
}

create_augroups(auto_commands)
