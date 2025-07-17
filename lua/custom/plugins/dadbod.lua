return {
    { -- Database UI + Database completion
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod', lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql', 'mariadb' }, lazy = true }, -- Optional
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1

            -- Prevent code folding in result buffer
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "dbout",
                callback = function ()
                    vim.opt_local.foldenable = false
                end
            })
        end,
    }
}
