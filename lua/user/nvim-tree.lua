local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local icons = require("user.icons")
local api = require("nvim-tree.api")

local function edit_or_open()
    local node = api.tree.get_node_under_cursor()

    if node.nodes ~= nil then
        -- expand or collapse folder
        api.node.open.edit()
    else
        -- open file
        api.node.open.edit()
        -- Close the tree if file was opened
        api.tree.close()
    end
end

-- open as vsplit on current node
local function vsplit_preview()
    local node = api.tree.get_node_under_cursor()
    if node.nodes ~= nil then
        -- expand or collapse folder
        api.node.open.edit()
    else
        -- open file as vsplit
        api.node.open.vertical()
    end
    -- Finally refocus on tree if it was lost
    api.tree.focus()
end

local function my_on_attach(bufnr)
    local api = require("nvim-tree.api")
    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
    vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
    vim.keymap.set("n", "h", api.tree.close, opts("Close"))
    vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
end

nvim_tree.setup({
    on_attach = my_on_attach,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- 	hijack_unnamed_buffer_when_opening = true,
    -- 	hijack_cursor = true,
    -- 	--[[ hijack_directories = { ]]
    -- 	--[[ 	enable = false, ]]
    -- 	--[[ }, ]]
    filters = {
        dotfiles = true,
        custom = { ".git" },
        exclude = { ".gitignore" },
    },
    sync_root_with_cwd = true,
    renderer = {
        root_folder_modifier = ":t",
        icons = {
            webdev_colors = true,
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = icons.ui.ArrowOpen,
                    arrow_closed = icons.ui.ArrowClosed,
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = icons.diagnostics.Hint,
            info = icons.diagnostics.Information,
            warning = icons.diagnostics.Warning,
            error = icons.diagnostics.Error,
        },
    },
    view = {
        width = 30,
        side = "left",
    },
})
