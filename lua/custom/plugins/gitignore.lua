return {
    { -- Git iggnore generator
        "wintermute-cell/gitignore.nvim",
        dependencies = {
            { "nvim-telescope/telescope.nvim" },
        },
        config = function()
            require('gitignore')
        end,
        cmd = "Gitignore",
        lazy = true
    }
}
