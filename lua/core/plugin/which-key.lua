local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1
wk.register({
    f = {
        name = "Find",
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
    },
    g = {
        name = "Git",
        b = { '<cmd>Telescope git_branches<cr>', 'Git branch'},
        v = { '<cmd>DiffviewOpen<cr>', 'Gie diff view'},
        a = { '<cmd>Gitsigns stage_hunk<cr>', 'Git add hunk'},
        r = { '<cmd>Gitsigns reset_hunk<cr>', 'Git reset hunk'},
        u = { '<cmd>Gitsigns undo_stage_hunk<cr>', 'Git undo add hunk'}
    },
    d = {
        name = "Debug",
        a = { "启动"},
        b = { '添加或删除断点'},
    },
    b = {
        name = "Buffer",
        c = { '切换Buffer' }
    },
    s = {
        name = "window",
        h = "垂直新增窗口",
        v = "水平添加窗口"
    },
    h = {
        name = "hop 跳转",
        w = "HopWord",
        c = "HopChar2",
        l = "HopLine",
    },
    l = {
        name = "Lazy Plugins",
        g = "Lazy git",
    }
}, { prefix = "<leader>" })

