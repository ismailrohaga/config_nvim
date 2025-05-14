return {
  {
    "preservim/nerdcommenter",
    config = function()
      vim.g.NERDSpaceDelims = 1
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false }, -- Global inlay hints setting
      servers = {
        clangd = {},
        --  bashls specific configuration
        bashls = {
          handlers = {
            ["textDocument/publishDiagnostics"] = function(err, res, ...)
              local on_publish_diagnostics = vim.lsp.diagnostic.on_publish_diagnostics
              local file_name = vim.fn.fnamemodify(vim.uri_to_fname(res.uri), ":t")
              if string.match(file_name, "^%.env") == nil then
                return on_publish_diagnostics(err, res, ...)
              end
            end,
          },
        },
      },
    },
  },
  {
    "mg979/vim-visual-multi",
    branch = "master", -- this is equivalent to the branch option in vim-plug
  },
}
