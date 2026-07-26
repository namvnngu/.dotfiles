local dotnet_ok, dotnet = pcall(require, "easy-dotnet")
if dotnet_ok then
    dotnet.setup()
end

local conform_ok, conform = pcall(require, "conform")
if conform_ok then
    conform.formatters_by_ft.cs = { "csharpier" }
end
