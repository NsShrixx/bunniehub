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
    Theme = "Vynixu",
    MinimizeKey = Enum.KeyCode.P
}

-- Creating the Tabs
local Tabs = {
    KeySys = Window:Tab{
        Title = "Key System",
        Icon = "phosphor-lock-key-bold"
    },
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

local VALID_KEY = "NoxiusFree"
local enteredKey = ""

-- Key System UI
local KeyPrompt = Tabs.KeySys:Paragraph("KeyPrompt", {
    Title = "Welcome to BunnieHub",
    Content = "Please enter the key to continue.\nKey: NoxiusFree"
})

local KeyInput = Tabs.KeySys:Input("KeyInput", {
    Title = "Enter Key",
    Default = "",
    Numeric = false,
    Placeholder = "Enter the key...",
    Callback = function(Value)
        enteredKey = Value
    end
})

Tabs.KeySys:Button({
    Title = "Validate Key",
    Description = "Click to validate your key.",
    Callback = function()
        if enteredKey == VALID_KEY then
            KeyPrompt:SetValue("✅ Key accepted! Loading UI...")
            Library:Notify({
                Title = "Key System",
                Content = "Correct key entered! Unlocking features...",
                Duration = 3,
                Sound = { SoundId = "rbxassetid://8486683243" }
            })

            -- Wait 3 seconds, then remove the UI
            task.delay(3, function()
                Window:Destroy()
            end)

            -- Unlock game tabs
            for gameName, scriptURL in pairs(GameScripts) do
                local GameTab = Window:Tab{
                    Title = gameName,
                    Icon = "phosphor-gamepad-bold"
                }

                GameTab:Button({
                    Title = "Execute",
                    Description = "Click to execute the script for " .. gameName,
                    Callback = function()
                        Library:Notify({
                            Title = "Executing Script",
                            Content = "Running script for " .. gameName .. "...",
                            Duration = 3,
                            Sound = { SoundId = "rbxassetid://8486683243" }
                        })
                        loadstring(game:HttpGet(scriptURL, true))()
                    end
                })
            end

        else
            KeyPrompt:SetValue("❌ Invalid Key! Try again.")
            Library:Notify({
                Title = "Key System",
                Content = "Incorrect key! Please try again.",
                Duration = 3,
                Sound = { SoundId = "rbxassetid://8486683243" }
            })
        end
    end
})

-- Settings Section
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

-- Start on the Key System Tab
Window:SelectTab(1)

-- Notify the user that the script has loaded
Library:Notify({
    Title = "BunnieHub",
    Content = "The script has been loaded. Enter the key to proceed.",
    Duration = 5,
    Sound = {
        SoundId = "rbxassetid://8486683243"
    }
})
