return {
  adapters = {
    require "rustaceanvim.neotest",
  },
  discovery = {
    enabled = true,
  },
  output = {
    open_on_run = "short",
  },
  quickfix = {
    enabled = false,
  },
  status = {
    enabled = true,
    signs = true,
    virtual_text = false,
  },
  summary = {
    enabled = true,
    animated = true,
  },
}
