-- pm
local command = ...
local name = string.lower(select(2, ...) or "")

local url = {
  hello = "https://example.com/hello.lua",
  sample = "https://raw.githubusercontent.com/ExplosiveHDYT/pm/refs/heads/main/sample.lua",
  pm = "https://raw.githubusercontent.com/ExplosiveHDYT/pm/refs/heads/main/pm.lua",
  stockprogram = "https://raw.githubusercontent.com/ExplosiveHDYT/CCStockProgram/refs/heads/main/StockProgram.lua",
  createminer = "https://raw.githubusercontent.com/ExplosiveHDYT/CreateMiner/refs/heads/main/CreateMiner.lua",
  harvest = "https://github.com/ScheiSpieler/farmbot-v1/blob/main/harvest.lua",
  dog = "https://raw.githubusercontent.com/Fatboychummy-CC/Dog/refresh/installer.lua",
  pinestore = "https://pinestore.cc/d/2",
  ccpkg = "https://raw.githubusercontent.com/Gibbo3771/ccpkg/main/install.lua",
  minux = "https://minux.cc/netinstall",
  ezdisplay = "FAXS7uk6",
  turtlyfarmer = "https://github.com/HeshamSHY/Turtly-Farmer/blob/main/installer.lua"


}

if command == "man" then
  local manuals = {
    pm = [[
Package Manager Usage:

  pm add pm       - Updates the package manager itself
  pm add sample   - Installs the sample package

To add more packages, simply extend the 'url' list like so:

local url = {
  hello = "https://example.com/hello.lua",
  sample = "https://raw.githubusercontent.com/ExplosiveHDYT/pm/refs/heads/main/sample.lua",
  pm = "https://raw.githubusercontent.com/ExplosiveHDYT/pm/refs/heads/main/pm.lua"
}
    ]],

    harvest = [[
The Minecraft set-up for this project is fairly simple: you need a long strip of fertile potato land, a water path, and a mining turtle.

Note: the turtle will drop the potatoes below itself after collecting them, so make sure you have a collection system set up.
    ]],

    dog = [[
Block Scanner mounted on one of the turtle's sides.
Pickaxe mounted on the other side.
    ]],

    ezdisplay = [[
How to use:

Place computer next to monitor.

Follow On-Screen prompts for your specific line options. It should be pretty straightforward, and there are some help commands for choosing colors.
    ]]
  }

  if manuals[name] then
        print(manuals[name])
    end
end



if command == "add" then
  print("Warning, package " .. url[name] .. ", continue? (y/n)")
  local answer = read()
  if answer == "y" then
    if fs.exists(name .. ".lua") then
      shell.run("rm", name .. ".lua")
    end
    shell.run("wget", url[name], name..".lua")
    -- Fixed missing comma in the next line:
    shell.run("pastebin", "get", url[name], name..".lua")
  else
    print("Operation cancelled.")
  end
end

if command == "rm" then
  print("Remove a package?")
  local answer = read()
  if answer == "y" then
    shell.run("rm", name..".lua")
  end
end

if command == "list" then
  print("Available packages:")
  for pkg, _ in pairs(url) do
    print(" - " .. pkg)
  end
end




