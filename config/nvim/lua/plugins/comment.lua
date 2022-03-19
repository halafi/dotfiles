require("Comment").setup({
    -- integrate with nvim-ts-context-commentstring
    pre_hook = function(ctx)
        if vim.bo.filetype == 'typescriptreact' then
            local comment_utils = require("Comment.utils")
            local type = ctx.ctype == comment_utils.ctype.line and "__default" or "__multiline"

            local location
            if ctx.ctype == comment_utils.ctype.block then
                location = require("ts_context_commentstring.utils").get_cursor_location()
            elseif ctx.cmotion == comment_utils.cmotion.v or ctx.cmotion == comment_utils.cmotion.V then
                location = require("ts_context_commentstring.utils").get_visual_start_location()
            end

            return require("ts_context_commentstring.internal").calculate_commentstring({
                key = type,
                location = location,
            })
        end
    end,
})
