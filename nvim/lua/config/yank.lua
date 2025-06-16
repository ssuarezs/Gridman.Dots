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

  vim.keymap.set("v", "yy", '"+y', { desc = "Yank to Windows clipboard" })
  vim.keymap.set("n", "YY", '"+yy', { desc = "Yank line to Windows clipboard" })
end
