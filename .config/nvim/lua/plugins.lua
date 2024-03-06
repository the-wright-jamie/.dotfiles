-- local utils = require("utils")

-- load lazy
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

-- specify plugins
local plugin_specs = {
    { "andweeb/presence.nvim", lazy = false },
    { "nvim-telescope/telescope.nvim",
        dependencies = { 
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-lua/plenary.nvim"
        }
    },
    -- nvim v0.8.0
    {
        "kdheepak/lazygit.nvim",
    	cmd = {
    		"LazyGit",
    		"LazyGitConfig",
    		"LazyGitCurrentFile",
    		"LazyGitFilter",
    		"LazyGitFilterCurrentFile",
    	},
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        -- event = 'InsertEnter',
        event = "VeryLazy",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "onsails/lspkind-nvim",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-omni",
            "hrsh7th/cmp-emoji",
            "quangnguyen30192/cmp-nvim-ultisnips",
        },
        config = function()
            require("config.nvim-cmp")
        end,
    },
	{ "wakatime/vim-wakatime", lazy = false },
	{ "nvim-lua/plenary.nvim" },
	{ "williamboman/mason.nvim" },
	{ "fladson/vim-kitty" },
	{ "Shadorain/shadotheme" },
	{
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("config.statusline")
        end,
	},
	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-telescope/telescope-symbols.nvim",
		},
	},
}

-- configuration for lazy itself.
local lazy_opts = {
  ui = {
    border = "rounded",
    title = "Plugin Manager",
    title_pos = "center",
  },
}

require("lazy").setup(plugin_specs, lazy_opts)
require("mason").setup()
require("presence").setup({
    -- The setup config table shows all available config options with their default values:
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "masochism simulator", -- Text displayed when hovered over the Neovim image
    main_image          = "file",                     -- Main image display (either "neovim" or "file")
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = false,                      -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = false,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = true,                       -- Show the timer

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})
