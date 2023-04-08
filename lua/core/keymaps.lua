vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动 - 快捷键 选中后 shift + j, k
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")



-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口 
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<C-H>", ":bprevious<CR>")

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- debuger

function get_spring_boot_runner(profile, debug)
  local debug_param = ""
  if debug then
    debug_param = '-Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005"'
  end 
  local profile_param = ""
  if profile then
    profile_param = " -Dspring-boot.run.profile=" .. profile .. " "
  end
  return 'mvn spring-boot:run' .. profile_param .. debug_param
end

function run_spring_boot(debug)
  vim.cmd('FloatermNew ' .. get_spring_boot_runner('local', debug))
end

keymap.set("n", "<F9>", function() run_spring_boot() end)
keymap.set("n", "<F10>", function() run_spring_boot(true) end)


-- debug 配置

function attach_to_debug()
  local dap = require('dap')
  dap.configurations.java = {
   {
     type = 'java';
     request = 'attach';
     name = "Attach to thie process";
     hostName = 'localhost';
     port = '5005';
   }
  }

  local dapui = require("dapui")
  dapui.setup({})

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


keymap.set('n', '<leader>da', ':lua attach_to_debug()<CR>')

keymap.set('n', '<F5>', ':lua require"dap".continue()CR>')
keymap.set('n', '<F8>', ':lua require"dap".step_over()<CR>')
keymap.set('n', '<F7>', ':lua require"dap".step_into()<CR>')
keymap.set('n', '<F6>', ':lua require"dap".step_out()<CR>')

keymap.set('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>')
keymap.set('n', '<leader>B', ':lua require"dap".set_breakpoint(vim.fn.input("Condition："))<CR>')
keymap.set('n', '<leader>bl', ':lua require"dap".set_breakpoint(nil,nil,vim.fn.input("Log："))<CR>')
keymap.set('n', '<leader>dr', ':lua require"dap".repl.open()<CR>')


-- toggle

return P
