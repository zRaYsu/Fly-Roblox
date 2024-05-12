# Fly Script for Roblox Game

This project contains a Lua script that implements the fly feature in your Roblox game. The script allows players to fly freely in the game world.

## Script Usage

To use the fly script in your Roblox game, follow these steps:

1. Open the Roblox Studio and open your game project.
2. Navigate to the "Workspace" or "ServerScriptService" folder, depending on where you want to place the script.
3. Create a new Lua script and name it "flyScript.lua".
4. Copy and paste the following code into the script:

```lua
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

```

1. Save the script and close the script editor.

Now, when a player joins your game, they will be able to fly by pressing the spacebar. To disable fly mode, simply remove the script from your game or restart the server.

Note: This script assumes that your game has a character model with a Humanoid and a HumanoidRootPart. If your game has a different setup, you may need to modify the script accordingly.

Feel free to customize the script to fit your specific game requirements. Enjoy flying in your Roblox game!
<!-- bY zRaYsu -->
