return {
  -- Rust tools for enhanced Rust development experience
  {
    "simrat39/rust-tools.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
    ft = { "rust" },
    config = function()
      local rt = require("rust-tools")
      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            -- Runnables
            vim.keymap.set("n", "<leader>rr", rt.runnables.runnables, { buffer = bufnr })
            -- Expand macros
            vim.keymap.set("n", "<leader>re", rt.expand_macro.expand_macro, { buffer = bufnr })
          end,
          settings = {
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
              imports = {
                granularity = {
                  group = "module",
                },
                prefix = "self",
                -- Enable auto-import
                merge = {
                  glob = true,
                },
              },
              checkOnSave = {
                command = "clippy",
              },
              cargo = {
                allFeatures = true,
              },
              procMacro = {
                enable = true,
              },
            },
          },
        },
        tools = {
          inlay_hints = {
            auto = true,
            show_parameter_hints = true,
          },
        },
      })
    end,
  },
  -- Crates.io integration for better cargo dependency management
  {
    "saecki/crates.nvim",
    tag = "stable",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "rust", "toml" },
    config = function()
      require("crates").setup({
        popup = {
          autofocus = true,
        },
        null_ls = {
          enabled = true,
        },
      })
      -- Add key mappings for crates.nvim
      vim.keymap.set("n", "<leader>ct", require("crates").toggle, { desc = "Toggle Crates" })
      vim.keymap.set("n", "<leader>cr", require("crates").reload, { desc = "Reload Crates" })
      vim.keymap.set("n", "<leader>cv", require("crates").show_versions_popup, { desc = "Show Crate Versions" })
      vim.keymap.set("n", "<leader>cf", require("crates").show_features_popup, { desc = "Show Crate Features" })
    end,
  },
}
