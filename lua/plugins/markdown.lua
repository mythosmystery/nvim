return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {},
        ["markdown.mdx"] = {},
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      local skip = { ["markdownlint-cli2"] = true }
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return not skip[pkg]
      end, opts.ensure_installed or {})
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        markdown = { "prettier", "markdown-toc" },
        ["markdown.mdx"] = { "prettier", "markdown-toc" },
      },
    },
  },
}
