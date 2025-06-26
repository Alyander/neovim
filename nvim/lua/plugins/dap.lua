return {
    {"mfussenegger/nvim-dap",},
    {"rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        config = function()
        local dap, dapui = require("dap"), require("dapui")

        dapui.setup({
          icons = { expanded = "▾", collapsed = "▸", current_frame = "➜" },
          layouts = {
            {
              elements = {
                { id = "scopes", size = 0.25 },
                { id = "breakpoints", size = 0.15 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 0.25 },
              },
              size = 40,
              position = "left",
            },
            {
              elements = {
                "repl",
                "console",
              },
              size = 10,
              position = "bottom",
            },
          },
          controls = {
            enabled = true,
            element = "repl",
            icons = {
              pause = "⏸",
              play = "▶",
              step_into = "⏎",
              step_over = "⏭",
              step_out = "⏮",
              step_back = "🔙",
              run_last = "🔁",
              terminate = "⏹",
            },
          },
          floating = {
            max_height = 0.9,
            max_width = 0.5,
            border = "rounded",
            mappings = {
              close = { "q", "<Esc>" },
            },
          },
          windows = { indent = 1 },
          render = {
            max_type_length = nil,
            max_value_lines = 100,
          },
        })

        -- Авто-открытие и закрытие UI
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
      end,
     },
    -- {"jay-babu/mason-nvim-dap.nvim", opts={ensure_installed = { "python", "java-debug-adapter", "codelldb" }}},
    {"theHamsta/nvim-dap-virtual-text", opts={}}
}
