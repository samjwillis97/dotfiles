require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "yaml",
    "toml",
    "json",
    "jsonc",
    "lua",
    "typescript",
    "python",
    "go",
    "css",
    "svelte",
    "dockerfile",
    "nix",
    "c_sharp"
  }
}
