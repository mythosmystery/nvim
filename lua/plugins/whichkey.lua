return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.register({
      e = { "<cmd> Neotree filesystem toggle left<cr>", "Open File tree" },
      w = { "<cmd>w!<cr>", "Save" },
      q = { "<cmd>wq!<cr>", "Save and Quit" },
      f = {
        name = "file",
        f = { "<cmd> Telescope find_files<cr>", "Find File" },
        g = { "<cmd> Telescope live_grep<cr>", "Grep Project" },
        s = { "<cmd> Telescope grep_string<cr>", "Grep String" },
      },
      h = {
        name = "harpoon",
        h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon Menu" },
        c = { "<cmd>lua require('harpoon.mark').clear_all_marks()<cr>", "Clear Marks" },
        m = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add Mark" },
      },
      d = {
        name = "dap",
        t = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
        c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
        s = { "<cmd>lua require('dap').step_over()<cr>", "Step Over" },
        i = { "<cmd>lua require('dap').step_into()<cr>", "Step Into" },
        o = { "<cmd>lua require('dap').step_out()<cr>", "Step Out" },
        r = { "<cmd>lua require('dap').repl.toggle()<cr>", "Toggle Repl" },
        x = { "<cmd>lua require('dap').terminate()<cr>", "Terminate" },
      },
      b = {
        name = "buffer",
        b = { "<cmd>BufferLineCyclePrev<cr>", "Prev" },
        n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
        c = { "<cmd>Bdelete<cr>", "Kill" },
        f = { "<cmd>Telescope buffers previewers=false<cr>", "Find" },
        p = { "<cmd>BufferLinePick<cr>", "Pick" },
        x = { "<cmd>BufferLinePickClose<cr>", "Pick and Close" },
      },
      c = {
        name = "code",
        a = { vim.lsp.buf.code_action, "Code Actions" },
        f = { vim.lsp.buf.format, "Format File" },
        h = { require("lsp-inlayhints").toggle, "Toggle Inlay Hints" },
      },
      [" "] = { "<cmd> Telescope find_files<cr>", "Search" },
      t = {
        name = "Terminal",
        n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },          -- NodeJS Terminal
        p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },      -- Python Terminal
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" }, -- Floating Terminal
        h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" }, -- Horizontal Terminal,
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },    -- Vertical Terminal
      },
      s = {
        name = "Search",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        t = { "<cmd>Telescope live_grep<cr>", "Text" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        l = { "<cmd>Telescope resume<cr>", "Resume last search" },
        p = {
          "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
          "Colorscheme with Preview",
        },
      },
      p = {
        name = "Plugins",
        i = { "<cmd>Lazy install<cr>", "Install" },
        s = { "<cmd>Lazy sync<cr>", "Sync" },
        S = { "<cmd>Lazy clear<cr>", "Status" },
        c = { "<cmd>Lazy clean<cr>", "Clean" },
        u = { "<cmd>Lazy update<cr>", "Update" },
        p = { "<cmd>Lazy profile<cr>", "Profile" },
        l = { "<cmd>Lazy log<cr>", "Log" },
        d = { "<cmd>Lazy debug<cr>", "Debug" },
        M = { "<cmd>Mason<cr>", "Mason" },
      },
      D = {
        name = "database",
        m = { "<cmd>lua require('mongo-nvim.telescope.pickers').database_picker()<cr>", "Mongo" },
      }
    }, { prefix = "<leader>" })
    wk.register({
      s = {
        function()
          require("telescope.builtin").grep_string({ search = vim.getVisualSelection() })
        end,
        "Grep Visual Selection",
      },
    }, { prefix = "<leader>", mode = "v" })
  end,
}
