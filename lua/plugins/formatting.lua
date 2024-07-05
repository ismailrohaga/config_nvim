---@diagnostic disable: inject-field, undefined-doc-name
return {
  {
    "stevearc/conform.nvim",
    optional = true,
    ---@param opts ConformOpts
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft["*"] = { "prettier" }

      opts.formatters = opts.formatters or {}
      opts.formatters.prettier = {
        condition = function(_, _)
          return true
        end,
      }
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.prettier)
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function(_, opts)
      local null_ls = require("null-ls")
      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, {
        null_ls.builtins.formatting.prettier,
      })
    end,
  },
}
