return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    opts = function(_, opts)
      local function open_with_trouble(...)
        return require("trouble.sources.telescope").open(...)
      end

      opts.extensions = vim.tbl_deep_extend("force", opts.extensions or {}, {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      })

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        path_display = { "smart" },
        mappings = vim.tbl_deep_extend("force", opts.defaults and opts.defaults.mappings or {}, {
          i = vim.tbl_extend("force", opts.defaults and opts.defaults.mappings and opts.defaults.mappings.i or {}, {
            ["<C-t>"] = open_with_trouble,
          }),
          n = vim.tbl_extend("force", opts.defaults and opts.defaults.mappings and opts.defaults.mappings.n or {}, {
            ["<C-t>"] = open_with_trouble,
          }),
        }),
      })

      opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, {
        buffers = {
          show_all_buffers = true,
          sort_mru = true,
          mappings = {
            i = { ["<C-d>"] = "delete_buffer" },
            n = { ["<C-d>"] = "delete_buffer" },
          },
        },
      })

      return opts
    end,
    keys = {
      {
        "<leader><leader>",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find files",
      },
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "[F]ind [F]iles",
      },
      {
        "<leader>fc",
        function()
          require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "[F]ind neovim [C]onfig",
      },
      {
        "<leader>fr",
        function()
          require("telescope.builtin").oldfiles()
        end,
        desc = "[F]ind [R]ecent files",
      },
      {
        "<leader>b",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Find [B]uffers",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "[F]ind by [G]rep",
      },
      {
        "<leader>fw",
        function()
          require("telescope.builtin").grep_string()
        end,
        desc = "[F]ind current [W]ord",
      },
      {
        "<leader>f/",
        function()
          require("telescope.builtin").live_grep({
            grep_open_files = true,
            prompt_title = "Live Grep in Open Files",
          })
        end,
        desc = "[F]ind [/] in open files",
      },
      {
        "<leader>/",
        function()
          require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
            winblend = 10,
            previewer = false,
          }))
        end,
        desc = "[/] Fuzzy search in buffer",
      },
      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "[F]ind [H]elp",
      },
      {
        "<leader>fk",
        function()
          require("telescope.builtin").keymaps()
        end,
        desc = "[F]ind [K]eymaps",
      },
      {
        "<leader>fd",
        function()
          require("telescope.builtin").diagnostics()
        end,
        desc = "[F]ind [D]iagnostics",
      },
      {
        "<leader>ft",
        function()
          require("telescope.builtin").colorscheme({ enable_preview = true })
        end,
        desc = "[F]ind colorscheme",
      },
      {
        "<leader>s",
        function()
          require("telescope.builtin").grep_string({ search = require("functions").get_visual_selection() })
        end,
        mode = "v",
        desc = "[S]earch visual selection",
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      pcall(require("telescope").load_extension, "ui-select")
    end,
  },
}
