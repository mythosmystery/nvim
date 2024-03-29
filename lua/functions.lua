local M = {}

M.move_line_up = function()
	if vim.fn.line(".") > 1 then
		vim.cmd("m -2")
	end
end

M.move_line_down = function()
	if vim.fn.line(".") < vim.fn.line("$") then
		vim.cmd("m +1")
	end
end

M.get_visual_selection = function()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg("v")
	vim.fn.setreg("v", {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ""
	end
end

return M
