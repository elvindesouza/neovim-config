local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
    return
end

indent_blankline.setup({
    -- char = "▏",
    -- show_trailing_blankline_indent = false,
    -- show_first_indent_level = true,
    -- use_treesitter = true,
    -- show_current_context = true,
    exclude = {
        filetypes = {
            "help",
            "packer",
            "startify",
            "dashboard",
            "packer",
            "neogitstatus",
            "NvimTree",
            "Trouble",
            "text",
        },
        buftypes = { "terminal", "nofile" },
    },
})
