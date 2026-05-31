-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "carbonfox",
	theme_toggle = { "carbonfox", "one_light" },

	hl_override = {
		Comment = { fg = "#7dd3fc", italic = true },
		["@comment"] = { fg = "#7dd3fc", italic = true },
		["@comment.documentation"] = { fg = "#8bd5ca", italic = true },
		LineNr = { fg = "#6f6f6f" },
		CursorLineNr = { fg = "#ffffff", bold = true },
		WinSeparator = { fg = "#303030" },
		NormalFloat = { bg = "#202020" },
		FloatBorder = { fg = "#7dd3fc", bg = "#202020" },
		DiagnosticVirtualLinesError = { fg = "#ff6b8a", bg = "#241f22" },
		DiagnosticVirtualLinesWarn = { fg = "#f5c542", bg = "#242216" },
		DiagnosticVirtualLinesInfo = { fg = "#7dd3fc", bg = "#182126" },
		DiagnosticVirtualLinesHint = { fg = "#8bd5ca", bg = "#162321" },
		LspInlayHint = { fg = "#9a9a9a", bg = "#202020", italic = true },
		NvimTreeNormal = { bg = "#202020" },
		NvimTreeNormalNC = { bg = "#202020" },
		NvimTreeWinSeparator = { fg = "#303030", bg = "#202020" },
	},
}

M.nvdash = {
	load_on_startup = true,
	header = {
		"                                      ",
		"   ___       _____                    ",
		"  / _ \\__  _| ____|__ _  __ _  ___   ",
		" | | | \\ \\/ /  _| / _` |/ _` |/ _ \\  ",
		" | |_| |>  <| |__| (_| | (_| | (_) | ",
		"  \\___//_/\\_\\_____\\__,_|\\__, |\\___/  ",
		"                         |___/        ",
		"                                      ",
		"       Rust, Lua, and sharp tools     ",
		"                                      ",
	},
	buttons = {
		{ txt = "Find file", keys = "f", cmd = "Telescope find_files" },
		{ txt = "Recent files", keys = "r", cmd = "Telescope oldfiles" },
		{ txt = "Search text", keys = "s", cmd = "Telescope live_grep" },
		{ txt = "Open tree", keys = "e", cmd = "NvimTreeToggle" },
		{ txt = "Themes", keys = "t", cmd = "lua require('nvchad.themes').open()" },
		{ txt = "Mappings", keys = "m", cmd = "NvCheatsheet" },
		{ txt = "-", hl = "NvDashFooter", no_gap = true, rep = true },
		{
			txt = function()
				local stats = require("lazy").stats()
				return "Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. math.floor(stats.startuptime) .. " ms"
			end,
			hl = "NvDashFooter",
			no_gap = true,
			content = "fit",
		},
		{ txt = "-", hl = "NvDashFooter", no_gap = true, rep = true },
	},
}

M.ui = {
	cmp = {
		style = "atom_colored",
	},
	statusline = {
		theme = "minimal",
		separator_style = "block",
	},
	tabufline = {
		lazyload = false,
	},
}

M.mason = {
	pkgs = {
		"rust-analyzer",
		"taplo",
		"codelldb",
		"stylua",
		"prettierd",
	},
}

return M
