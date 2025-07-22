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

-- Terminal
vim.keymap.set('n', '<leader>T', function ()
    vim.cmd('vsplit')
    vim.cmd('terminal')
    vim.cmd('startinsert')
end, {
    desc = 'Open new terminal'
})

-- Folder view
vim.keymap.set('n', '<leader>pV', '<cmd>Vexplore<CR>', {
        desc = 'Open current file directory in new tab'
})

-- Quickfix navigation
vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>', {
        desc = 'Go to next quickfix'
})
vim.keymap.set('n', '<M-k>', '<cmd>cprev<CR>', {
        desc = 'Go to previous quickfix'
})

-- Yank buffer absolute path
vim.keymap.set('n', '<leader>yp', function()
  vim.fn.setreg('+', vim.fn.expand('%'))
end, { desc = 'Yank relative path of current buffer' })

vim.keymap.set('n', '<leader>yP', function()
  vim.fn.setreg('+', vim.fn.expand('%:p'))
end, { desc = 'Yank absolute path to buffer' })

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

  { -- Rest and GrapQL client
    "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>Rs", desc = "Send request" },
      { "<leader>Ra", desc = "Send all requests" },
      { "<leader>Rb", desc = "Open scratchpad" },
    },
    ft = {"http", "rest"},
    opts = {
      global_keymaps = false,
      global_keymaps_prefix = "<leader>R",
      kulala_keymaps_prefix = "",
    },
  },

  -- {
  --   dir = "~/workspace_spikes/present.nvim",
  --   config = function ()
  --     require "present"
  --   end
  -- }
}
