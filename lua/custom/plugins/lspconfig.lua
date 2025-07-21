-- local on_attach = require("plugins.configs.lspconfig").on_attach
-- local capabilities = require("plugins.configs.lspconfig").capabilities

return { -- Lsp config
    {
        'neovim/nvim-lspconfig',
        dependencies = { "pmizio/typescript-tools.nvim" },

        config = function ()
            local servers = {
                "clangd",
                -- npm install -g intelephense
                "intelephense",
                "lua_ls", -- TODO expand configs https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
                -- go install github.com/nametake/golangci-lint-langserver@latest
                -- go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
                "golangci_lint_ls",
                -- go install golang.org/x/tools/gopls@latest
                "gopls",
                -- gem install ruby-lsp
                "ruby_lsp",
                -- rustup component add rust-analyzer
                "rust_analyzer",
                "ts_ls",
            }

            -- for _, lsp in ipairs(servers) do
            --     vim.lsp.config(lsp, {
            --         settings = {
            --             [lsp] = {},
            --         }
            --     })
            -- end

           vim.lsp.config('rust_analyzer', {
                -- Server-specific settings. See `:help lspconfig-setup`
                settings = {
                    ['rust-analyzer'] = { checkOnSave = false },
                },
            })

            vim.lsp.config('ts_ls', {
                settings = {
                    ['ts_ls'] = {
                        init_options = {
                            plugins = {
                                {
                                    name = "@vue/typescript-plugin",
                                    -- npm install -g @vue/typescript-plugin typescript-language-server typescript 
                                    location = vim.fn.expand(os.getenv("NVM_BIN") .. "/../lib/node_modules/@vue/typescript-plugin"),
                                    languages = {"javascript", "typescript", "vue"},
                                },
                                                        },
                                                },
                                                filetypes = {
                                                        "javascript",
                                                        "typescript",
                                                        "vue",
                                                },
                    }
                }
            })

            -- -- npm install -g @vue/language-server
            -- lspconfig.volar.setup{
            --     filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
            --     init_options = {
            --         typescript = {
            --             tsdk = vim.fn.expand(os.getenv("NVM_BIN") .. "/../lib/node_modules/typescript/lib")
            --         }
            --     }
            -- }
            --
            -- -- npm install -g @tailwindcss/language-server
            -- lspconfig.tailwindcss.setup{
            --     tailwindCSS = {
            --         classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
            --         includeLanguages = {
            --             eelixir = "html-eex",
            --             eruby = "erb",
            --             htmlangular = "html",
            --             templ = "html",
            --             volar = "vue",
            --         },
            --         lint = {
            --             cssConflict = "warning",
            --             invalidApply = "error",
            --             invalidConfigPath = "error",
            --             invalidScreen = "error",
            --             invalidTailwindDirective = "error",
            --             invalidVariant = "error",
            --             recommendedVariantOrder = "warning"
            --         },
            --         validate = true
            --     }
            -- }

           vim.lsp.enable(servers)
        end
    }
}
