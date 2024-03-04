local opts = { noremap = true, silent = true }

-- Normal mode mappings
vim.keymap.set("n", "<ESC>", ":noh<CR>", opts)

vim.keymap.set("n", "<C-S-j>", ":lua require('functions').move_line_down()<CR>", opts)
vim.keymap.set("n", "<C-S-j>", ":lua require('functions').move_line_up()<CR>", opts)

vim.keymap.set("n", "<C-n>", ":bnext<CR>", opts)
vim.keymap.set("n", "<C-p>", ":bprev<CR>", opts)
vim.keymap.set("n", "<C-d>", ":bdelete<CR>", opts)

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
vim.keymap.set("i", "<C-j>", "<C-o>o", opts)
vim.keymap.set("i", "<C-k>", "<C-o>O", opts)
vim.keymap.set("i", "<C-c>", "<ESC>", opts)
