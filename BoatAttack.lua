-- BoatAttack.lua

local Players = game:GetService("Players")

local function spawnEnemies()
    local boat = Instance.new("Part")
    boat.Name = "Boat"
    boat.Size = Vector3.new(10, 2, 4)
    boat.Position = Vector3.new(0, 5, 0)
    boat.Anchored = true
    boat.Parent = workspace

    local enemy = Instance.new("Part")
    enemy.Name = "Enemy"
    enemy.Size = Vector3.new(2, 5, 2)
    enemy.Position = Vector3.new(0, 5, 10)
    enemy.Anchored = true
    enemy.Parent = workspace

    local gun = Instance.new("Part")
    gun.Name = "Gun"
    gun.Size = Vector3.new(1, 1, 3)
    gun.Position = enemy.Position + Vector3.new(0, 0, 2)
    gun.Anchored = true
    gun.Parent = workspace

    local function onEnemyTouched(otherPart)
        if otherPart.Parent:FindFirstChild("Humanoid") then
            local player = Players:GetPlayerFromCharacter(otherPart.Parent)
            if player then
                local healthBar = player:FindFirstChild("Health")
                if healthBar then
                    healthBar.Value = healthBar.Value - 10
                end
            end
        end
    end

    enemy.Touched:Connect(onEnemyTouched)
end

local function onDayCycle()
    spawnEnemies()
end

game:GetService("RunService").Heartbeat:Connect(function()
    if dayCount >= 3 then
        onDayCycle()
    end
end)