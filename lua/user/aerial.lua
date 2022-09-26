-- not being used
local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
    return
end

aerial.setup({
    -- Priority list of preferred backends for aerial.
    -- This can be a filetype map (see :help aerial-filetype-map)
    backends = {"lsp", "treesitter"}, -- putting treesitter first doesn't see variables etc.
    filter_kind = false,
    show_guides = true,
    -- default_bindings = true,

    on_attach = function(bufnr)
        -- Toggle the aerial window with <leader>a
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-o>', '<cmd>AerialToggle!<CR>', {})
        -- Jump forwards/backwards with '{' and '}'
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {})
        -- Jump up the tree with '[[' or ']]'
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
    end
})
