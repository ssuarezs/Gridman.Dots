return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- 🛠️ Initialize dap-ui before opening it
      dapui.setup()

      -- 🚦 Safe open/close with pcall (avoids crash if something's missing)
      dap.listeners.before.attach.dapui_config = function()
        pcall(dapui.open)
      end
      dap.listeners.before.launch.dapui_config = function()
        pcall(dapui.open)
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        pcall(dapui.close)
      end
      dap.listeners.before.event_exited.dapui_config = function()
        pcall(dapui.close)
      end

      require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

      vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Debug: toggle breakpoint" })
      vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Debug: continue" })
    end,
  },
}
