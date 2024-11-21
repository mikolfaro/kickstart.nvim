-- local on_attach = require("plugins.configs.lspconfig").on_attach
-- local capabilities = require("plugins.configs.lspconfig").capabilities

return { -- Lsp config
    {
        'neovim/nvim-lspconfig',
        config = function ()
            local lspconfig = require "lspconfig"

            lspconfig.ts_ls.setup {
                init_options = {
                    plugins = { -- I think this was my breakthrough that made it work
                        {
                            name = "@vue/typescript-plugin",
                            location = "~/.nvm/versions/node/v22.5.1/lib/node_modules/@vue/language-server",
                            -- npm install -g @vue/typescript-plugin @vue/language-server
                            -- npm root -g
                            languages = { "vue" },
                        },
                    },
                },
                filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
            }

            lspconfig.volar.setup {}
        end
    }
}
