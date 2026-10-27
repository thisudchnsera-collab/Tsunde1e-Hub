local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Create Main Window
local Window = OrionLib:MakeWindow({
    Name = "TsunDe1e Hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "TsunDe1eConfig",
    Theme = "Light",
    Color = Color3.fromRGB(255, 105, 180),
    IntroEnabled = true,
    IntroText = "TsunDe1e Hub Loaded",
    ToggleKey = Enum.KeyCode.RightShift
})

-- Create Troll Tab
local TrollTab = Window:MakeTab({
    Name = "Troll Menu",
    Icon = "rbxassetid://4483345908",
    PremiumOnly = false
})

-- Global Sound Button (ปล่อยเสียงจากตัวเรา กระจายทั้งแมพ)
TrollTab:AddButton({
    Name = "🔊 Play Global Troll Sound",
    Callback = function()
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        
        if rootPart then
            -- สร้าง Sound Object ไว้ที่ตัวละครของเรา
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://101108840775263"
            sound.Volume = 10 -- ปรับความดังสะใจ
            sound.RollOffMaxDistance = 10000 -- ระยะการได้ยินไกลทั้งหมด
            sound.RollOffMinDistance = 50
            sound.Parent = rootPart
            sound:Play()
            
            -- ลบเสียงทิ้งเมื่อเล่นจบ
            sound.Ended:Connect(function()
                sound:Destroy()
            end)
        end
    end
})

------------------------------------------------
-- Floating Toggle Button - Click Sound
------------------------------------------------
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Tsunde1eFloatingIcon"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ToggleButton = Instance.new("ImageButton")
ToggleButton.Name = "IconButton"
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BackgroundTransparency = 1
ToggleButton.Position = UDim2.new(0.1, 0, 0.1, 0)
ToggleButton.Size = UDim2.new(0, 65, 0, 65)
ToggleButton.Image = "rbxassetid://110192004194415"
ToggleButton.ScaleType = Enum.ScaleType.Fit

-- ขอบโค้งมน
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim

