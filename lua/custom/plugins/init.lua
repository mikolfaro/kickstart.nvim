-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  { -- Autosave
    'pocco81/auto-save.nvim',
    config = function()
      require('auto-save').setup {
<<<<<<< HEAD
        debounce_delay = 1250,
      }
    end,
  },

  { -- Darcula Theme
    'doums/darcula',
    config = function()
      -- Load the color scheme
      vim.cmd.colorscheme 'darcula'
    end,
  },

  { -- Fugitive
    'tpope/vim-fugitive',
=======
        debounce_delay = 500,
      }
    end,
>>>>>>> e559230 (Add fugitive)
  },

  { -- Darcula Theme
    'doums/darcula',
    config = function()
      -- Load the color scheme
      vim.cmd.colorscheme 'darcula'
    end,
  },

  { -- Fugitive
    'tpope/vim-fugitive',
  },
}
