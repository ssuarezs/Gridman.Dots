return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      integrations = {
        -- Enable transparency for commonly used plugins
        nvimtree = true,
        treesitter = true,
        telescope = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = {},
            hints = {},
            warnings = {},
            information = {},
          },
          underlines = {
            errors = {},
            hints = {},
            warnings = {},
            information = {},
          },
        },
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
