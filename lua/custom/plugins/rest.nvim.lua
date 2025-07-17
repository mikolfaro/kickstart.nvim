return {
    { -- REST client
        "rest-nvim/rest.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            opts = function (_, opts)
                vim.bo.formatexpr = ""
                vim.bo.formatprg = "jq"

                opts.ensure_installed = opts.ensure_installed or {}
                table.insert(opts.ensure_installed, "http")
            end,
        }
    }
}
