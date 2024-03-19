local fn = vim.fn

local function trailing_space()
    if not vim.o.modifiable then
        return ""
    end

    local line_num = nil

    for i = 1, fn.line("$") do
        local linetext = fn.getline(i)
        -- To prevent invalid escape error, we wrap the regex string with `[[]]`.
        local idx = fn.match(linetext, [[\v\s+$]])

        if idx ~= -1 then
            line_num = i
            break
        end
    end

    local msg = ""
    if line_num ~= nil then
        msg = string.format(" TRL")
    end

    return msg
end

local function mixed_indent()
    if not vim.o.modifiable then
        return ""
    end

    local space_pat = [[\v^ +]]
    local tab_pat = [[\v^\t+]]
    local space_indent = fn.search(space_pat, "nwc")
    local tab_indent = fn.search(tab_pat, "nwc")
    local mixed = (space_indent > 0 and tab_indent > 0)
    local mixed_same_line
    if not mixed then
        mixed_same_line = fn.search([[\v^(\t+ | +\t)]], "nwc")
        mixed = mixed_same_line > 0
    end
    if not mixed then
        return ""
    end
    if mixed_same_line ~= nil and mixed_same_line > 0 then
        return " " .. mixed_same_line
    end
    local space_indent_cnt = fn.searchcount({ pattern = space_pat, max_count = 1e3 }).total
    local tab_indent_cnt = fn.searchcount({ pattern = tab_pat, max_count = 1e3 }).total
    if space_indent_cnt > tab_indent_cnt then
        return " " .. tab_indent
    else
        return " " .. space_indent
    end
end

require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "auto",
        -- component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        -- section_separators = "",
        component_separators = "",
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            "branch",
        },
        lualine_c = {
            {
                "buffers",
                show_filename_only = true,   -- Shows shortened relative path when set to false.
                hide_filename_extension = false,   -- Hide filename extension when set to true.
                show_modified_status = true, -- Shows indicator when the buffer is modified.

                mode = 0,
                max_length = vim.o.columns * 2 / 3,

                symbols = {
                    modified = ' ●',      -- Text to show when the buffer is modified
                    alternate_file = '', -- Text to show to identify the alternate file
                    directory =  '',     -- Text to show when the buffer is a directory
                },
            },
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                symbols = { error = '🆇 ', warn = ' ', info = ' ', hint = ' ' },
            },
        },
        lualine_x = {
            {
                trailing_space,
            },
            {
                mixed_indent,
                color = "WarningMsg",
            },
            "encoding",
            {
                "fileformat",
                symbols = {
                    unix = " ",
                    dos = "󰨡 ",
                    mac = "󰀶 ",
                },
            },
            "filetype",
            'ctime',
        },
        lualine_z = {
            "location",
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = { "quickfix", "fugitive", "nvim-tree" },
}
