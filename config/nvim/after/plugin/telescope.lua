local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Open git files" })   -- Ctrl+p to find files that git recognizes

vim.keymap.set("n", "<leader>p", function() end, { desc = "Project searching" }) -- Add description to prefix for project searches, used by which-key
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Open all files" }) -- find all files
vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = "Open git files" })   -- Ctrl+p to find files that git recognizes
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep> ") });
end, { desc = "Project search" })
vim.keymap.set('n', '<leader>pG', builtin.live_grep, { desc = "Live grep" })

vim.keymap.set('n', '<leader>po', builtin.oldfiles, { desc = "Open old files" })
vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = "Open buffers" })
-- vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = "Help tags" })

-- Load file browser extension to telescope
require("telescope").load_extension "file_browser"
