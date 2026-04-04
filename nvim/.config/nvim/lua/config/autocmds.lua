local augroup = vim.api.nvim_create_augroup("Autocmds", { clear = true })

-- auto close nvim-tree and outline
vim.api.nvim_create_autocmd({ "QuitPre" }, {
    group = augroup,
    callback = function()
        local ft = vim.bo.filetype
        pcall(vim.cmd, "NvimTreeClose")
        pcall(vim.cmd, "OutlineClose")
        if ft == "NvimTree" or ft == "Outline" then
            vim.cmd("qall")
        end
    end,
})
