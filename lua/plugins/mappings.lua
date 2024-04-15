return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(function(bufnr)
                require("astrocore.buffer").close(bufnr)
              end)
            end,
            desc = "Pick to close",
          },
          -- tables with the `name` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<Leader>b"] = { name = "Buffers" },
          -- quick save
          ["<leader><Up>"] = { 
            function()
              vim.api.nvim_command(":m-" .. vim.fn.input("How many lines to move up (add one extra)? ") .. "<Enter>")
            end,
            desc = "Move line up" },
          ["<leader><Down>"] = {
            function()
              vim.api.nvim_command(":m+" .. vim.fn.input("How many lines to move down? ") .. "<Enter>")
            end,
            desc="Move line down"
          },
          -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
        v = {
          ["<leader><Up>"] = {
            function()
              vim.api.nvim_command(":m-" .. vim.fn.input("How many lines to move selection up (add one line extra)? ") .. "<Enter>")
            end,
            desc="Move selected lines up"
          },
          ["<leader><Down>"] = {
            function()
              vim.api.nvim_command(":m+" .. vim.fn.input("How many lines to move selection down? ") .. "<Enter>")
            end,
            desc="Move selected lines down"
          },
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function()
              vim.lsp.buf.hover()
            end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function()
              vim.lsp.buf.declaration()
            end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
