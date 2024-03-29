require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "css",
    "html",
    "javascript",
    "json",
    "python",
    "ruby",
    "rust",
    "scss",
    "tsx",
    "typescript",
    "yaml"
  },
  autotag = {
    enable = true
  }
}
