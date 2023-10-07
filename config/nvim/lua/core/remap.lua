vim.g.mapleader = " "; -- make mapleader (leader) a space

-- While in normal mode, if leader key and pv are pressed do Ex command
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file manager" });

-- Leader key + y to copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Copy to system clipboard" });
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Copy to system clipboard" });

-- Add paste function to neovide
if vim.g.neovide then
    vim.keymap.set("n", "<C-S-v>", "\"+P", { desc = "Paste from system clipboard" });
    vim.keymap.set("v", "<C-S-v>", "\"+P", { desc = "Paste from system clipboard" });
    -- vim.keymap.set("i", "<C-S-v>", "<ESC>\"+Pa", { desc = "Paste from system clipboard" });
    vim.keymap.set("i", "<C-S-v>", "<C-r>+", { desc = "Paste from system clipboard" });
end

-- vim.keymap.set("n", "<leader>Y", "\"+Y", {desc = "Copy to system clipboard"});

-- Remove keybinding
vim.keymap.set("n", "Q", "<nop>", {desc = ""});

-- Spell checking
vim.keymap.set("n", "<leader>c", function() end, { desc = "Spell checking" }) -- Add description to prefix for spelling, used by which-key
vim.keymap.set("n", "<leader>cs", function() vim.cmd('setlocal spell spelllang=sk') end, { desc = "Spell checking sk" })
vim.keymap.set("n", "<leader>ce", function() vim.cmd('setlocal spell spelllang=en_us') end, { desc = "Spell checking en" })

vim.keymap.set("n", "<leader>f", function() end, { desc = "Files" }) -- Add description to prefix for files, used by which-key
-- Keymaps for telescope file browser
vim.api.nvim_set_keymap(
    "n",
    "<leader>fb",
    ":Telescope file_browser<CR>",
    { noremap = true, desc = "Telescope File Browser" }
)
