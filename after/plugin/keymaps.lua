local keymap = vim.keymap

-- debuger
local function get_spring_boot_runner(profile, debug, port)
    local debug_param = ""
    if debug then
        debug_param =
        '-Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=' .. port ..
        '"'
    end
    local profile_param = ""
    if profile then
        profile_param = ' -D"spring-boot.run.profiles"=' .. profile .. " "
    end
    return 'mvn spring-boot:run' .. profile_param .. debug_param
end

local function run_spring_boot(profile, debug, port)
    -- vim.cmd('FloatermNew ' .. get_spring_boot_runner('local', debug))
    vim.cmd("TermExec cmd='" .. get_spring_boot_runner(profile, debug, port) .. "'")
end

keymap.set("n", "<F9>", function()
    run_spring_boot(vim.fn.input("profile:"), false, vim.fn.input("port:"))
end)
keymap.set("n", "<F10>", function()
    run_spring_boot(vim.fn.input("profile:"), true, vim.fn.input("port:"))
end)
