local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Create Main Window
local Window = OrionLib:MakeWindow({
    Name = "TsunDe1e Hub ¢÷", 
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
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Global Sound Button (ปล่อยเสียงจากตัวเรา กระจายทั่วแมพ)
TrollTab:AddButton({
    Name = "🔊 Play Global Troll Sound",
    Callback = function()
        local LocalPlayer = game.GetService("Players").LocalPlayer
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local rootPart = character:FindFirstChild("HumanoidRootPart")

        if rootPart then
            -- สร้าง Sound Object ไว้ที่ตัวละครของเรา
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://101108840775263"
            sound.Volume = 10 -- ปรับความดังสะใจ
            sound.RollOffMaxDistance = 10000 -- ระยะกระจายเสียงไกลทั่วแมพ
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

-- ==========================================
-- Floating Toggle Button + Click Sound
-- ==========================================
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TsunDe1eFloatingIcon"
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

-- ขอบมนไอคอน
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0.2, 0)
UICorner.Parent = ToggleButton

-- ระบบลากวาง (Draggable)
local dragging, dragInput, dragStart, startPos

ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = ToggleButton.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

ToggleButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        ToggleButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- ฟังก์ชันกดเปิด-ปิด Hub พร้อมใส่เสียงคลิก
local windowVisible = true
ToggleButton.MouseButton1Click:Connect(function()
    local clickSound = Instance.new("Sound")
    clickSound.SoundId = "rbxassetid://137965684634919"
    clickSound.Volume = 5
    clickSound.Parent = LocalPlayer:WaitForChild("PlayerGui")
    clickSound:Play()
    clickSound.Ended:Connect(function()
        clickSound:Destroy()
    end)

    windowVisible = not windowVisible
    if Window and Window.Base then
        Window.Base.Visible = windowVisible
    end
end)

OrionLib:Init()

