return {
  {
    "neovim/nvim-lspconfig",
    opts = {
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
