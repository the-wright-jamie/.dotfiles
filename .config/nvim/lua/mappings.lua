local keymap = vim.keymap
local api = vim.api
local uv = vim.loop
local builtin = require('telescope.builtin')

-- Normal Mode Maps
    -- Telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "File files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Explore buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope Help Tags" })
    -- LazyGit
vim.keymap.set('n', '<leader>gg', "<cmd>LazyGit<cr>", { desc = "Show LazyGit" })
    -- Quitting leader maps
keymap.set("n", "<leader>q", "<cmd>x<cr>", { silent = true, desc = "Quit current window" })
keymap.set("n", "<leader>qQ", "<cmd>qa!<cr>", { silent = true, desc = "Force quit nvim" })
keymap.set("n", "<leader>qq", "<cmd>q<cr>", { silent = true, desc = "Quit"})
keymap.set("n", "<leader>wq", "<cmd>wq<cr>", { silent = true, desc = "Save and quit"})
keymap.set("n", "<leader>ww", "<cmd>w<cr>", { desc = "Save" })

    -- Reload Config
keymap.set("n", "<leader>sv", function()
  vim.cmd([[
      update $MYVIMRC
      source $MYVIMRC
    ]])
  vim.notify("Config reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
end, {
  silent = true,
  desc = "reload init.lua",
})

    -- Lazy Mappings
keymap.set("n", "<leader>ll", "Lazy", { silent = true, desc = "Open Lazy" })

keymap.set("n", "<leader><space>", "<cmd>StripTrailingWhitespace<cr>", { desc = "Remove trailing space" })
keymap.set("i", "jj", "<Esc>", { silent = true, desc = "Return to Normal Mode from Insert" })
