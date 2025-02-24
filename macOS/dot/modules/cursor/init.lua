return {
    brew = { "cursor" },
    config = {
        {
            source = "./settings.json",
            output = "~/Library/Application Support/Cursor/User/settings.json",
        },
        {
            source = "./keybindings.json",
            output = "~/Library/Application Support/Cursor/User/keybindings.json",
        },
        -- {
        --     source = "./extensions.json",
        --     output = "~/.cursor/extensions/extensions.json",
        -- },
    },
}