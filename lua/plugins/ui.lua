return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
        },
      })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    cmd = "NvimTreeToggle",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      sync_root_with_cwd = true,
      diagnostics = {
        enable = true,
      },
      renderer = {
        highlight_diagnostics = "all",
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {},
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      messages = {
        enabled = false,
      },
      notify = {
        enabled = false,
      },
    },
  },
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.startify")

      dashboard.section.header.val = {
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
      }

      alpha.setup(dashboard.opts)
    end,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      if vim.g.neovide then
        require("bufferline").setup({
          options = {
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
              local icon = level:match("error") and "" or ""
              return " " .. icon .. count
            end,
            offsets = {
              {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
              },
            }
          },
        })
      end
    end
  }
}
