-- by zRaYsu
local player = game.Players.LocalPlayer

if player then
    local function enableFlight()
        if player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, true)
            end
        end
    end
    
    local function disableFlight()
        if player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
            end
        end
    end
    
    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.F then
            enableFlight()
        end
    end)
    
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.F then
            disableFlight()
        end
    end)
end
