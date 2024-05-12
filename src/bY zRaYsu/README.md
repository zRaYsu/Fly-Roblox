# Fly Script for Roblox Game

This project contains a Lua script that implements the fly feature in your Roblox game. The script allows players to fly freely in the game world.

## Script Usage

To use the fly script in your Roblox game, follow these steps:

1. Open the Roblox Studio and open your game project.
2. Navigate to the "Workspace" or "ServerScriptService" folder, depending on where you want to place the script.
3. Create a new Lua script and name it "flyScript.lua".
4. Copy and paste the following code into the script:

```lua
-- Fly Script

-- Define the function to enable fly mode
local function enableFly(player)
    -- Check if the player is already flying
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local humanoid = player.Character.Humanoid
        if humanoid.PlatformStand then
            return
        end
    end

    -- Create a BodyVelocity object to control the player's movement
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 50, 0) -- Set the initial velocity to make the player start flying
    bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0) -- Set the maximum force to allow unlimited flying

    -- Attach the BodyVelocity object to the player's character
    if player.Character then
        bodyVelocity.Parent = player.Character.HumanoidRootPart
    end
end

-- Define the function to disable fly mode
local function disableFly(player)
    -- Remove the BodyVelocity object from the player's character
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = player.Character.HumanoidRootPart
        local bodyVelocity = humanoidRootPart:FindFirstChildOfClass("BodyVelocity")
        if bodyVelocity then
            bodyVelocity:Destroy()
        end
    end
end

-- Connect the functions to the player's events
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        enableFly(player)
    end)
end)

game.Players.PlayerRemoving:Connect(function(player)
    disableFly(player)
end)
```

1. Save the script and close the script editor.

Now, when a player joins your game, they will be able to fly by pressing the spacebar. To disable fly mode, simply remove the script from your game or restart the server.

Note: This script assumes that your game has a character model with a Humanoid and a HumanoidRootPart. If your game has a different setup, you may need to modify the script accordingly.

Feel free to customize the script to fit your specific game requirements. Enjoy flying in your Roblox game!
<!-- bY zRaYsu -->