local dap = require("dap")
local dapui = require("dapui")
-- local daptext = require("nvim-dap-virtual-text")

dapui.setup({
    layouts = {
        {
            elements = {
                "console",
            },
            size = 7,
            position = "bottom",
        },
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "watches",
            },
            size = 40,
            position = "left",
        }
    },
})


dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open(1)
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.api.nvim_set_keymap("n", "<Home>", function() dapui.open() end, { noremap = true })
vim.api.nvim_set_keymap("n", "<End>", dapui.close(), { noremap = true })
vim.api.nvim_set_keymap("n", "<leader><leader>", dapui.close(), { noremap = true })

vim.api.nvim_set_keymap("n", "<Up>", dap.continue(), { noremap = true })
vim.api.nvim_set_keymap("n", "<Down>", dap.step_over(), { noremap = true })
vim.api.nvim_set_keymap("n", "<Right>", dap.step_into(), { noremap = true })
vim.api.nvim_set_keymap("n", "<Left>", dap.step_out(), { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>BB", dap.toggle_breakpoint(), { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>BC", dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')), { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>rc", dap.run_to_cursor(), { noremap = true })
