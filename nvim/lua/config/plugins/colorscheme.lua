return {
  {
      "rebelot/kanagawa.nvim",
      lazy = false,
      priority = 1000,
      init = function()
        vim.opt.laststatus = 2
        vim.opt.fillchars:append({ vert = '│' })
      end,
      opts = {
        dimInactive = true,
        globalStatus = true,
        overrides = function(colors)
          local theme = colors.theme
          return {
            WinSeparator = { fg = "#666666", bg = "#181820" },
            ColorColumn = { bg = "none" },
          }
      end,
      },
   },
}
