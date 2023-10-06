---
-- LOAD NVIM CONFIGURATION
---

-- DEFAULT CONFIGURATION
--- File
vim.opt.autowriteall=true
vim.opt.encoding='utf-8'
vim.opt.hidden=true
vim.opt.mouse=a
vim.opt.swapfile=false
--- Columns and Rows
vim.opt.autoindent=true
vim.opt.breakindent=true
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.shiftwidth=2
vim.opt.smartindent=true
vim.opt.smarttab=true
--- View
vim.opt.guicursor='n-v-c:block,i-ci-ve:ver25'
vim.opt.scrolloff=999
vim.opt.showmode=true
vim.opt.showtabline=1
vim.opt.syntax='syn'
vim.opt.termguicolors=true
vim.opt.wrap=true
--- Font
vim.opt.ignorecase=true
vim.opt.smartcase=true

-- PLUGINS CONFIGURATION
require('plugins')

-- MAPPINGS CONFIGURATION
-- Space as leader key
vim.g.mapleader = ','

-- Shortcuts
vim.keymap.set({'n', 'x', 'o'}, '<leader>h', '^')
vim.keymap.set({'n', 'x', 'o'}, '<leader>l', 'g_')
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- Buffer management
vim.keymap.set('n', '<leader>a', ':bprev<cr>')
vim.keymap.set('n', '<leader>d', ':bnext<cr>')

-- Basic clipboard interaction
vim.keymap.set({'n', 'x'}, 'gy', '"+y') -- copy
vim.keymap.set({'n', 'x'}, 'gp', '"+p') -- paste

-- Delete text
vim.keymap.set({'n', 'x'}, 'x', '"_x')

-- Commands
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')
vim.keymap.set('n', '<leader>bq', '<cmd>bdelete<cr>')
vim.keymap.set('n', '<leader>bl', '<cmd>buffer #<cr>')

