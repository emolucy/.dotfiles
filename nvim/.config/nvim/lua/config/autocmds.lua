local augroup = vim.api.nvim_create_augroup("Autocmds", { clear = true })

-- auto close nvim-tree and outline
vim.api.nvim_create_autocmd({ "QuitPre" }, {
    group = augroup,
    callback = function()
        vim.cmd("NvimTreeClose")
        vim.cmd("OutlineClose")
    end,
})
