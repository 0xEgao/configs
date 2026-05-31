local M = {}

function M.setup()
  local dap_ok, dap = pcall(require, "dap")
  local dapui_ok, dapui = pcall(require, "dapui")

  if not dap_ok or not dapui_ok then
    return
  end

  dapui.setup {
    layouts = {
      {
        elements = {
          { id = "scopes", size = 0.35 },
          { id = "breakpoints", size = 0.2 },
          { id = "stacks", size = 0.25 },
          { id = "watches", size = 0.2 },
        },
        position = "right",
        size = 46,
      },
      {
        elements = {
          { id = "repl", size = 0.55 },
          { id = "console", size = 0.45 },
        },
        position = "bottom",
        size = 10,
      },
    },
    floating = {
      border = "rounded",
    },
  }

  require("nvim-dap-virtual-text").setup {
    commented = true,
    virt_text_pos = "eol",
  }

  local mason_codelldb = vim.fn.stdpath "data" .. "/mason/packages/codelldb/extension/adapter/codelldb"
  local codelldb = vim.fn.executable(mason_codelldb) == 1 and mason_codelldb or vim.fn.exepath "codelldb"

  if codelldb ~= "" then
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = codelldb,
        args = { "--port", "${port}" },
      },
    }

    dap.configurations.rust = dap.configurations.rust or {
      {
        name = "Launch Rust binary",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
  end

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
  vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn" })
  vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticInfo" })
end

return M
