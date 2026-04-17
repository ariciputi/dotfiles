return {
    {
      'nvim-telescope/telescope.nvim',
      lazy = false,
      version = '*',
      dependencies = {
          'nvim-lua/plenary.nvim',
          -- optional but recommended
          { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      },
      keys = {
        {"<leader>zf", "<cmd>Telescope find_files<cr>", desc="Fuzzy find files"},
        {"<leader>zF", "<cmd>Telescope git_files<cr>", desc="Fuzzy find Git files"},
        {"<leader>zb", "<cmd>Telescope buffers<cr>", desc="Fuzzy find buffers"},
        {"<leader>zg", "<cmd>Telescope live_grep<cr>", desc="Fuzzy find buffers"},
        {"<leader>zz", function() local tt = require('telescope.builtin'); tt.find_files({cwd= vim.fn.expand('%:p:h')}) end },
      },
      opts = {
      },
    },
    {
      "debugloop/telescope-undo.nvim",
      dependencies = { -- note how they're inverted to above example
        {
          "nvim-telescope/telescope.nvim",
          dependencies = { "nvim-lua/plenary.nvim" },
        },
      },
      keys = {
        {"<leader>zu", "<cmd>Telescope undo<cr>", desc = "undo history"},
      },
      config = function(_, opts)
        -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
        -- configs for us. We won't use data, as everything is in it's own namespace (telescope
        -- defaults, as well as each extension).
        require("telescope").setup(opts)
        require("telescope").load_extension("undo")
      end,
    },
    {
      "barrettruth/http-codes.nvim",
      dependencies = { -- note how they're inverted to above example
        {
          "nvim-telescope/telescope.nvim",
          dependencies = { "nvim-lua/plenary.nvim" },
        },
      },
      keys = {
        { "<leader>zH", "<cmd>HTTPCodes<cr>", desc = "HTTP codes" },
      },
    },
    {
      "jonarrien/telescope-cmdline.nvim",
      dependencies = { -- note how they're inverted to above example
        {
          "nvim-telescope/telescope.nvim",
          dependencies = { "nvim-lua/plenary.nvim" },
        },
      },
      keys = {
        { "<leader>zQ", "<cmd>Telescope cmdline<cr>", desc = "Cmdline" },
      },
    },
}
