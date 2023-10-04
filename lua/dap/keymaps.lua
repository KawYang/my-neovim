local keymap = vim.keymap
local jdtls_util = require('jdtls.util')

-- format 快捷方式
keymap.set('n', '¬', ':AutoformatLine<CR>')
keymap.set('n', '<M-CR>', ':lua vim.lsp.buf.code_action()<CR>')
-- debug 配置

function attach_to_debug(port)
    local dap = require('dap')

    dap.configurations.java = {{
        type = 'java',
        request = 'attach',
        name = 'java attach',
        hostName = '127.0.0.1',
        port = port,
    }}

    dap.adapters.java = function(callback, config)
        jdtls_util.execute_command({
            command = 'vscode.java.startDebugSession'
        }, function(err0, port)
                assert(not err0, vim.inspect(err0))
                callback({
                    type = 'server',
                    host = '127.0.0.1',
                    port = port
                })
            end)
    end

    local dapui = require("dapui")
    dapui.setup({
        layouts = {{
            elements = {{
                id = "stacks",
                size = 0.4
            }, {
                    id = "breakpoints",
                    size = 0.4
                }, {
                    id = "watches",
                    size = 0.2
                }},
            position = "left",
            size = 40
        }, {
                elements = {{
                    id = "repl",
                    size = 0.2
                }, {
                        id = "scopes",
                        size = 0.3
                    },
                    --         {
                    --     id = "console",
                    --     size = 0.5
                    -- }
                },
                position = "bottom",
                size = 10
            }}
    })

    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
    end

    dap.continue()
end

keymap.set('n', '<leader>da', ':lua attach_to_debug(vim.fn.input("port:"))<CR>')

keymap.set('n', '<F5>', ':lua require"dap".continue()<cr>')
keymap.set('n', '<F8>', ':lua require"dap".step_over()<CR>')
keymap.set('n', '<F7>', ':lua require"dap".step_into()<CR>')
keymap.set('n', '<F6>', ':lua require"dap".step_out()<CR>')

keymap.set('n', '<leader>db', ':lua require"dap".toggle_breakpoint()<CR>')
keymap.set('n', '<leader>dB', ':lua require"dap".set_breakpoint(vim.fn.input("Condition:"))<CR>')
keymap.set('n', '<leader>bl', ':lua require"dap".set_breakpoint(nil,nil,vim.fn.input("Log:"))<CR>')
keymap.set('n', '<leader>dr', ':lua require"dap".repl.open()<CR>')

-- toggle

