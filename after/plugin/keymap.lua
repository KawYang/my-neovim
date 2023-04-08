local keymap = vim.keymap



-- buffer line key map
keymap.set("n", "<C-J>", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<C-K>", ":BufferLineCycleNext<CR>")
-- 快速选择buffer
keymap.set("n", "<leader>bc", ":BufferLinePick<CR>")


keymap.set("n", "<C-t>", ":ToggleTerm<CR>")
keymap.set("n", "<leader>bc", ":BufferLinePick<CR>")
