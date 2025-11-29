require("neo-tree").setup({
    close_if_last_window = false,
    filesystem = {
        follow_current_file = {
            enabled = true
        },
        filtered_items = {
            visible = true,
            show_hidden_count = true,
            hide_dotfiles = false,
            hide_gitignore = false
        },
        window = {
            position = "right"
        }
   }
})
