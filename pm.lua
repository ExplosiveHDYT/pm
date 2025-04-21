-- pm
local command = ...
local name = select(2, ...)

local url = {
  hello = "https://example.com/hello.lua",
  smp = "https://raw.githubusercontent.com/ExplosiveHDYT/pm/refs/heads/main/smp.lua",
  pm = "https://raw.githubusercontent.com/ExplosiveHDYT/pm/refs/heads/main/pm.lua"
}

if command == "add" then
  print("Warning, package" .. url[name] .. ", continue? (y/n)")
  local answer = read()
    if answer == "y" then
    if fs.exists(name .. ".lua") then
        shell.run("rm", name .. ".lua")
    end
    shell.run("wget", url[name], name..".lua")
    
    else
    print("operation cancelled")
    end
end
