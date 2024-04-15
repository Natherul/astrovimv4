return {
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = {
      options = {
        opt = {
          relativenumber = true, -- sets vim.opt.relativenumber
          number = true, -- sets vim.opt.number
          spell = false, -- sets vim.opt.spell
          signcolumn = "auto", -- sets vim.opt.signcolumn to auto
          wrap = false, -- sets vim.opt.wrap
          autochdir = false,
          tabstop = 4,
          softtabstop = 4,
          shiftwidth = 4,
          -- Save undos longer so if we close vim its saved
          swapfile = false,
          backup = false,
          undodir = os.getenv("HOME") .. "/.vim/undodir",
          undofile = true,
          -- Faster update speed, default i 4000
          updatetime = 50,
          -- Allow for seeing if search is hitting anything
          hlsearch = false,
          incsearch = true,
        },
      },
    },
  },
}
