local keymap = vim.keymap
local api = vim.api
local uv = vim.loop
local builtin = require('telescope.builtin')

-- Normal Mode Maps
    -- Packages etc 
keymap.set('n', '<leader>po', '<cmd>Lazy<cr>', { desc = "Open Lazy Package Manager" })
keymap.set('n', '<leader>pm', '<cmd>Mason<cr>', { desc = "Open Mason" })
    -- Toggles
keymap.set('n', '<leader>tw', function()
    cmd([[
        set wrap!
    ]])
    notify("Wrapping toggled", vim.log.levels.INFO, { title = "wrapping" })
end, 
    { desc = "Toggle wrapping" })
    -- Telescope
keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
keymap.set('n', '<leader>fg', builtin.git_files, { desc = "Find files in git" })
keymap.set('n', '<leader>fi', builtin.grep_string, { desc = "Find string" })
keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Explore buffers" })
keymap.set('n', '<leader>fe', vim.cmd.Ex, { desc = "File explorer" })
    -- LazyGit
    -- Mapped to the command alias
keymap.set('n', '<leader>lg', "<cmd>LazyGit<cr>", { desc = "Show LazyGit" })
    -- Quitting leader maps
keymap.set("n", "<leader>Q", "<cmd>wqa<cr>", { silent = true, desc = "Save all buffers and quit" })
keymap.set("n", "<leader>q", "<cmd>q<cr>", { silent = true, desc = "Quit"})
keymap.set("n", "<leader>w", "<cmd>wa<cr>", { desc = "Save all open buffers" })

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

keymap.set("n", "<leader><space>", "<cmd>StripTrailingWhitespace<cr>", { desc = "Remove trailing space" })
keymap.set("i", "jj", "<Esc>", { silent = true, desc = "Return to Normal Mode from Insert" })
