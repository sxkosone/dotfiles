-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- === map jk to esc ===
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })

-- === move to sidenav filenav on currently open file ===
vim.keymap.set("n", "<leader>e", ":Neotree reveal<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>gy", function()
  local file = vim.fn.expand("%:p")
  local line = vim.fn.line(".")

  -- Get repo root
  local root =
    vim.fn.systemlist("git -C " .. vim.fn.shellescape(vim.fn.expand("%:p:h")) .. " rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    vim.notify("Not in a git repo", vim.log.levels.ERROR)
    return
  end

  -- Relative path from repo root
  local rel_path = file:sub(#root + 2)

  -- Get current branch
  local branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD")[1]

  -- Get remote URL and convert to HTTPS
  local remote = vim.fn.systemlist("git remote get-url origin")[1]
  local github_url = remote:gsub("git@github%.com:", "https://github.com/"):gsub("%.git$", "")

  local url = github_url .. "/blob/" .. branch .. "/" .. rel_path .. "#L" .. line
  vim.fn.setreg("+", url)
  vim.notify("Copied: " .. url)
end, { desc = "Copy GitHub URL for current line" })
