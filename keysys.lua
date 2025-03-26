-- Load Fluent Library
local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau", true))()

-- Creating the window for the UI
local Window = Library:Window{
    Title = "BunnieHub KeySystem",
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
    KeySys = Window:Tab{
        Title = "Key System",
        Icon = "phosphor-lock-key-bold" -- Lock icon
    },
    Settings = Window:Tab{
        Title = "Settings",
        Icon = "settings"
    }
}

-- Valid Keys
local VALID_KEYS = {
    ["NoxiusFree"] = true,
    ["DevPanel"] = true,
    ["CoolKid"] = true
}
local enteredKey = ""

-- Key System UI
local KeyPrompt = Tabs.KeySys:Paragraph("KeyPrompt", {
    Title = "Welcome to BunnieHub",
    Content = "Please enter the key to continue."
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
        if VALID_KEYS[enteredKey] then
            KeyPrompt:SetValue("✅ Key accepted! Executing script...")

            Library:Notify({
                Title = "Key System",
                Content = "Correct key entered! Executing script now...",
                Duration = 3,
                Sound = { SoundId = "rbxassetid://8486683243" }
            })

            -- Execute the script FIRST
            local success, err = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/NsShrixx/bunniehub/refs/heads/main/hub.lua"))()
            end)

            -- If execution was successful, remove UI after 3 seconds
            if success then
                task.delay(3, function()
                    pcall(function() Window:Destroy() end)
                    collectgarbage()
                end)
            else
                KeyPrompt:SetValue("❌ Script execution failed! Error: " .. err)
                Library:Notify({
                    Title = "Error",
                    Content = "Script failed to execute! Check console for details.",
                    Duration = 5,
                    Sound = { SoundId = "rbxassetid://8486683243" }
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
