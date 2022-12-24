vim.api.nvim_create_user_command(
    "Template",
    function(opts)
        local template_name = opts.args

        if template_name == "cg" then
            vim.cmd("read $HOME/.config/nvim/templates/CG.cpp")
        elseif template_name == "ccp" then
            vim.cmd("read $HOME/.config/nvim/templates/CCP.cpp")
        elseif template_name == "pg" then
            vim.cmd("read $HOME/.config/nvim/templates/PG.py")
        elseif template_name == "pcp" then
            vim.cmd("read $HOME/.config/nvim/templates/PCP.py")
        elseif template_name == "html" then
            vim.cmd("read $HOME/.config/nvim/templates/HTML.html")
        elseif template_name == "java" then
            vim.cmd("read $HOME/.config/nvim/templates/Java.java")
        elseif template_name == "ts" then
            vim.cmd("read $HOME/.config/nvim/templates/TS.ts")
        else
            print("No template!")
        end
    end,
    { nargs = 1, desc = "Load a template" }
)
