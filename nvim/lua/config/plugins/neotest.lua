return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- neotest-vstest depends on neotest, not the other way around, but
            -- neotest requires all adapters in its setup() call, so we list it
            -- here to ensure it's available at that point.
            "nsidorenco/neotest-vstest",
        },
        opts = function()
          return {
            adapters = {
              require("neotest-vstest"),
            },
          }
        end,
    }
}
