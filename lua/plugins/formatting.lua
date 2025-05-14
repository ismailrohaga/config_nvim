return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      -- Explicitly assign prettier to supported file types
      opts.formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        vue = { "prettier" },
        handlebars = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        cpp = { "clang_format" }, -- Use clang-format for C++
        cmake = { "cmake_format" }, -- Use cmake-format for CMake
      }

      opts.formatters = opts.formatters or {}
      opts.formatters.clang_format = {
        command = "clang-format",
        args = { "--style=Google" }, -- Customize style if desired
      }
      opts.formatters.cmake_format = {
        command = "cmake-format",
        args = { "-" }, -- Read from stdin
      }
    end,
  },
  -- Disable null-ls forks to avoid conflicts
  {
    "nvimtools/none-ls.nvim",
    enabled = false,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    enabled = false,
  },
}
