-- Set the “leader” key to Space for all mappings below
vim.g.mapleader = " "

-- In normal mode, `<leader>pv` opens the built-in file explorer (`:Ex`)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- In visual mode, `J` moves the selected block down one line and reselects it
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- In visual mode, `K` moves the selected block up one line and reselects it
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- In normal mode, `J` joins the current line with the one below it,
-- but keep the cursor in place (marks start/end to avoid jumping)
vim.keymap.set("n", "J", "mzJ`z")

-- In normal mode, `<C-d>` scrolls half-page down and then centers the cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- In normal mode, `<C-u>` scrolls half-page up and then centers the cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- After searching, `n` (next match) keeps the match line centered & unfolds it
vim.keymap.set("n", "n", "nzzzv")
-- After searching, `N` (previous match) keeps the match line centered & unfolds it
vim.keymap.set("n", "N", "Nzzzv")

-- In visual-select (“x”) mode, `<leader>p` pastes over selection without
-- overwriting the default register (uses the black-hole register)
vim.keymap.set("x", "<leader>p", [["_dP]])

-- In normal & visual modes, `<leader>y` yanks into the system clipboard (“+” register)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- In normal mode, `<leader>Y` yanks the rest of the line into the system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- In normal & visual modes, `<leader>d` deletes into the black-hole register (no yank)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- In insert mode, `<C-c>` behaves like `<Esc>` (exit insert mode)
vim.keymap.set("i", "<C-c>", "<Esc>")
-- In insert mode, typing `jj` quickly also exits insert mode
vim.keymap.set("i", "jj", "<Esc>")

-- Disable the default `Q` command in normal mode (no-op)
vim.keymap.set("n", "Q", "<nop>")
-- In normal mode, `<C-f>` opens a new tmux window running your session chooser
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- In normal mode, `<leader>f` formats the current buffer via LSP
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- In normal mode, `<C-k>` jumps to the next item in the quickfix list and centers it
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- In normal mode, `<C-j>` jumps to the previous quickfix entry and centers it
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- In normal mode, `<leader>k` jumps to the next location list item and centers it
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- In normal mode, `<leader>j` jumps to the previous location list item and centers it
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- In normal mode, `<leader>s` starts a case-insensitive, global search-&-replace
-- for the word under the cursor, positioning you to fill in the replacement
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- In normal mode, `<leader>x` makes the current file executable (`chmod +x`)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- trigger a refactor
vim.keymap.set("n", "<leader>rr", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", { noremap = true, silent = false })

-- shift tab to jump between windows
vim.keymap.set("n", "<leader>w", "<C-w>W", { noremap = true })
