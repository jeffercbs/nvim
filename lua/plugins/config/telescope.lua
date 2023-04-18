local options = {
    defaults = {
        prompt_position = "top",
        layout_strategy = "horizontal",
    },
    file_ignore_patterns = {
        ".git/",
        "node_modules/",
        ".cache/",
        ".next/",
        ".DS_Store",
        "*.png",
        "*.jpg",
        "*.jpeg",
        "*.gif",
        "*.pdf",
        "*.md",
        "*.txt",
        "*.json",
        "*.xml",
        "*.yaml",
        "*.yml",
        "*.log",
    },
    mappings = {
        ["i"] = {
            ["<C-k>"] = "previous",
            ["<C-j>"] = "next",
        },
    },
}

return options