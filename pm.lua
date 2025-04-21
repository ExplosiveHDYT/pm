-- pm
local command = ...
local name = select(2, ...)

local url = {
  hello = "https://example.com/hello.lua",
  test = "https://example.com/test.lua"
}

if command == "add" then
  shell.run("wget", url[name], name..".lua")
end
