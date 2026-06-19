-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local opts = { noremap = true, silent = true }

-- General
vim.keymap.set("n", "<Esc>", ":noh<CR>", opts)
vim.keymap.set({ "n", "v", "i" }, "<C-c>", "<Esc>", opts)

vim.keymap.set("n", "<leader>w", "<cmd>wa!<cr>", { desc = "[W]rite all" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "[Q]uit" })
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "[Q]uit all" })

-- Window / tmux navigation (overrides LazyVim's <C-w> mappings)
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Navigate left", silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Navigate down", silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Navigate up", silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Navigate right", silent = true })

-- Buffer navigation
vim.keymap.set("n", "<C-p>", ":bprev<CR>", opts)
vim.keymap.set("n", "<C-n>", ":bnext<CR>", opts)
vim.keymap.set("n", "<C-x>", function()
  Snacks.bufdelete()
end, { desc = "Delete buffer" })

-- Line movement
vim.keymap.set("n", "<C-S-j>", require("functions").move_line_down, opts)
vim.keymap.set("n", "<C-S-k>", require("functions").move_line_up, opts)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Insert mode movement
vim.keymap.set("i", "<C-z>", "<C-o>u", opts)
vim.keymap.set("i", "<C-j>", "<C-o>j", opts)
vim.keymap.set("i", "<C-k>", "<C-o>k", opts)
vim.keymap.set("i", "<C-u>", "<C-o><C-u>", opts)
vim.keymap.set("i", "<C-d>", "<C-o><C-d>", opts)

-- File explorer & outline
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "[E]xplorer" })
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<cr>", { desc = "[A]erial" })

-- Plugin management
vim.keymap.set("n", "<leader>Pi", "<cmd>Lazy install<cr>", { desc = "[I]nstall plugins" })
vim.keymap.set("n", "<leader>Ps", "<cmd>Lazy sync<cr>", { desc = "[S]ync plugins" })
vim.keymap.set("n", "<leader>Pc", "<cmd>Lazy clean<cr>", { desc = "[C]lean plugins" })
vim.keymap.set("n", "<leader>Pm", "<cmd>Mason<cr>", { desc = "[M]ason" })

-- Diagnostics (Trouble)
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics<cr>", { desc = "Trouble diagnostics" })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { desc = "Trouble quickfix" })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { desc = "Trouble location list" })

-- Git (Fugitive)
vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git [S]tatus" })
vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>", { desc = "Git [C]ommit" })
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<cr>", { desc = "Git [P]ush" })
vim.keymap.set("n", "<leader>gd", "<cmd>Git diff<cr>", { desc = "Git [D]iff" })
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git [B]lame" })
vim.keymap.set("n", "<leader>gl", "<cmd>Git log<cr>", { desc = "Git [L]og" })

-- which-key groups
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  once = true,
  callback = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>a", group = "[A]erial" },
      { "<leader>c", group = "[C]ode" },
      { "<leader>f", group = "[F]ind" },
      { "<leader>g", group = "[G]it" },
      { "<leader>P", group = "[P]lugins" },
      { "<leader>x", group = "[X]rouble" },
    })
  end,
})

-- LSP keymaps (override LazyVim defaults on attach)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user_lsp_keymaps", { clear = true }),
  callback = function(args)
    local bufnr = args.buf
    local map = function(keys, fn, desc)
      vim.keymap.set("n", keys, fn, { buffer = bufnr, desc = desc, silent = true })
    end

    map("K", vim.lsp.buf.hover, "Hover documentation")
    map("gd", vim.lsp.buf.definition, "Goto definition")
    map("gD", vim.lsp.buf.type_definition, "Goto type definition")
    map("gi", vim.lsp.buf.implementation, "Goto implementation")
    map("gr", function()
      require("trouble").toggle("lsp_references")
    end, "Goto references")
    map("cR", vim.lsp.buf.rename, "Rename symbol")
    map("<leader>ca", vim.lsp.buf.code_action, "Code actions")
    map("<leader>cf", function()
      require("conform").format()
    end, "Format file")
    map("<leader>ch", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
    end, "Toggle inlay hints")
    map("<leader>cr", "<cmd>LspRestart<cr>", "Restart LSP")
  end,
})
