
local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', ':lua require("telescope.builtin").find_files({ glob_pattern = "!{**/target/**}"})<CR>')
vim.keymap.set('n', '<leader>fg', ':lua require("telescope.builtin").live_grep({ glob_pattern = "!{**/target/**}"})<CR>')
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fc', builtin.planets, {})


require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        },
    }
}
require("telescope").load_extension("ui-select")
require("telescope").load_extension("live_grep_args")
require('telescope').load_extension('fzf')

