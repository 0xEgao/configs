require "nvchad.options"

-- add yours here!

local o = vim.o
local opt = vim.opt

o.cursorline = true
o.cursorlineopt = "both"
o.scrolloff = 6
o.sidescrolloff = 8
o.smoothscroll = true
o.signcolumn = "yes"
o.splitright = true
o.splitbelow = true
o.undofile = true
o.wrap = false
o.colorcolumn = ""
o.laststatus = 3
o.showmode = false
o.list = true
opt.listchars = { tab = "^ ", nbsp = "¬", extends = "»", precedes = "«", trail = "•" }
opt.diffopt:append { "iwhite", "algorithm:histogram", "indent-heuristic" }
opt.fillchars = {
  eob = " ",
  fold = " ",
  foldopen = "",
  foldsep = " ",
  foldclose = "",
  diff = "╱",
  msgsep = "─",
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
}

vim.diagnostic.config {
  virtual_text = {
    spacing = 3,
    prefix = "●",
    source = "if_many",
    format = function(diagnostic)
      local message = diagnostic.message:gsub("%s+", " ")
      if #message > 110 then
        message = message:sub(1, 107) .. "..."
      end
      return message
    end,
  },
  virtual_lines = false,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚",
      [vim.diagnostic.severity.WARN] = "󰀪",
      [vim.diagnostic.severity.INFO] = "󰋽",
      [vim.diagnostic.severity.HINT] = "󰌶",
    },
  },
  float = {
    border = "rounded",
    source = "if_many",
  },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.opt_local.colorcolumn = ""
    vim.opt_local.textwidth = 100
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { timeout = 250 }
  end,
})

require "configs.aesthetic"
