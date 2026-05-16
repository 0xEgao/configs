local nvlsp = require "nvchad.configs.lspconfig"

vim.g.rustaceanvim = {
  tools = {
    enable_clippy = true,
    reload_workspace_from_cargo_toml = true,
    code_actions = {
      ui_select_fallback = true,
    },
    float_win_config = {
      border = "rounded",
    },
  },

  server = {
    on_attach = function(client, bufnr)
      nvlsp.on_attach(client, bufnr)

      local map = vim.keymap.set
      local opts = function(desc)
        return { buffer = bufnr, desc = "Rust " .. desc }
      end

      map("n", "<leader>rr", "<cmd>RustLsp runnables<CR>", opts "runnables")
      map("n", "<leader>rR", "<cmd>RustLsp!<CR>", opts "rerun last runnable")
      map("n", "<leader>rt", "<cmd>RustLsp testables<CR>", opts "testables")
      map("n", "<leader>rd", "<cmd>RustLsp debuggables<CR>", opts "debuggables")
      map("n", "<leader>ra", "<cmd>RustLsp codeAction<CR>", opts "code action")
      map("n", "<leader>re", "<cmd>RustLsp explainError current<CR>", opts "explain error")
      map("n", "<leader>rE", "<cmd>RustLsp renderDiagnostic current<CR>", opts "render diagnostic")
      map("n", "<leader>rm", "<cmd>RustLsp expandMacro<CR>", opts "expand macro")
      map("n", "<leader>rc", "<cmd>RustLsp openCargo<CR>", opts "open Cargo.toml")
      map("n", "<leader>rD", "<cmd>RustLsp openDocs<CR>", opts "open docs.rs")
      map("n", "<leader>rp", "<cmd>RustLsp parentModule<CR>", opts "parent module")

      if client.server_capabilities then
        client.server_capabilities.semanticTokensProvider = nil
      end
    end,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    default_settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          buildScripts = {
            enable = true,
          },
        },
        check = {
          command = "clippy",
          allTargets = true,
          features = "all",
        },
        completion = {
          postfix = {
            enable = false,
          },
        },
        diagnostics = {
          styleLints = {
            enable = true,
          },
        },
        imports = {
          group = {
            enable = false,
          },
          granularity = {
            group = "module",
          },
        },
        inlayHints = {
          bindingModeHints = {
            enable = false,
          },
          chainingHints = {
            enable = true,
          },
          closingBraceHints = {
            enable = true,
            minLines = 25,
          },
          closureReturnTypeHints = {
            enable = "with_block",
          },
          lifetimeElisionHints = {
            enable = "skip_trivial",
            useParameterNames = true,
          },
          parameterHints = {
            enable = true,
          },
          typeHints = {
            enable = true,
          },
        },
        procMacro = {
          enable = true,
        },
      },
    },
  },
}

