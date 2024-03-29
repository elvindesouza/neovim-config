local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local icons = require("user.icons")
local tree_cb = nvim_tree_config.nvim_tree_callback
--[[ local utils = require("nvim-tree.utils") ]]

--[[ utils.notify.warn = notify_level(vim.log.levels.WARN) ]]
--[[ utils.notify.error = notify_level(vim.log.levels.ERROR) ]]
--[[ utils.notify.info = notify_level(vim.log.levels.INFO) ]]
--[[ utils.notify.debug = notify_level(vim.log.levels.DEBUG) ]]

local function open_nvim_tree()
    local IGNORED_FT = {
        "startify",
        "dashboard",
        "alpha",
    }

    -- skip ignored filetypes
    if vim.tbl_contains(IGNORED_FT, filetype) then
        return
    end

    -- open the tree
    require("nvim-tree.api").tree.open()
end

nvim_tree.setup({
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    hijack_unnamed_buffer_when_opening = true,
    hijack_cursor = true,
    --[[ hijack_directories = { ]]
    --[[ 	enable = false, ]]
    --[[ }, ]]
    filters = {
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
        mappings = {
            list = {
                { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
                { key = "h",                  cb = tree_cb("close_node") },
                { key = "v",                  cb = tree_cb("vsplit") },
            },
        },
    },
})
