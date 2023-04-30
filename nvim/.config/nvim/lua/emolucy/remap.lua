-- set leader key to space
vim.g.mapleader = " "

-- move selected lines up and down (respects indentation)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- move line below onto current line
vim.keymap.set("n", "J", "mzJ`z")

-- while scrolling with C-u and C-d, keep the cursor in the center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- while moving between search terms keep them in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- cut and copy into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- ensure ctrl c and esc operate identically
vim.keymap.set("i", "<C-c>", "<Esc>")

-- format current file
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)

-- find and replace over current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- toggle filetree
vim.keymap.set("n", "<leader>t", vim.cmd.NvimTreeToggle)
-- focus filetree
vim.keymap.set("n", "<leader>fo", vim.cmd.NvimTreeFocus)

-- tab navigation
vim.keymap.set("n", "<leader>l", vim.cmd.BufferLineCycleNext)
vim.keymap.set("n", "<leader>h", vim.cmd.BufferLineCyclePrev)
vim.keymap.set("n", "<leader>L", vim.cmd.BufferLineMoveNext)
vim.keymap.set("n", "<leader>H", vim.cmd.BufferLineMovePrev)

vim.keymap.set("n", "<leader>x", vim.cmd.Bdelete)
