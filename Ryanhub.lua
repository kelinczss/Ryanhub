--===========================
--   FISHING HELPER (AMAN)
--   Auto Pull + Auto Cast
--   Anti AFK + ON/OFF GUI
--===========================

local virtualUser = game:GetService("VirtualUser")
local userInput = game:GetService("UserInputService")
local runService = game:GetService("RunService")

local autoFishing = false

-- ===========================
-- GUI SIMPLE (ON / OFF)
-- ===========================
local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 160, 0, 50)
ToggleButton.Position = UDim2.new(0.05, 0, 0.15, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 20
ToggleButton.Text = "Auto Fishing: OFF"

ToggleButton.MouseButton1Click:Connect(function()
    autoFishing = not autoFishing
    if autoFishing then
        ToggleButton.Text = "Auto Fishing: ON"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    else
        ToggleButton.Text = "Auto Fishing: OFF"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
    end
end)

-- ===========================
--   ANTI AFK
-- ===========================
game:GetService("Players").LocalPlayer.Idled:connect(function()
    virtualUser:CaptureController()
    virtualUser:ClickButton2(Vector2.new())
end)

-- ===========================
--   AUTO PULL + AUTO CAST
-- ===========================
spawn(function()
    while true do
        task.wait(0.15)

        if autoFishing then
            -- Klik tarik
            virtualUser:Button1Down(Vector2.new(0,0))
            task.wait(0.02)
            virtualUser:Button1Up(Vector2.new(0,0))
        end
    end
end)
