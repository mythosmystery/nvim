return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- vtsls sends stale inlay hint positions during completion, which crashes
      -- Neovim's decoration provider (Invalid 'col': out of range). Toggle with <leader>ch.
      inlay_hints = {
        exclude = {
          "vue",
          "astro",
          "typescript",
          "typescriptreact",
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript.tsx",
        },
      },
      servers = {
        vtsls = {
          settings = {
            typescript = {
              preferences = {
                importModuleSpecifierPreference = "relative",
              },
            },
            javascript = {
              preferences = {
                importModuleSpecifierPreference = "relative",
              },
            },
          },
        },
      },
    },
  },
}
