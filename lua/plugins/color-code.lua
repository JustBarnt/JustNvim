return {
    {
        "brenoprata10/nvim-highlight-colors",
        event = "BufReadPre",
        opts = {
            render = 'virtual',
            enabled_named_colors = true,
            enabled_tailwind = true,
        }
    },
}
