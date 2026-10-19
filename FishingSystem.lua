-- FishingSystem.lua

local Players = game:GetService("Players")

local function onPlayerAdded(player)
    local function onFishingRodActivated()
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                local healthBar = player:FindFirstChild("Health")
                if healthBar and healthBar.Value < 100 then
                    healthBar.Value = math.min(healthBar.Value + 10, 100)
                end
            end
        end
    end

    player.CharacterAdded:Connect(function(character)
        local fishingRod = character:WaitForChild("FishingRod")
        fishingRod.Activated:Connect(onFishingRodActivated)
    end)
end

Players.PlayerAdded:Connect(onPlayerAdded)