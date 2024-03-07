vim.loader.enable()

local core_conf_files = {
	"options.vim",
	"globals.lua",
	"plugins.lua",
	"mappings.lua",
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
