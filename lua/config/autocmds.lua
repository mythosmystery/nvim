-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

vim.filetype.add({
  pattern = { ["%.astro"] = "astro" },
})

vim.api.nvim_create_autocmd("StdinReadPre", {
  callback = function()
    vim.opt_local.buftype = "nofile"
  end,
})

vim.opt.autoread = true

local autoread_timer = nil

local function check_and_reload()
  local buf = vim.api.nvim_get_current_buf()
  if vim.bo[buf].buftype == "" and not vim.bo[buf].modified then
    local name = vim.api.nvim_buf_get_name(buf)
    if name ~= "" and vim.fn.filereadable(name) > 0 then
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
