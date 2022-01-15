vim.opt.list = true

require("indent_blankline").setup {
    use_treesitter = true,
    show_current_context = true,
    context_patterns = {
        "class",
        "function",
        "method",
        "block",
        "arguments",
        "typedef",
        "while",
        "return",
        "if_statement",
        "else_clause",
        "jsx_element",
        "jsx_self_closing_element",
        "try_statement",
        "catch_clause",
        "import_statement",
        "labeled_statement",
        "^for",
        "^object",
        "^table",
    },
}
