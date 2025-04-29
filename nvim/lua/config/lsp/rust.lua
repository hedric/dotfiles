vim.lsp.config.rust = {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    settings = {
        rust = {
            diagnostics = {
                enable = false,
            },
        },
    },
}

vim.lsp.enable("rust")
