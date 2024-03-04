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

  { -- Ollama
    'nomnivore/ollama.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    cmd = { 'Ollama', 'OllamaModel', 'OllamaServe', 'OllamaServeStop' },

    keys = {
      -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
      {
        '<leader>oo',
        ":<c-u>lua require('ollama').prompt()<cr>",
        desc = 'ollama prompt',
        mode = { 'n', 'v' },
      },

      -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
      {
        '<leader>oG',
        ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
        desc = 'ollama Generate Code',
        mode = { 'n', 'v' },
      },
    },

    opts = {
      model = 'wizard-vicuna-uncensored:latest',
      url = 'http://10.12.14.2:11434',
    },
  },
}
