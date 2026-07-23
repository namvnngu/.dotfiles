local dotnet_status, dotnet = pcall(require, "easy-dotnet")
if dotnet_status then
    dotnet.setup()
end

local conform_status, conform = pcall(require, "conform")
if conform_status then
    conform.formatters_by_ft.cs = { "csharpier" }
end
