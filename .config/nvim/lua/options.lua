vim.opt.number = true
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
-- vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
-- vim.opt.autoindent = true
-- vim.opt.smartindent = true
-- vim.opt.breakindent = true
vim.opt.termguicolors = true
-- vim.opt.inccommand = 'split'
vim.g.mapleader = " "
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- vim.opt.cindent = true

vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = "Move to the split window to the right" })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = "Move to the split window to the left" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = "Move to the split window to the top" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = "Move to the split window to the bottom" })
vim.keymap.set('n', '<C-\\>', ':vsplit<cr>', { desc = "Split window vertically" })
vim.keymap.set('n', '<C-s>', ':split<cr>', { desc = "Split window vertically" })
vim.keymap.set('n', '<leader>bn', ':bnext<cr>', { desc = "Move to the next buffer" })
vim.keymap.set('n', '<leader>bp', ':bprev<cr>', { desc = "Move to the previous buffer" })
vim.keymap.set('n', '<leader>l', ':Lazy<cr>', { desc = "Move to the previous buffer" })

--vim.api.nvim_create_autocmd("FileType", {
--  pattern = { "typescript", "javascript", "lua" }, -- add your file types
--  callback = function()
--    vim.bo.expandtab = true
--    vim.bo.shiftwidth = 2
--    vim.bo.softtabstop = 2
--  end,
--})
