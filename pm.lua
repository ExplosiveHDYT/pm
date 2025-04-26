-- Alias definitions
local aliases = {
  aliassample = "add sample",
  update = "add pm"
}

-- Grab initial command and name
local command = string.lower(select(1, ...) or "")
local name = string.lower(select(2, ...) or "")

-- Apply alias substitution if it exists
if aliases[command] then
  local split = {}
  for word in aliases[command]:gmatch("%S+") do
    table.insert(split, word)
  end
  command = split[1] or command
  name = split[2] or name
end


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
  turtlyfarmer = "https://github.com/HeshamSHY/Turtly-Farmer/blob/main/installer.lua",
  quarryinstaller = "https://raw.githubusercontent.com/ExplosiveHDYT/quarry/refs/heads/main/quarryinstaller.lua",
  format = "https://raw.githubusercontent.com/ExplosiveHDYT/pm/refs/heads/main/format.lua",
  ishdinstaller = "https://raw.githubusercontent.com/ExplosiveHDYT/pm/refs/heads/main/ishinstaller.lua"
}

if command == "man" then
  local manuals = {
 pm = [[
Package Manager Usage:

Basic Syntax:
  pm <command> <package_name>

Commands:
  pm add <name>   - Installs or updates the specified package
  pm rm <name>    - Removes the specified package from your system
  pm list         - Lists all available packages
  pm man <name>   - Displays the manual/help for a specific package

Examples:
  pm add pm             - Updates the package manager itself
  pm add sample         - Installs the sample package
  pm man harvest        - Shows usage details for the 'harvest' package
  pm rm sample          - Removes the 'sample' package

To add more packages, extend the 'url' list like this:

local url = {
  hello = "https://example.com/hello.lua",
  sample = "https://raw.githubusercontent.com/ExplosiveHDYT/pm/refs/heads/main/sample.lua",
  pm = "https://raw.githubusercontent.com/ExplosiveHDYT/pm/refs/heads/main/pm.lua",
  ...
}
]],

harvest = [[
Harvest.lua - Turtle Potato Farm Bot

Requirements:
- A strip of farmland planted with potatoes
- A water stream for hydration
- A mining turtle

Usage:
The turtle moves through the potato strip and harvests crops.
Note: The turtle drops potatoes directly underneath. Ensure you have a hopper or collection system set up below.
]],

dog = [[
Dog - Turtle with Mounted Tools

Setup:
- Mount a Block Scanner on one side of the turtle.
- Mount a Pickaxe on the opposite side.

Used for basic scanning and mining operations. Ensure turtle is charged and equipped.
]],

ezdisplay = [[
EZDisplay - Text Display on Monitors

Instructions:
1. Place a computer adjacent to a monitor.
2. Follow the on-screen prompts to configure lines and colors.

Helpful commands are built-in to assist with color selection and formatting.
]],

stockprogram = [[
StockProgram - Basic Stock Viewer

Tracks and displays stock values for various fictional companies.

Requires internet access and a monitor for best visual experience. Suitable for roleplay or educational servers.
]],

createminer = [[
CreateMiner - Auto-Mining Turtle

This turtle will automatically mine in a pattern optimized for resource collection.
Ensure it has enough fuel and a pickaxe equipped.

Use in flat areas for best results.
]],

pinestore = [[
PineStore - Package Browser

Access a centralized web-based package manager for ComputerCraft.
Supports browsing and downloading community scripts.

URL: https://pinestore.cc/d/2
]],

ccpkg = [[
ccpkg - External Package Manager

An alternative package manager for ComputerCraft.
Use this if you're looking for something more powerful than the built-in system.

URL: https://raw.githubusercontent.com/Gibbo3771/ccpkg/main/install.lua
]],

minux = [[
Minux - Tiny ComputerCraft OS Installer

Installs a minimal operating system for ComputerCraft devices.
Works best on advanced computers with a clear startup file.

Installer URL: https://minux.cc/netinstall
]],

turtlyfarmer = [[
Turtly Farmer - Full Farming Turtle

A more advanced farming turtle with pre-programmed farming cycles and configurable plots.

Installer URL:
https://github.com/HeshamSHY/Turtly-Farmer/blob/main/installer.lua
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
  print("Remove ".. name .." package? (y/n)")
  local answer = read()
  if answer == "y" then
    shell.run("rm", name..".lua")
  else
    print("Operation cancelled.")
  end
end

if command == "list" then
  print("Available packages:")
  for pkg, _ in pairs(url) do
    print(" - " .. pkg)
  end
end




