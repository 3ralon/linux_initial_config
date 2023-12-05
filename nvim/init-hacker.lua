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

---
-- PLUGINS CONFIGURATION FILE
---

-- PLUGINS INSTALLATION

--- Lazy configuration
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--- Plugins list
local plugins = {
  --functional
  {'nvim-treesitter/nvim-treesitter', build=':TSUpdate'},
  {'sbdchd/neoformat'},
  {'neoclide/coc.nvim', branch='release'},
  {'jiangmiao/auto-pairs'},
  {'preservim/nerdcommenter'},
  --view
  {'nvim-lualine/lualine.nvim'},
  {'nvim-tree/nvim-web-devicons'},
  {'folke/tokyonight.nvim', branch='main'},
}
require("lazy").setup(plugins, opts)

--- Plugins configuration
vim.cmd[[colorscheme tokyonight]]
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'tokyonight',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "javascript", "html", "css" },
  sync_install = false,
  auto_install = true,
  ignore_install = { "javascript" },
  highlight = {
    enable = true,
    disable = { "c", "rust" },
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = false,
  },
}
