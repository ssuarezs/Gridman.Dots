vim.opt.spell = true -- activa spell checker
vim.opt.spelllang = { "en" }

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

if vim.fn.has("wsl") == 1 then -- Fix copy and paste in WSL (Windows Subsystem for Linux)
  vim.g.clipboard = {
    name = "win32yank-wsl", -- Use win32yank for clipboard operations
    copy = {
      ["+"] = "/usr/local/bin/win32yank.exe -i --crlf", -- Command to copy to the sys clipboard
      ["*"] = "/usr/local/bin/win32yank.exe -i --crlf", -- Command to copy to the prim clipboard
    },
    paste = {
      ["+"] = "/usr/local/bin/win32yank.exe -o --lf", -- Command to paste from the sys clipboard
      ["*"] = "/usr/local/bin/win32yank.exe -o --lf", -- Command to paste from the prim clipboard
    },
    cache_enabled = 0, -- Disable clipboard caching
  }
end

require("lazy").setup("plugins")
