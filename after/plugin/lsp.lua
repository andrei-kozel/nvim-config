local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)


require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here 
    -- with the ones you want to install
    ensure_installed = {'tsserver', 'rust_analyzer'},
    handlers = {
        lsp_zero.default_setup,
    },
})

local cmp = require("cmp")         
local cmp_action = lsp_zero.cmp_action()         
cmp.setup({                 
    mapping = {                         
        ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        ["<Tab>"] = cmp_action.luasnip_supertab(),  
        ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
    },                 
})

lsp_zero.setup()
