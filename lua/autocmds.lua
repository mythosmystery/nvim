-- Astro filetype detection
vim.filetype.add({
	pattern = { ["%.astro"] = "astro" },
})

vim.api.nvim_create_autocmd("StdinReadPre", {
	callback = function()
		vim.opt_local.buftype = "nofile"
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Reload buffers in real-time when the file changes on disk (AI agents, other editors)
vim.opt.autoread = true

-- Keep a single timer alive that checks for external changes every second.
-- Only reloads if the buffer has no unsaved changes.
local autoread_timer = nil

local function check_and_reload()
	local buf = vim.api.nvim_get_current_buf()
	if vim.bo[buf].buftype == "" and not vim.bo[buf].modified then
		local name = vim.api.nvim_buf_get_name(buf)
		if vim.fn.filereadable(name) > 0 then
			-- autoread + checktime reloads silently when file changed on disk
			vim.cmd("silent! checktime")
		end
	end
end

vim.api.nvim_create_autocmd("BufEnter", {
	desc = "Start real-time autoread timer when entering a buffer",
	group = vim.api.nvim_create_augroup("autoread-sync", { clear = true }),
	callback = function()
		if not autoread_timer then
			autoread_timer = vim.uv.new_timer()
			autoread_timer:start(0, 1000, vim.schedule_wrap(check_and_reload))
		end
	end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
	desc = "Stop autoread timer on exit",
	group = vim.api.nvim_create_augroup("autoread-sync-stop", { clear = true }),
	callback = function()
		if autoread_timer then
			autoread_timer:stop()
			autoread_timer:close()
			autoread_timer = nil
		end
	end,
})
