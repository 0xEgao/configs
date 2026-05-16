require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>w", "<cmd>w<CR>", { desc = "File save" })
map("n", "<C-h>", "<cmd>nohlsearch<CR>", { desc = "Search clear highlight" })
map("v", "<C-h>", "<cmd>nohlsearch<CR>", { desc = "Search clear highlight" })
map("n", "<leader>,", "<cmd>set invlist<CR>", { desc = "Editor toggle hidden chars" })
map("n", "<leader><leader>", "<C-^>", { desc = "Buffer alternate buffer" })
map("n", "n", "nzz", { desc = "Search next centered", silent = true })
map("n", "N", "Nzz", { desc = "Search previous centered", silent = true })
map("n", "*", "*zz", { desc = "Search word forward centered", silent = true })
map("n", "#", "#zz", { desc = "Search word backward centered", silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
