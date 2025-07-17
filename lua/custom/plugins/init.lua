-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Register blade template
vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
})

return {

  { -- Autosave
    'pocco81/auto-save.nvim',
    config = function()
      require('auto-save').setup {
        debounce_delay = 1250,
      }
    end,
  },

  {
    'rebelot/kanagawa.nvim',
    config = function ()
      vim.cmd.colorscheme 'kanagawa-dragon'
    end,
  },

  { -- Darcula Theme
    'doums/darcula',
    config = function()
      -- Load the color scheme
      -- vim.cmd.colorscheme 'darcula'
    end,
  },

  { -- Fugitive
    'tpope/vim-fugitive',
  },

  { -- Improvements on quickfix buffer
    'romainl/vim-qf',
    -- config = function()
    --   require('vim-qf')
    -- end,
  },

  { -- Side by side diff view
    'sindrets/diffview.nvim'
  },

  -- {
  --   dir = "~/workspace_spikes/present.nvim",
  --   config = function ()
  --     require "present"
  --   end
  -- }
}
