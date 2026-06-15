return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        settings = {
          pyright = {
            disableorganizeimports = true,
          },
          python = {
            analysis = {
              ignore = { "*" },
            },
          },
        },
      },
    },
  },
}
