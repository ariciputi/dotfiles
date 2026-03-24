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
        {"<leader>zz", function() builtin.find_files({cwd= vim.fn.expand('%:p:h')}) end },
      },
      -- pickers = {
      --   find_files = {
      --     mappings = {
      --       n = {
      --         ["cd"] = function(prompt_bufnr)
      --           local selection = require("telescope.actions.state").get_selected_entry()
      --           local dir = vim.fn.fnamemodify(selection.path, ":p:h")
      --           require("telescope.actions").close(prompt_bufnr)
      --           -- Depending on what you want put `cd`, `lcd`, `tcd`
      --           vim.cmd(string.format("silent cd %s", dir))
      --         end
      --       }
      --     }
      --   },
      -- },
    },
    -- {
    --   "debugloop/telescope-undo.nvim",
    --   dependencies = { -- note how they're inverted to above example
    --     {
    --       "nvim-telescope/telescope.nvim",
    --       dependencies = { "nvim-lua/plenary.nvim" },
    --     },
    --   },
    --   keys = {
    --     { -- lazy style key map
    --       "<leader>zu",
    --       "<cmd>Telescope undo<cr>",
    --       desc = "undo history",
    --     },
    --   },
    --   opts = {
    --     -- don't use `defaults = { }` here, do this in the main telescope spec
    --     extensions = {
    --       undo = {
    --         -- telescope-undo.nvim config, see below
    --       },
    --       -- no other extensions here, they can have their own spec too
    --     },
    --   },
    --   config = function(_, opts)
    --     -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
    --     -- configs for us. We won't use data, as everything is in it's own namespace (telescope
    --     -- defaults, as well as each extension).
    --     require("telescope").setup(opts)
    --     require("telescope").load_extension("undo")
    --   end,
    -- },
    -- {
    --   "smilovanovic/telescope-search-dir-picker.nvim",
    --   dependencies = { -- note how they're inverted to above example
    --     {
    --       "nvim-telescope/telescope.nvim",
    --       dependencies = { "nvim-lua/plenary.nvim" },
    --     },
    --   },
    --   keys = {
    --     { -- lazy style key map
    --       "<leader>zG",
    --       "<cmd>Telescope search_dir_picker<cr>",
    --       desc = "Grep in dir",
    --     },
    --   },
    --   opts = {
    --     -- don't use `defaults = { }` here, do this in the main telescope spec
    --     extensions = {
    --       search_dir_picker = {
    --         -- telescope-undo.nvim config, see below
    --       },
    --       -- no other extensions here, they can have their own spec too
    --     },
    --   },
    --   config = function(_, opts)
    --     -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
    --     -- configs for us. We won't use data, as everything is in it's own namespace (telescope
    --     -- defaults, as well as each extension).
    --     require("telescope").setup(opts)
    --     require("telescope").load_extension("search_dir_picker")
    --   end,
    -- },
    -- {
    --   "barrettruth/http-codes.nvim",
    --   dependencies = { -- note how they're inverted to above example
    --     {
    --       "nvim-telescope/telescope.nvim",
    --       dependencies = { "nvim-lua/plenary.nvim" },
    --     },
    --   },
    --   keys = {
    --     { -- lazy style key map
    --       "<leader>zH",
    --       "<cmd>HTTPCodes<cr>",
    --       desc = "Grep in dir",
    --     },
    --   },
    --   opts = {
    --     -- don't use `defaults = { }` here, do this in the main telescope spec
    --     extensions = {
    --       http_codes = {
    --         -- telescope-undo.nvim config, see below
    --       },
    --       -- no other extensions here, they can have their own spec too
    --     },
    --   },
    --   config = function(_, opts)
    --     -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
    --     -- configs for us. We won't use data, as everything is in it's own namespace (telescope
    --     -- defaults, as well as each extension).
    --     require("telescope").setup(opts)
    --     require("telescope").load_extension("http_codes")
    --   end,
    -- },
}
