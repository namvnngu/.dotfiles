local M = {}

M.merge = function(a, b)
	return vim.tbl_deep_extend('force', {}, a, b)
end

return M
