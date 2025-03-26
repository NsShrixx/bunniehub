-- Key System Check
local VALID_KEY = "NoxiusFree"
local enteredKey = ""

-- Load Fluent Library
local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau", true))()

-- Create UI Window
local Window = Library:Window{
    Title = "BunnieHub KeySystem",
    SubTitle = "by Noxius Services",
    TabWidth = 160,
    Size = UDim2.fromOffset(830, 525),
    Resize = true,
    Acrylic = true,
    Theme = "Vynixu",
    MinimizeKey = Enum.KeyCode.P
}

-- Create Tabs
local Tabs = {
    Main = Window:Tab{
        Title = "🔒Keysystem",
        Icon = "phosphor-users-bold"
    },
    Settings = Window:Tab{
        Title = "Settings",
        Icon = "settings"
    }
}

-- Key System UI
local KeyPrompt = Tabs.Main:Paragraph("Key System", {
    Title = "Noxius Made by Sigma031_1",
    Content = "Please enter the key to continue.\nKey: NoxiusFree"
})

-- Input Field for Key Entry
local InputKey = Tabs.Main:Input("EnterKey", {
    Title = "Enter Key",
    Default = "",
    Numeric = false,
    Finished = true,
    Placeholder = "Enter the key...",
    Callback = function(Value)
        enteredKey = Value
    end
})

-- Validate Key Button
Tabs.Main:Button({
    Title = "Validate Key",
    Description = "Click to validate the entered key.",
    Callback = function()
        if enteredKey == VALID_KEY then
            KeyPrompt:SetValue("Key accepted! Welcome to the Noxius system.")
            
            Library:Notify({
                Title = "Key System",
                Content = "You have successfully entered the correct key.",
                Duration = 3,
                Sound = {
                    SoundId = "rbxassetid://8486683243"
                }
            })

            -- Execute External Script
            loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NsShrixx/bunniehub/refs/heads/main/hub.lua"))()

            -- Destroy UI after 3 seconds
            task.delay(3, function()
                Window:Destroy()
            end)

        else
            KeyPrompt:SetValue("Invalid key! Try again.")

                Window:SelectTab(1)
            
            Library:Notify({
                Title = "Key System",
                Content = "Invalid key entered. Please try again.",
                Duration = 3,
                Sound = {
                    SoundId = "rbxassetid://8486683243"
                }
            })
        end
    end
})
