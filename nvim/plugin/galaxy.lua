local present1, gl = pcall(require, "galaxyline")
local present2, condition = pcall(require, "galaxyline.condition")
local gls = gl.section
gl.short_line_list = {"NvimTree"}

if not (present1 or present2) then
    return
end

local separator_left =  "| "
local separator_right =  " |"

-- Tables

local colors = {
    bright_orange = "#fe8019",
    lightbg = "#504945",
    lightbg2 = "#665c54",
    white = "#f9f5d7",
    brown_fg = "#bdae93",
    statusline_bg = "#32302f",
    inversed_fg = "#3c3836",
    yellow = "#fabd2f",
    red = "#fb4934",
    green = "#b8bb26",
    pink = "#d3869b",
    blue = "#83a598",
    aqua = "#8ec07c"
}

-- Functions

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 30 then
        return true
    end
    return false
end

-- Left Side

gls.left[1] = {
    FirstElement = {
        provider = function()
            return "▋"
        end,
        highlight = {colors.bright_orange, colors.bright_orange} } }

gls.left[2] = {
    statusIcon = {
        provider = function()
            return "  ʕ•ᴥ•ʔ "
        end,
        highlight = {colors.bright_orange, colors.statusline_bg},
        separator = separator_left,
        separator_highlight = {colors.lightbg, colors.statusline_bg}
    }
}

gls.left[3] = {
    FileIcon = {
        provider = "FileIcon",
        condition = condition.buffer_not_empty,
        highlight = {colors.aqua, colors.statusline_bg}
    }
} gls.left[4] = {
    FileName = {
        provider = {"FileName"},
        condition = condition.buffer_not_empty,
        highlight = {colors.aqua, colors.statusline_bg},
        separator = separator_left,
        separator_highlight = {colors.lightbg, colors.statusline_bg}
    }
}

gls.left[5] = {
    current_dir = {
        provider = function()
            local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return " " .. dir_name .. " "
        end,
        highlight = {colors.blue, colors.statusline_bg},
        separator = separator_left,
        separator_highlight = {colors.lightbg, colors.statusline_bg}
    }
}


gls.left[6] = {
    DiffAdd = {
        provider = "DiffAdd",
        icon = "  ",
        highlight = {colors.green, colors.statusline_bg}
    }
}

gls.left[7] = {
    DiffModified = {
        provider = "DiffModified",
        icon = "   ",
        highlight = {colors.yellow, colors.statusline_bg}
    }
}

gls.left[8] = {
    DiffRemove = {
        provider = "DiffRemove",
        icon = "   ",
        highlight = {colors.red, colors.statusline_bg}
    }
}

gls.left[9] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = " ",
        highlight = {colors.red, colors.statusline_bg}
    }
}

gls.left[10] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "   ",
        highlight = {colors.yellow, colors.statusline_bg}
    }
}

-- Right Side

gls.right[1] = {
    lsp_status = {
        provider = function()
            local clients = vim.lsp.get_active_clients()
            if next(clients) ~= nil then
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return "" .. " " .. " LSP "
                    end
                end
                return ""
            else
                return ""
           end
        end,
        highlight = {colors.brown_fg, colors.statusline_bg},
    }
}

gls.right[2] = {
    GitIcon = {
        provider = function()
            return " "
        end,
        condition = require("galaxyline.condition").check_git_workspace,
        highlight = {colors.blue, colors.statusline_bg},
        separator = separator_left,
        separator_highlight = {colors.lightbg, colors.statusline_bg}
    }
}

gls.right[3] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.condition").check_git_workspace,
        highlight = {colors.blue, colors.statusline_bg},
    }
}

gls.right[4] = {
    viMode_icon = {
        provider = function()
            return " "
        end,
        condition = require("galaxyline.condition").check_git_workspace,
        highlight = {colors.pink, colors.statusline_bg},
        separator = separator_right,
        separator_highlight = {colors.lightbg, colors.statusline_bg}
    }
}

gls.right[5] = {
    ViMode = {
        provider = function()
            local alias = {
                n = "NORMAL",
                i = "INSERT",
                c = "COMMAND",
                V = "VISUAL LINE",
                [""] = "VISUAL BLOCK",
                v = "VISUAL",
                R = "REPLACE"
            }
            local current_Mode = alias[vim.fn.mode()]

            if current_Mode == nil then
                return "  Terminal "
            else
                return "  " .. current_Mode .. " "
            end
        end,
        highlight = {colors.pink, colors.statusline_bg},
    }
}

gls.right[6] = {
    some_icon = {
        provider = function()
            return ""
        end,
        highlight = {colors.green, colors.statusline_bg},
        separator = separator_left,
        separator_highlight = {colors.lightbg, colors.statusline_bg}
    }
}

gls.right[7] = {
    line_percentage = {
        provider = function()
            local current_line = vim.fn.line(".")
            local total_line = vim.fn.line("$")

            if current_line == 1 then
                return "  TOP "
            elseif current_line == vim.fn.line("$") then
                return "  BOTTOM "
            end
            return "  " .. current_line .. "/" .. total_line
        end,
        highlight = {colors.green, colors.statusline_bg},
    }
}
gls.right[8] = {
    FileEncode = {
        provider = "FileEncode",
        highlight = {colors.yellow, colors.statusline_bg},
        separator = separator_right,
        separator_highlight = {colors.lightbg, colors.statusline_bg}
    }
}

gls.right[9] = {
    offset_right = {
        provider = function()
            return "▋"
        end,
        highlight = {colors.statusline_bg, colors.statusline_bg}
    }
}
