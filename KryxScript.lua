local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Create GUI
local KryxCheatGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local TimeLabel = Instance.new("TextLabel")
local ButtonsFrame = Instance.new("Frame")

-- Style the GUI
KryxCheatGui.Name = "KryxCheat"
KryxCheatGui.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 200, 0, 250)
MainFrame.Position = UDim2.new(0.85, 0, 0.5, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = KryxCheatGui

Title.Text = "KryxCheat"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Parent = MainFrame

-- Function to create buttons
local function CreateButton(text, position, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.8, 0, 0, 30)
    button.Position = position
    button.Text = text
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = MainFrame
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Noclip
local noclipEnabled = false
CreateButton("Toggle Noclip", UDim2.new(0.1, 0, 0.2, 0), function()
    noclipEnabled = not noclipEnabled
end)

RunService.Stepped:Connect(function()
    if noclipEnabled then
        LocalPlayer.Character:FindFirstChild("Humanoid"):ChangeState(11)
    end
end)

-- Click TP
CreateButton("Click TP", UDim2.new(0.1, 0, 0.35, 0), function()
    local mouse = LocalPlayer:GetMouse()
    mouse.Button1Down:Connect(function()
        if LocalPlayer.Character then
            LocalPlayer.Character:MoveTo(mouse.Hit.p)
        end
    end)
end)

-- Freecam
local freecamEnabled = false
CreateButton("Toggle Freecam", UDim2.new(0.1, 0, 0.5, 0), function()
    freecamEnabled = not freecamEnabled
    if freecamEnabled then
        local camera = workspace.CurrentCamera
        local character = LocalPlayer.Character
        if character then
            character.Archivable = true
            local clone = character:Clone()
            clone.Parent = game.Workspace
            character.HumanoidRootPart.Anchored = true
        end
    else
        LocalPlayer.Character.HumanoidRootPart.Anchored = false
    end
end)

-- Time Display
TimeLabel.Size = UDim2.new(1, 0, 0, 20)
TimeLabel.Position = UDim2.new(0, 0, 0.9, 0)
TimeLabel.BackgroundTransparency = 1
TimeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TimeLabel.Parent = MainFrame

-- Update time
RunService.RenderStepped:Connect(function()
    local time = os.date("*t")
    TimeLabel.Text = string.format("%02d:%02d:%02d", time.hour, time.min, time.sec)
end)

-- Rain Effect
local function createRainDrop()
    local drop = Instance.new("Frame")
    drop.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
    drop.Size = UDim2.new(0, 1, 0, 10)
    drop.BorderSizePixel = 0
    drop.Position = UDim2.new(math.random(), 0, -0.1, 0)
    drop.Parent = KryxCheatGui
    
    local function animate()
        local tween = game:GetService("TweenService"):Create(
            drop,
            TweenInfo.new(1),
            {Position = UDim2.new(drop.Position.X.Scale, 0, 1.1, 0)}
        )
        tween:Play()
        tween.Completed:Wait()
        drop:Destroy()
    end
    
    coroutine.wrap(animate)()
end

-- Create rain drops periodically
RunService.Heartbeat:Connect(function()
    if math.random(1, 10) == 1 then
        createRainDrop()
    end
end)

-- Make GUI draggable
local dragging
local dragInput
local dragStart
local startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

RunService.RenderStepped:Connect(function()
    if dragging and dragInput then
        local delta = dragInput.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)
