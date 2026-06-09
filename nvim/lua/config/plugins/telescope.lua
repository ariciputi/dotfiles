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
        {"<leader>zg", "<cmd>Telescope live_grep<cr>", desc="Live grep (send matches to quickfix with <C-y>)"},
        {"<leader>zw", "<cmd>Telescope grep_string<cr>", desc="Grep word under cursor"},
        {"<leader>zw", "<cmd>Telescope grep_string<cr>", mode="v", desc="Grep visual selection"},
        {"<leader>zq", "<cmd>Telescope quickfix<cr>", desc="Fuzzy find in quickfix list"},
        {"<leader>zz", function() local tt = require('telescope.builtin'); tt.find_files({cwd= vim.fn.expand('%:p:h')}) end },
      },
      opts = function()
        local actions = require('telescope.actions')
        return {
          defaults = {
            mappings = {
              -- <C-q> is the tmux prefix here, so it never reaches Telescope.
              -- Use <C-y> to send all current matches to the quickfix list and
              -- open it (works in both insert and normal mode in the picker).
              i = {
                ["<C-y>"] = actions.send_to_qflist + actions.open_qflist,
              },
              n = {
                ["<C-y>"] = actions.send_to_qflist + actions.open_qflist,
              },
            },
          },
        }
      end,
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
