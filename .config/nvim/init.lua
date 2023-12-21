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

vim.g.mapleader = " "

require("lazy").setup({
  "wakatime/vim-wakatime",
  "nvim-lualine/lualine.nvim",
  { "neoclide/coc.nvim", branch = "release" }
})

require('lualine').setup()

vim.opt.relativenumber = true
