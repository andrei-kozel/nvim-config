return {
  "laytan/cloak.nvim",
  config = function()
    require("cloak").setup({
      enable = true,
      cloak_character = "*",
      hightlight_group = "Comment",
      cloak_length = nil,
      patterns = {
        {
          file_pattern = ".env*",
          cloak_pattern = "=.+",
        },
      },
    })
  end,
}
