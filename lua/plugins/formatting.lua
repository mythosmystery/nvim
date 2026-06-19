return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed or {}, { "eslint_d" })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      -- Order matters: prettier first, then eslint --fix
      local prettier_eslint = { "prettier", "eslint_d" }
      for _, ft in ipairs({
        "typescript",
        "typescriptreact",
        "javascriptreact",
        "vue",
        "astro",
      }) do
        opts.formatters_by_ft[ft] = prettier_eslint
      end
      opts.formatters_by_ft.javascript = { "eslint_d" }
    end,
  },
}
