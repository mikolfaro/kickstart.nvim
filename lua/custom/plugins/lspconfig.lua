-- local on_attach = require("plugins.configs.lspconfig").on_attach
-- local capabilities = require("plugins.configs.lspconfig").capabilities

return { -- Lsp config
    {
        'neovim/nvim-lspconfig',
        dependencies = { "pmizio/typescript-tools.nvim" },

        config = function ()
            local lspconfig = require "lspconfig"
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local servers = {
                -- npm install -g intelephense
                "intelephense",
                "lua_ls", -- TODO expand configs https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
                -- gem install ruby-lsp
                "ruby_lsp",
                "rust_analyzer",
                -- rustup component add rust-analyzer
            }

            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup({
                    capabilities = capabilities,
                })
            end

            lspconfig.rust_analyzer.setup {
                checkOnSave = false
            }

            lspconfig.ts_ls.setup{
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

            -- npm install -g @vue/language-server
            lspconfig.volar.setup{
                filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
                init_options = {
                    typescript = {
                        tsdk = vim.fn.expand(os.getenv("NVM_BIN") .. "/../lib/node_modules/typescript/lib")
                    }
                }
            }

            -- npm install -g @tailwindcss/language-server
            lspconfig.tailwindcss.setup{
                tailwindCSS = {
                    classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
                    includeLanguages = {
                        eelixir = "html-eex",
                        eruby = "erb",
                        htmlangular = "html",
                        templ = "html",
                        volar = "vue",
                    },
                    lint = {
                        cssConflict = "warning",
                        invalidApply = "error",
                        invalidConfigPath = "error",
                        invalidScreen = "error",
                        invalidTailwindDirective = "error",
                        invalidVariant = "error",
                        recommendedVariantOrder = "warning"
                    },
                    validate = true
                }
            }
        end
    }
}
