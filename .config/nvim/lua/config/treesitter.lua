local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = { "toml", "c", "lua", "rust", "python", "bash", "typescript", "java", "vim", "vimdoc", "query", "javascript", "html" },
    sync_install = false,
    auto_install = true,
    highlight = { 
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },  
})
