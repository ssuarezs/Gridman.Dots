return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        position = "right",
      },
      filesystem = {
        filtered_items = {
          visible = true, -- This shows hidden files (dotfiles)
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    })

    -- vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>")
    vim.keymap.set("n", "<C-n>", function()
      local neotree_win = nil
      local current_win = vim.api.nvim_get_current_win()

      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local bufname = vim.api.nvim_buf_get_name(buf)
        if bufname:match("neo%-tree") then
          neotree_win = win
          break
        end
      end

      if neotree_win == nil then
        vim.cmd("Neotree show")
        vim.defer_fn(function()
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
            if bufname:match("neo%-tree") then
              vim.api.nvim_set_current_win(win)
              break
            end
          end
        end, 100) -- wait 100ms
      elseif neotree_win == current_win then
        vim.cmd("Neotree close")
      else
        vim.api.nvim_set_current_win(neotree_win)
      end
    end, { desc = "Smart Neo-tree toggle with focus" })
  end,
}
