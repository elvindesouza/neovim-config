local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- code action sources
local code_actions = null_ls.builtins.code_actions

-- hover sources
local hover = null_ls.builtins.hover

-- completion sources
local completion = null_ls.builtins.completion

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup({
    -- on_init = function(new_client, _)
    --     new_client.offset_encoding = "utf-16"
    -- end,
    sources = {
        code_actions.proselint,
        code_actions.refactoring,

        completion.spell.with({
            filetypes = { "text", "markdown" },
        }),

        -- diagnostics.cppcheck,
        diagnostics.codespell,
        -- diagnostics.mdl,
        diagnostics.mypy,
        diagnostics.proselint,
        diagnostics.commitlint,
        diagnostics.djlint,
        diagnostics.gitlint,
        diagnostics.hadolint,
        diagnostics.markdownlint,
        diagnostics.mypy,
        diagnostics.perlimports,
        diagnostics.pylint.with({
            diagnostics_postprocess = function(diagnostic)
                diagnostic.code = diagnostic.message_id
            end,
        }),
        diagnostics.textlint,
        -- diagnostics.vale,
        diagnostics.write_good,

        formatting.isort,
        formatting.djhtml,
        formatting.isort,
        -- formatting.pyink,
        formatting.clang_format,
        formatting.shfmt,
        -- formatting.codespell,
        formatting.shellharden,
        formatting.prettier.with({
            extra_filetypes = { "toml" },
            extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
        }),
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.stylua,
        -- formatting.textlint,
        -- formatting.markdownlint,

        -- [[ formatting.isort, use pyrightorganizeimports]]


        hover.printenv,
        hover.dictionary,
    },
})
