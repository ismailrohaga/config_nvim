return {
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        stages = "fade_in_slide_out",
        render = "default",
        timeout = 3000,
        background_colour = "#000000",
        minimum_width = 50,
        icons = {
          ERROR = "",
          WARN = "",
          INFO = "",
          DEBUG = "",
          TRACE = "✎",
        },
        max_width = function()
          return math.floor(vim.o.columns * 0.5)
        end,
        top_down = false,
      })

      vim.notify = require("notify")
    end,
  },
}
