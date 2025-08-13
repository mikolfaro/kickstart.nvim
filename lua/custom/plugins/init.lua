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
vim.keymap.set('n', '<leader>pv', '<cmd>Explore<CR>', {
        desc = 'Open current file directory'
})
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

-- Open buffer git history via telescope-git-file-history.nvim
vim.keymap.set('n', '<leader>gh', function ()
  require("telescope").extensions.git_file_history.git_file_history()
end, { desc = 'Browse git history of current buffer' })

-- LSP Rename ???
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)

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
    config = function()
      -- Function to detect if system is using light theme
      local function is_system_light_theme()
        local handle = io.popen('gsettings get org.gnome.desktop.interface gtk-theme 2>/dev/null')
        if handle then
          local result = handle:read('*a'):gsub('\n', ''):gsub("'", '')
          handle:close()
          return result:lower():find('light') ~= nil
        end
        return false
      end
      
      local current_theme = nil
      
      -- Function to update theme if needed
      local function update_theme()
        local is_light = is_system_light_theme()
        local new_theme = is_light and 'kanagawa-lotus' or 'kanagawa-dragon'
        
        if current_theme ~= new_theme then
          vim.cmd.colorscheme(new_theme)
          current_theme = new_theme
        end
      end
      
      -- Set initial theme
      update_theme()
      
      -- Watch for changes every 5 seconds
      local timer = vim.loop.new_timer()
      timer:start(5000, 5000, vim.schedule_wrap(update_theme))
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
