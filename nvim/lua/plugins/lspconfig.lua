return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
      inlay_hints = { enabled = false },
      servers = {
        vtsls = {
          settings = {
            typescript = {
              tsserver = {
                maxTsServerMemory = 8192,
              },
            },
          },
        },
      },
    },
  },
}
