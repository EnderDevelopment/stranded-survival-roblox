-- PlayerHealth.lua

local Players = game:GetService("Players")

local function onPlayerAdded(player)
    local healthBar = Instance.new("IntValue")
    healthBar.Name = "Health"
    healthBar.Value = 100
    healthBar.Parent = player

    local function decreaseHealth()
        if healthBar.Value > 0 then
            healthBar.Value = healthBar.Value - 1
        else
            player:Kick("You have died.")
        end
    end

    game:GetService("RunService").Heartbeat:Connect(function()
        if healthBar.Value > 0 then
            decreaseHealth()
        end
    end)
end

Players.PlayerAdded:Connect(onPlayerAdded)