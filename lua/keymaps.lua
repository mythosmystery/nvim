local opts = { noremap = true, silent = true }

-- Normal mode mappings
vim.keymap.set("n", "<ESC>", ":noh<CR>", opts)

vim.keymap.set("n", "<C-S-j>", require("functions").move_line_down, opts)
vim.keymap.set("n", "<C-S-k>", require("functions").move_line_up, opts)

vim.keymap.set("n", "<C-p>", ":bprev<CR>", opts)
vim.keymap.set("n", "<C-n>", ":bnext<CR>", opts)
vim.keymap.set({ "n", "v", "i" }, "<C-c>", "<ESC>", opts)

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Open File tr[e]e" })
vim.keymap.set("n", "<leader>w", "<cmd>wa!<cr>", { desc = "[W]rite" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "[Q]uit" })
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "[Q]uit All" })
vim.keymap.set("n", "<leader>s", "<cmd>source %<cr>", { desc = "Re-[S]ource" })

-- Plugins sub-menu
vim.keymap.set("n", "<leader>Pi", "<cmd>Lazy install<cr>", { desc = "[I]nstall" })
vim.keymap.set("n", "<leader>Ps", "<cmd>Lazy sync<cr>", { desc = "[S]ync" })
vim.keymap.set("n", "<leader>Pc", "<cmd>Lazy clean<cr>", { desc = "[C]lean" })
vim.keymap.set("n", "<leader>Pm", "<cmd>Mason<cr>", { desc = "[M]ason" })

-- Visual mode mapping
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

vim.keymap.set("i", "<C-z>", "<C-o>u", opts)
-- vim.keymap.set("i", "<C-h>", "<C-o>h", opts)
vim.keymap.set("i", "<C-j>", "<C-o>j", opts)
vim.keymap.set("i", "<C-k>", "<C-o>k", opts)
-- vim.keymap.set("i", "<C-l>", "<C-o>l", opts)
vim.keymap.set("i", "<C-u>", "<C-o><C-u>", opts)
vim.keymap.set("i", "<C-d>", "<C-o><C-d>", opts)
