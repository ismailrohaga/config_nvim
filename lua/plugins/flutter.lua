return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
    config = function()
      require("flutter-tools").setup({
        --for windowns only
        -- flutter_path = "/Users/sadabwasim/Documents/development/flutter/bin/flutter.bat",
        ui = {
          border = "rounded",
          notification_style = "plugin",
        },
        outline = {
          open_cmd = "30vnew",
          auto_open = false,
        },
        closing_tags = {
          highlight = "Comment",
          prefix = "// ",
          enabled = true,
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
          register_configurations = function(_)
            require("dap").adapters.dart = {
              type = "executable",
              command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
              args = { "flutter" },
            }

            -- require("dap").adapters.flutter = {
            --   type = "executable",
            --     command = vim.fn.stdpath('data')..'/mason/bin/dart-debug-adapter',
            --   args = {"flutter"}
            -- }

            require("dap").configurations.dart = {
              {
                type = "dart",
                request = "launch",
                name = "Launch flutter",
                dartSdkPath = "/Users/sadabwasim/Documents/development/flutter/bin/cache/dart-sdk/",
                flutterSdkPath = "/Users/sadabwasim/Documents/development/flutter",
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
              },
            }

            -- require("dap").configurations.flutter = {
            --   {
            --     type = "flutter",
            --     request = "launch",
            --     name = "Launch flutter",
            --     dartSdkPath = '/Users/sadabwasim/Documents/development/flutter/bin/cache/dart-sdk/',
            --     flutterSdkPath='/Users/sadabwasim/Documents/development/flutter',
            --     program = "${workspaceFolder}/lib/main.dart",
            --     cwd = "${workspaceFolder}",
            --   }
            -- }

            -- require("dap.ext.vscode").load_launchjs()
          end,
        },
        dev_log = {
          enabled = false,
          open_cmd = "tabedit",
        },
        lsp = {
          on_attach = require("lazyvim.util").lsp.on_attach,
          color = {
            enabled = true,
            background = false,
            background_color = { r = 220, g = 223, b = 228 },
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
            enableSdkFormatter = true,
            analysisExcludedFolders = {
              ".dart_tool",
            },
          },
          -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
        },
      })
    end,
  },

  { "dart-lang/dart-vim-plugin" },
}
