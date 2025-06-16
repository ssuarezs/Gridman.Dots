require("config.options")
require("config.yank")

if vim.g.vscode then
  -- VSCode extension
else
  require("config.lazy")
  require("config.keymaps")
end


vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0

