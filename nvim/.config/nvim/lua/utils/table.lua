local M = {}

M.merge_tables = function(table1, table2)
	for k, v in pairs(table2) do
		table1[k] = v
	end
	return table1
end

return M
