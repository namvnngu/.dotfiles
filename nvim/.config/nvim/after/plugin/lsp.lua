vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf --- @type number
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client then
            local ms = vim.lsp.protocol.Methods

            -- DIAGNOSTIC
            vim.diagnostic.config({ severity_sort = true })

            -- HOVER
            if client:supports_method(ms.textDocument_documentHighlight) then
                local hlgroup = vim.api.nvim_create_augroup(
                    "nn_lsp_highlight_symbol",
                    { clear = true }
                )

                vim.api.nvim_clear_autocmds({ buffer = bufnr, group = hlgroup })

                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                    group = hlgroup,
                    buffer = bufnr,
                    callback = vim.lsp.buf.document_highlight,
                })
                vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                    group = hlgroup,
                    buffer = bufnr,
                    callback = vim.lsp.buf.clear_references,
                })
            end

            -- FOLDING
            local winid = vim.api.nvim_get_current_win()
            if
                not vim.wo[winid][0].diff
                and client:supports_method(ms.textDocument_foldingRange)
            then
                vim.wo[winid][0].foldmethod = "expr"
                vim.wo[winid][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
            end

            -- SEMANTIC TOKENS
            client.server_capabilities.semanticTokensProvider = nil
            for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
                vim.api.nvim_set_hl(0, group, {})
            end

            -- COMPLETION
            -- if client:supports_method(ms.textDocument_completion) then
            --   vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
            -- end

            -- INLINE COLORS
            -- if client:supports_method(ms.textDocument_documentColor) then
            --   vim.lsp.document_color.enable(true, bufnr)
            -- end
        end
    end,
})

vim.lsp.config("*", {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
})

if vim.fn.executable("typos-lsp") then
    vim.lsp.config("typos_lsp", {
        init_options = { diagnosticSeverity = "Hint" },
    })
    vim.lsp.enable("typos_lsp")
end
