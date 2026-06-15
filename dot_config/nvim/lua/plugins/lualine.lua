return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "auto",
      globalstatus = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function(str)
            return str:sub(1, 1)
          end,
        },
      },
      lualine_b = {
        { "branch", icon = "" },
        "diff",
        {
          "diagnostics",
          symbols = {
            error = " ",
            warn = " ",
            info = " ",
            hint = " ",
          },
        },
      },
      lualine_c = {
        {
          "filename",
          path = 1,
          symbols = {
            modified = "  ●",
            readonly = " ",
            unnamed = "[No Name]",
            newfile = " ",
          },
        },
      },
      lualine_x = {
        {
          function()
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            if #clients == 0 then
              return ""
            end
            return " " .. clients[1].name
          end,
        },
        {
          function()
            local reg = vim.fn.reg_recording()
            return reg == "" and "" or " recording @" .. reg
          end,
        },
        {
          function()
            return vim.wo.spell and " " or ""
          end,
        },
        {
          function()
            if vim.v.hlsearch == 0 then
              return ""
            end
            local result = vim.fn.searchcount({ maxcount = 999 })
            return result.total > 0 and (" " .. result.current .. "/" .. result.total) or ""
          end,
        },
        "encoding",
        "fileformat",
        { "filetype", colored = true },
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
