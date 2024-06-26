local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup({
    options = {
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        -- close_command = "Bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
        indicator = {
            style = 'underline'
        }
    },
})
