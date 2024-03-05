local keymap = vim.keymap
local api = vim.api
local uv = vim.loop

keymap.set("n", "<leader>q", "<cmd>x<cr>", { silent = true, desc = "Quit current window" })
keymap.set("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true, desc = "Force quit nvim" })
keymap.set("n", "<leader>q", "<cmd>wq<cr>", { silent = true, desc = "Save and quit nvim"})
keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })

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
