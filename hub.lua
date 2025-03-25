-- Load the required libraries

local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/NsShrixx/bunniehub/refs/heads/main/sigmaboy.lua"))()

-- Create the main GUI
local GUI = Mercury:Create{
    Name = "Bunnie hub V1.2",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}

-- Asset ID for all tabs' icons
local commonIcon = "https://www.roblox.com/asset/?id=8569322835"  -- This is the common icon for all tabs

-- Create Tabs with the same icon
local GamesTab = GUI:Tab{
    Name = "Games",
    Icon = commonIcon
}

local PlayerTab = GUI:Tab{
    Name = "Player",
    Icon = commonIcon
}

local MiscTab = GUI:Tab{
    Name = "Misc",
    Icon = commonIcon
}

-- Games Channels
local PopularGames = GamesTab:Section{
    Name = "Popular Games",
    Side = "Left"
}

local Exploits = GamesTab:Section{
    Name = "Game Exploits",
    Side = "Right"
}

-- Player Channels
local Movement = PlayerTab:Section{
    Name = "Movement",
    Side = "Left"
}

local Modifiers = PlayerTab:Section{
    Name = "Modifiers",
    Side = "Right"
}

-- Misc Channels
local FunStuff = MiscTab:Section{
    Name = "Fun Stuff",
    Side = "Left"
}

local Utility = MiscTab:Section{
    Name = "Utility",
    Side = "Right"
}

-- Games Buttons
PopularGames:Button{
    Name = "Teleport to Brookhaven",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100, 50, 200) -- Example
    end
}

PopularGames:Button{
    Name = "Teleport to Blox Fruits",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(300, 50, 600) -- Example
    end
}

-- Player Movement Options
Movement:Slider{
    Name = "Walkspeed",
    Min = 16,
    Max = 200,
    Default = 16,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
}

Movement:Slider{
    Name = "Jump Power",
    Min = 50,
    Max = 500,
    Default = 50,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
}

Modifiers:Toggle{
    Name = "Infinite Jump",
    StartingState = false,
    Callback = function(state)
        if state then
            game:GetService("UserInputService").JumpRequest:Connect(function()
                game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
            end)
        end
    end
}

-- Miscellaneous Features
FunStuff:Button{
    Name = "Spam Chat Message",
    Callback = function()
        while true do
            wait(1)
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Hello World!", "All")
        end
    end
}

-- Utility Functions
Utility:Button{
    Name = "Server Hop",
    Callback = function()
        local HttpService = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Desc&limit=100"))

        for _, v in pairs(Servers.data) do
            if v.playing < v.maxPlayers then
                TPS:TeleportToPlaceInstance(game.PlaceId, v.id, game.Players.LocalPlayer)
                break
            end
        end
    end
}

Utility:Button{
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
}

-- Notification Example
GUI:Notification{
    Title = "Welcome to Bunnie Hub!",
    Text = "Enjoy your Time (We have ur passwords)!",
    Duration = 7
}
