vim.loader.enable()

local core_conf_files = {
	"options.vim",
	"globals.lua",
	"plugins.lua",
	"mappings.lua",
    "dap-config.lua",
}

local viml_conf_dir = vim.fn.stdpath("config") .. "/vim_lang"
-- source all config files
for _, file_name in ipairs(core_conf_files) do
	if vim.endswith(file_name, 'vim') then
		local path = string.format("%s/%s", viml_conf_dir, file_name)
		local source_cmd = "source " .. path
		vim.cmd(source_cmd)
	else
		local module_name, _ = string.gsub(file_name, "%.lua", "")
		package.loaded[module_name] = nil
		require(module_name)
	end
end

current_theme = "rose-pine"

color = color or current_theme
vim.cmd.colorscheme(color)

vim.cmd([[
"ToggleWhitespaces"
]])

if vim.lsp.inlay_hint then
  vim.lsp.inlay_hint.enable(0, true)
end

vim.g.tabby_keybinding_accept = '<Tab>'
