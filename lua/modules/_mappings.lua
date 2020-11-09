local remap = vim.api.nvim_set_keymap

-- use jj instead of Esc
remap('i', 'jj', '<Esc><Esc>', { noremap = true })
remap('i', 'Jj', '<Esc><Esc>', { noremap = true })
remap('i', 'jJ', '<Esc><Esc>', { noremap = true })
remap('i', 'JJ', '<Esc><Esc>', { noremap = true })

-- toggle luatree
remap('n', '<C-n>', '<CMD>LuaTreeToggle<CR>', { noremap = true })

-- toggle telescope.nvim
remap('n', '<C-p>', '<CMD>lua require"telescope.builtin".find_files{}<CR>', { noremap = true, silent = true })
remap('n', '<C-f>', '<CMD>lua require"telescope.builtin".live_grep{}<CR>', { noremap = true, silent = true })

-- FZF
-- remap('n', '<C-p>', '<CMD>Files<CR>', { noremap = true, silent = true })
-- remap('n', '<C-f>', '<CMD>Rg<CR>', { noremap = true, silent = true })

-- better movement between buffers
remap('n', '<C-h>', '<C-w><C-h>', { noremap = true })
remap('n', '<C-j>', '<C-w><C-j>', { noremap = true })
remap('n', '<C-k>', '<C-w><C-k>', { noremap = true })
remap('n', '<C-l>', '<C-w><C-l>', { noremap = true })

-- resize buffer easier
remap('n', '<Left>', '<CMD>vertical resize +2<CR>', { noremap = true })
remap('n', '<Right>', '<CMD>vertical resize -2<CR>', { noremap = true })
remap('n', '<Up>', '<CMD>resize +2<CR>', { noremap = true })
remap('n', '<Down>', '<CMD>resize -2<CR>', { noremap = true })

-- move lines using alt
remap('', '<A-j>', '<CMD>bd<CR>', { noremap = true })
remap('', '<A-h>', '<CMD>bp<CR>', { noremap = true })
remap('', '<A-l>', '<CMD>bn<CR>', { noremap = true })

-- move vertically by visual line on wrapped lines
remap('n', 'j', 'gj', { noremap = true })
remap('n', 'k', 'gk', { noremap = true })

-- move vertically by visual line on wrapped lines
remap('n', 'j', 'gj', { noremap = true })
remap('n', 'k', 'gk', { noremap = true })

-- better yank and delete behaviour
remap('n', 'dD', 'S<Esc>', { noremap = true })
remap('n', 'Y', 'y$', { noremap = true })

-- remove annoying exmode
remap('n', 'Q', '<Nop>', { noremap = true })
remap('n', 'q:', '<Nop>', { noremap = true })

-- copy to system clipboard
remap('v', '<A-y>', '"+y', { noremap = true })

-- no distraction mode for writing
remap("n", "<Leader>g", "<CMD>Goyo<CR>", { noremap = true })

-- toggle colorizer
remap("n", "<Leader>c", "<CMD>ColorizerToggle<CR>", { noremap = true })

-- source init.vim
remap("n", "<Leader>r", "<CMD>so ~/.config/nvimLua/init.vim<CR>", { noremap = true })

-- better indenting experience
remap('v', '<', '<gv', { noremap = true })
remap('v', '>', '>gv', { noremap = true })

-- preview file using xdg_open
xdg_open = function()
  local filename = vim.fn.expand('<cfile>')
  vim.loop.spawn('xdg-open', { args = { filename } })
end
vim.cmd('command! -nargs=0 PreviewFile call v:lua.xdg_open()') -- alternative way
remap('n', 'gx', '<cmd>lua xdg_open()<CR>', { noremap = true, silent = true })
