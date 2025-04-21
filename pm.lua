-- pm
local command = ...
local name = select(2, ...)


-- Update Package Manager
pm = "https://example.com/pm.lua"

local url = {
  -- Various Packages
  hello = "https://example.com/hello.lua",
  test = "https://example.com/test.lua"
}

if command == "add" then
  shell.run("wget", url[name], name..".lua")


elseif command == "update" then
  if url[name] then
    shell.run("wget", https://example.com/pm.lua, name..".lua")


