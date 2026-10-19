-- FoodSystem.lua

local Players = game:GetService("Players")

local function onPlayerAdded(player)
    local function onTouched(otherPart)
        if otherPart.Name == "Food" then
            local healthBar = player:FindFirstChild("Health")
            if healthBar and healthBar.Value < 100 then
                healthBar.Value = math.min(healthBar.Value + 20, 100)
                otherPart:Destroy()
            end
        end
    end

    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.Touched:Connect(onTouched)
    end)
end

Players.PlayerAdded:Connect(onPlayerAdded)