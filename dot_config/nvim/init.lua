require("config.lazy")

-- init treesitter c syntax
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c' },
  callback = function() vim.treesitter.start() end,
})

-- init colorscheme 
vim.cmd[[colorscheme tokyonight]]

-- Bring back line numbers
vim.opt.number = true
