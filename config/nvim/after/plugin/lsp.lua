local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

vim.diagnostic.config({
    -- virtual_text = true, -- default
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
    -- virtual_text = {
        -- source = "always",  -- Or "if_many"
        -- prefix = '●', -- Could be '■', '▎', 'x'
    -- },
    -- severity_sort = true,
    -- float = {
        -- source = "always",  -- Or "if_many"
    -- },
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

local opts = { noremap=true, silent=true }

local function quickfix()
    vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
    })
end

lsp.on_attach(function(client, bufnr)
    -- vim.keymap.set("n", "<leader>qh", function() vim.lsp.buf.hover() end, {buffer = bufnr, remap = false})
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {buffer = bufnr, remap = false})

    -- vim.lsp.buf.format({formatting_options = { tabSize = 4, insertSpaces = true }})

    -- https://neovim.io/doc/user/lsp.html#LspAttach, more things like this
    vim.keymap.set("n", "<leader>l", function() end, { desc = "Lsp" }) -- Add description to prefix for lsp, used by which-key
    vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, { buffer = bufnr, remap = false, desc = "Rename" })
    vim.keymap.set("n", "<leader>lc", function() vim.lsp.buf.code_action() end, { buffer = bufnr, remap = false, desc = "Code action" })
    vim.keymap.set("n", "<leader>ls", function() vim.lsp.buf.document_symbol() end, { buffer = bufnr, remap = false, desc = "List all symbols" })
    vim.keymap.set("n", "<leader>lg", function() vim.lsp.buf.definition() end, { buffer = bufnr, remap = false, desc = "Go to definition" })
    vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, { buffer = bufnr, remap = false, desc = "Format by lsp server" })
    --     { buffer = bufnr, remap = false, desc = "Format code" })
end)

vim.keymap.set('n', '<leader>qf', quickfix, opts)

-- Try to configure lsp with godot
local util = require 'lspconfig.util'

local port = os.getenv 'GDScript_Port' or '6005'
local cmd = { 'nc', 'localhost', port }

if vim.fn.has 'nvim-0.8' == 1 then
  cmd = vim.lsp.rpc.connect('127.0.0.1', port)
end

require('lspconfig').gdscript.setup({
    default_config = {
        cmd = cmd,
        filetypes = { 'gd', 'gdscript', 'gdscript3' },
        root_dir = util.root_pattern('project.godot', '.git'),
    },
    docs = {
        description = [[
        https://github.com/godotengine/godot

        Language server for GDScript, used by Godot Engine.
        ]],
        default_config = {
            root_dir = [[util.root_pattern("project.godot", ".git")]],
        },
    },
})

-- skip java configuration, because another extension will take care of this
-- lsp.skip_server_setup({'jdtls'})

lsp.setup()
