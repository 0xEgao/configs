require "nvchad.options"

-- add yours here!

local o = vim.o
local opt = vim.opt

o.cursorline = true
o.cursorlineopt = "both"
o.scrolloff = 6
o.sidescrolloff = 8
o.signcolumn = "yes"
o.splitright = true
o.splitbelow = true
o.undofile = true
o.wrap = false
o.colorcolumn = "80"
o.list = true
opt.listchars = { tab = "^ ", nbsp = "¬", extends = "»", precedes = "«", trail = "•" }
opt.diffopt:append { "iwhite", "algorithm:histogram", "indent-heuristic" }

vim.diagnostic.config {
  virtual_text = {
    spacing = 4,
    prefix = "●",
  },
  virtual_lines = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "if_many",
  },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.opt_local.colorcolumn = "100"
    vim.opt_local.textwidth = 100
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { timeout = 250 }
  end,
})
