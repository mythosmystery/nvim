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

M.get_system_theme = function()
	--  local out = os.execute("defaults read -g AppleInterfaceStyle 2>/dev/null")
	--  local is_dark = out == 0
	--
	-- if is_dark then
	-- 	return "dark"
	-- else
	-- 	return "light"
	-- end
	return "dark"
end

M.reload_theme = function()
	vim.cmd("Lazy reload lualine.nvim")
	local theme = M.get_system_theme()
	if theme == "dark" then
		vim.cmd("colorscheme tokyonight")
		vim.opt.background = "dark"
	else
		vim.cmd("colorscheme PaperColor")
		vim.opt.background = "light"
	end
end

return M
