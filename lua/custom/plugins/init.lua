-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  { -- Autosave
    'pocco81/auto-save.nvim',
    config = function()
      require('auto-save').setup {
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
  },

  -- { -- Parrot
  --   'frankroeder/parrot.nvim',
  --   dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
  --   config = function()
  --     require("parrot").setup {
  --       providers = {
  --         anthropic = {
  --           api_key = os.getenv("ANTHROPIC_API_KEY"),
  --         },
  --       },
  --     }
  --   end,
  -- }

}
