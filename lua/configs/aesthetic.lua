local M = {}

local panel_name = "0xEgao Dev Console"

local function project_name()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

local function rust_project()
  return vim.fn.filereadable(vim.fn.getcwd() .. "/Cargo.toml") == 1
end

local function lsp_clients()
  local names = {}

  for _, client in ipairs(vim.lsp.get_clients { bufnr = 0 }) do
    table.insert(names, client.name)
  end

  if #names == 0 then
    return "none"
  end

  return table.concat(names, ", ")
end

local function cargo_hint()
  if not rust_project() then
    return "Open a Rust workspace to light up Cargo tools."
  end

  return "Cargo.toml detected. Use <leader>rc, <leader>rr, <leader>rt."
end

local function panel_lines()
  return {
    "  0xEgao",
    "  =============================",
    "",
    "  Project",
    "  " .. project_name(),
    "",
    "  LSP",
    "  " .. lsp_clients(),
    "",
    "  Rust Flow",
    "  " .. cargo_hint(),
    "",
    "  Keys",
    "  <leader>rr  runnables",
    "  <leader>rt  testables",
    "  <leader>ra  code action",
    "  <leader>re  explain error",
    "  <leader>rm  expand macro",
    "  <leader>xx  diagnostics",
    "  <leader>tt  nearest test",
    "  <leader>td  debug test",
    "  <leader>db  breakpoint",
    "  <leader>du  debugger ui",
    "",
    "  Focus",
    "  K           hover",
    "  gd          definition",
    "  gr          references",
    "  <leader>fm  format",
    "",
    "  q closes this panel",
  }
end

local function find_panel()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.api.nvim_buf_get_name(buf):match(panel_name .. "$") then
      return win, buf
    end
  end
end

function M.toggle_panel()
  local win = find_panel()

  if win then
    vim.api.nvim_win_close(win, true)
    return
  end

  vim.cmd "botright 42vnew"

  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_name(buf, panel_name)
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.bo[buf].filetype = "markdown"
  vim.wo.number = false
  vim.wo.relativenumber = false
  vim.wo.signcolumn = "no"
  vim.wo.foldcolumn = "0"
  vim.wo.winfixwidth = true
  vim.wo.cursorline = false
  vim.wo.wrap = true
  vim.wo.winhl = "Normal:NormalFloat,EndOfBuffer:NormalFloat,WinSeparator:WinSeparator"

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, panel_lines())
  vim.bo[buf].modifiable = false

  vim.keymap.set("n", "q", function()
    vim.api.nvim_win_close(0, true)
  end, { buffer = buf, silent = true, desc = "Close dev console" })
end

vim.api.nvim_create_user_command("DevConsole", M.toggle_panel, {})
vim.keymap.set("n", "<leader>ud", M.toggle_panel, { desc = "UI toggle dev console" })

return M
