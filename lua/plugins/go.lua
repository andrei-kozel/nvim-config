return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "go", "gomod", "gosum", "gowork" },
    config = function()
      require("go").setup({
        -- Configure gopls to format using gofumpt
        gofmt = "goimports",
        -- Add support for running and debugging tests
        test_runner = "go",
        run_in_floaterm = true,
        -- Configure linting
        lsp_cfg = {
          settings = {
            gopls = {
              gofumpt = true,
              staticcheck = true,
              usePlaceholders = true,
              importShortcut = "Definition",
              completeUnimported = true,
              analyses = {
                unusedparams = true,
                shadow = true,
              },
            },
          },
        },
        -- Enhanced testing features
        test_efm = false,
        dap_debug = true,
        dap_debug_gui = true,
      })

      -- Add key mappings specifically for Go files
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = true, desc = desc })
      end

      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require("go.format").goimports()
        end,
        group = format_sync_grp,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "go",
        callback = function()
          -- Go specific mappings
          map("n", "<leader>gi", "<cmd>GoImport<CR>", "Go Import")
          map("n", "<leader>gfs", "<cmd>GoFillStruct<CR>", "Go Fill Struct")
          map("n", "<leader>gt", "<cmd>GoTest<CR>", "Go Test")
          map("n", "<leader>gtf", "<cmd>GoTestFunc<CR>", "Go Test Function")
          map("n", "<leader>gc", "<cmd>GoCoverage<CR>", "Go Coverage")
          map("n", "<leader>gr", "<cmd>GoRun<CR>", "Go Run")
          map("n", "<leader>ga", "<cmd>GoAlt!<CR>", "Go to Alternative File")
        end,
      })
    end,
    build = ':lua require("go.install").update_all_sync()',
  },
  -- Add tools for go development
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "gopls", -- Go language server
        "gofumpt", -- Stricter gofmt
        "goimports", -- Auto import management
        "gomodifytags", -- Modify struct tags
        "impl", -- Generate interface stubs
        "delve", -- Debugger
      })
    end,
  },
  -- Enhanced Go test coverage visualization
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "go", "gomod", "gosum", "gowork" })
      end
    end,
  },
}
