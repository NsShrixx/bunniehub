-- Load the Fluent library from the URL
local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau", true))()

-- Creating the window for the UI
local Window = Library:Window{
    Title = `BunnieHub`,
    SubTitle = "by Noxius Services",
    TabWidth = 160,
    Size = UDim2.fromOffset(830, 525),
    Resize = true,
    Acrylic = true,
    Theme = "Vynixu",
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

-- Function to create a Game Tab with a button that triggers a notification
local function createGameTab(gameName)
    local GameTab = Window:Tab{
        Title = gameName,
        Icon = "phosphor-gamepad-bold"
    }

    -- Creating a Button inside the game tab that will trigger a notification
    GameTab:Button({
        Title = "Click Me",
        Description = "Click this button to get a notification!",
        Callback = function()
            Library:Notify({
                Title = "Button Clicked",
                Content = "You clicked the 'Click Me' button for " .. gameName .. "!",
                Duration = 4,  -- Duration of the notification in seconds
                Sound = {
                    SoundId = "rbxassetid://8486683243"  -- A sound to play when the notification appears
                }
            })
        end
    })
end

-- Adding game tabs for each game
createGameTab("Break in 2")
createGameTab("Fisch")
createGameTab("Dead Rails")
createGameTab("Bee Swarm")
createGameTab("Arsenal")

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
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8,
    Sound = {
        SoundId = "rbxassetid://8486683243"  -- Sound played when the script loads
    }
})
