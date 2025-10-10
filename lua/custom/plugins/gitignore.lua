return {
    { -- Git iggnore generator
        "wintermute-cell/gitignore.nvim",
        dependencies = {
            { "nvim-telescope/telescope.nvim" },
        },
        config = function()
            require('gitignore')

            vim.g.gitignore_nvim_overwrite = false
        end,
        cmd = "Gitignore",
        lazy = true
    }
}
