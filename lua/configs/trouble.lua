return {
  auto_close = false,
  auto_preview = true,
  focus = true,
  modes = {
    diagnostics = {
      groups = {
        { "filename", format = "{file_icon} {basename:Title} {count}" },
      },
    },
  },
  win = {
    type = "split",
    position = "bottom",
    size = 12,
  },
}
