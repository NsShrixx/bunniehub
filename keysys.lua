-- Load Fluent Library
local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau", true))()

-- Creating the window for the UI
local Window = Library:Window{
    Title = "BunnieHub",
    SubTitle = "by Noxius Services",
    TabWidth = 160,
    Size = UDim2.fromOffset(830, 525),
    Resize = true,
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.P
}

-- Creating the Tabs
local Tabs = {
    Main = Window:Tab{
        Title = "Main",
        Icon = "phosphor-users-bold"
    },
    Settings = Window:Tab{
        Title = "Settings",
        Icon = "settings"
    }
}

-- Game Script List
local GameScripts = {
    ["Break in 2"] = "https://luau.tech/build",
    ["Fisch"] = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua",
    ["Dead Rails"] = "https://raw.githubusercontent.com/tbao143/thaibao/refs/heads/main/TbaoHubDeadRails",
    ["Bee Swarm"] = "https://raw.githubusercontent.com/DevKron/Kron_Hub/refs/heads/main/version_1.0",
    ["Arsenal"] = "https://raw.githubusercontent.com/Insertl/QuotasHub/main/BETAv1.3",
    ["Blox Fruits"] = "https://raw.githubusercontent.com/newredz/BloxFruits/refs/heads/main/Source.luau"
}

-- Function to create a Game Tab with an Execute Button
local function createGameTab(gameName, scriptURL)
    local GameTab = Window:Tab{
        Title = gameName,
        Icon = "phosphor-gamepad-bold"
    }

    -- Execute Button
    GameTab:Button({
        Title = "Execute",
        Description = "Click to execute the script for " .. gameName,
        Callback = function()
            Library:Notify({
                Title = "Executing Script",
                Content = "Running script for " .. gameName .. "...",
                Duration = 3,
                Sound = {
                    SoundId = "rbxassetid://8486683243"
                }
            })

            -- Load and execute script
            loadstring(game:HttpGet(scriptURL, true))()
        end
    })
end

-- Add Game Tabs for each game
for gameName, scriptURL in pairs(GameScripts) do
    createGameTab(gameName, scriptURL)
end

-- Settings Section for customization
local InterfaceSection = Tabs.Settings:Section("Interface")

-- Interface Theme Dropdown
InterfaceSection:Dropdown("InterfaceTheme", {
    Title = "Theme",
    Description = "Changes the interface theme.",
    Values = Library.Themes,
    Default = Library.Theme,
    Callback = function(Value)
        Library:SetTheme(Value)
    end
})

-- Acrylic Toggle
if Library.UseAcrylic then
    InterfaceSection:Toggle("AcrylicToggle", {
        Title = "Acrylic",
        Description = "The blurred background requires graphic quality 8+",
        Default = Library.Acrylic,
        Callback = function(Value)
            Library:ToggleAcrylic(Value)
        end
    })
end

-- Transparency Toggle
InterfaceSection:Toggle("TransparentToggle", {
    Title = "Transparency",
    Description = "Makes the interface transparent.",
    Default = Library.Transparency,
    Callback = function(Value)
        Library:ToggleTransparency(Value)
    end
})

-- Keybind for Minimize
InterfaceSection:Keybind("MenuKeybind", {
    Title = "Minimize Bind", 
    Default = Library.MinimizeKey or Enum.KeyCode.RightShift,
    ChangedCallback = function(Value)
        Library.MinimizeKey = Value
    end
})
Library.MinimizeKeybind = Library.Options.MenuKeybind

-- Select the main tab by default
Window:SelectTab(1)

-- Notify the user that the script has loaded
Library:Notify({
    Title = "BunnieHub",
    Content = "The script has been loaded successfully.",
    Duration = 5,
    Sound = {
        SoundId = "rbxassetid://8486683243"
    }
})
