local DiscordLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt"))()

local win = DiscordLib:Window("🤍Bunnie Hub🤍")

-- Main server
local mainServ = win:Server("Main", "http://www.roblox.com/asset/?id=127668012498415")

-- Arsenal Scripts Channel
local arsenalScripts = mainServ:Channel("Arsenal Scripts")
arsenalScripts:Label("QUOTOS HUB")
arsenalScripts:Button("Execute QUOTOS HUB", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Insertl/QuotasHub/main/BETAv1.3"))()
end)

-- Rivals Scripts Channel
local rivalsChannel = mainServ:Channel("Rivals Scripts")
rivalsChannel:Label("Rivals Script")
rivalsChannel:Button("Execute Rivals Script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Actyrn/Scripts/main/AzureModded"))()
end)

-- Blade Ball Channel
local bladeBallChannel = mainServ:Channel("Blade Ball")
local autoParryEnabled = false
bladeBallChannel:Toggle("Enable Auto Parry", false, function(bool)
    autoParryEnabled = bool
end)

-- Auto Parry Logic
local function autoParry()
    while autoParryEnabled do
        -- Add logic for Auto Parry
        wait(0.1)
    end
end

-- Visuals Channel with Aimbot & FOV
local visualChannel = mainServ:Channel("Visual")
_G.AimbotEnabled = false
_G.CircleRadius = 80

visualChannel:Toggle("Enable Aimbot", false, function(bool)
    _G.AimbotEnabled = bool
end)

visualChannel:Slider("FOV Radius", 50, 200, _G.CircleRadius, function(val)
    _G.CircleRadius = val
end)

-- Misc Server
local miscServ = win:Server("Misc", "http://www.roblox.com/asset/?id=127668012498415")
local adminChannel = miscServ:Channel("Admin")
adminChannel:Button("Execute Infinite Yield", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end)
adminChannel:Button("Execute Dex Explorer", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BigBoyTimme/New.Loadstring.Scripts/refs/heads/main/Dex.Explorer"))()
end)

-- Games Server
local gamesServ = win:Server("Games", "http://www.roblox.com/asset/?id=127668012498415")
local games = {
    "Blox Fruits", "Pet Simulator X", "Tower of Hell", "Brookhaven RP", "Murder Mystery 2", "Adopt Me", "Doors", "Jailbreak", "BedWars"
}

for _, gameName in ipairs(games) do
    local gameChannel = gamesServ:Channel(gameName)
    gameChannel:Button("Execute Script", function()
        print("sigma")
    end)
end

-- Settings Server
local settingsServ = win:Server("Settings", "http://www.roblox.com/asset/?id=127668012498415")
local settingsChannel = settingsServ:Channel("UI Themes")

settingsChannel:Button("Light Theme", function()
    DiscordLib:ChangeTheme("Light")
end)
settingsChannel:Button("Dark Theme", function()
    DiscordLib:ChangeTheme("Dark")
end)
settingsChannel:Button("Midnight", function()
    DiscordLib:ChangeTheme("Midnight")
end)
settingsChannel:Button("Red Theme", function()
    DiscordLib:ChangeTheme("Red")
end)
