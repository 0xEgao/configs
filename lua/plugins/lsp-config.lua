return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config=function()
        require("mason-lspconfig").setup(
          {
            ensure_installed= {"lua_ls","rust_analyzer","ast_grep","spectral","eslint","ts_ls","solidity_ls"},
        })
      end
  },
  {
     "neovim/nvim-lspconfig",
      lazy=false,
      config=function()
      local lspconfig=require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.ast_grep.setup({})
      lspconfig.spectral.setup({})
      lspconfig.eslint.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.solidity_ls.setup({})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
     end
  }
}
