return {
  -- Disable golangci-lint in nvim; `make linc` runs it properly from webapp/
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        go = {},
      },
    },
  },
  -- Go testing
  { "sebdah/vim-delve" },
  -- Go development support
  { "fatih/vim-go" },
  -- Run git commands in vim buffer, such as :Git blame
  { "tpope/vim-fugitive" },
  {
    "folke/snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
  },
  -- Telescope live_grep_args support
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("live_grep_args")
    end,
    keys = {
      {
        "<leader>/",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "Grep (args)",
      },
    },
  },
}
