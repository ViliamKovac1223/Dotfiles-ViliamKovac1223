-- Color scheme
vim.cmd('source $HOME/.config/nvim/gruvbox.vim'); -- source file with color scheme
-- Good color schemes from plugin but, like the one above
-- vim.cmd('colorscheme base16-onedark');
-- vim.cmd('colorscheme base16-gruvbox-dark-medium');
-- vim.cmd('colorscheme base16-gruvbox-dark-pale');
-- vim.cmd('colorscheme base16-gruvbox-material-dark-medium');
-- vim.cmd('colorscheme base16-gruvbox-material-dark-medium');
-- vim.cmd('colorscheme base16-dracula');

-- Neovide Configuration
-- Documentation: https://neovide.dev/faq.html 
-- Documentation: https://neovide.dev/configuration.html 
if vim.g.neovide then
    -- Font Options
    vim.o.guifont = "Source Code Pro:h10.2"

    -- Set transparency for neovide
    vim.g.neovide_transparency = 0.85 -- Controls background transparency
    -- vim.g.neovide_transparency = 1.00 -- Controls background transparency
    -- vim.g.neovide_transparency = 0.55
    vim.cmd('set winblend=0') -- Winblend controls the background for floating windows 
    vim.cmd('set pumblend=0') -- Pumblend controls the background popup menu. 

    -- Animations
    -- vim.g.neovide_scroll_animation_length = 0.3
    -- vim.g.neovide_cursor_animation_length = 0.13
    -- vim.g.neovide_cursor_trail_size = 0.8 -- Cursor lag animation
    vim.g.neovide_scroll_animation_length = 0.0
    vim.g.neovide_cursor_animation_length = 0.03
    vim.g.neovide_cursor_trail_size = 0.1 -- Cursor lag animation
    vim.g.neovide_refresh_rate = 60       -- Refresh rate, the lower the better for battery life (Default 60)
    vim.g.neovide_cursor_animate_command_line = false
end

-- General settings

-- Set transparency (for terminal)
local function getTransparentBackground()
    -- get transparent background
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" });
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" });

end
getTransparentBackground();

-- Set tab
vim.cmd([[
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab
]])

-- Get relative number
vim.cmd('set number relativenumber');
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Better searches
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- Case insensitive searches
vim.cmd('set ignorecase'); -- Case insensitive
-- vim.cmd('set smartcase'); -- Case sensitive only if you include uppercase

-- Disable comments continuation
-- vim.cmd('set formatoptions-=cro');

-- Persistent undo
vim.cmd('set undodir=$HOME/.nvim/undo '); --  Where to save undo histories
vim.cmd('set undofile                 '); --  Save undos after file closes
vim.cmd('set undolevels=1000          '); --  How many undos
vim.cmd('set undoreload=10000         '); --  Number of lines to save for undo

-- Don't continue in comments
vim.cmd('set formatoptions-=ro')

-- Remember the line on exit
vim.cmd('autocmd BufWinLeave *.* mkview');
vim.cmd('autocmd BufWinEnter *.* silent loadview');

vim.cmd('set nowrap'); -- Stop breaking lines

-- local project_dir = vim.fn.getcwd();
-- vim.env.JAVA_HOME = '/usr/lib/jvm/java-17-openjdk-amd64'

vim.o.termguicolors = true

-- Change vimwiki syntax to markdown
vim.g.vimwiki_list = {
  {
    path = '~/vimwiki/',
    syntax = 'markdown',
    ext = '.md',
  }
}
