-- DayNightCycle.lua

local Players = game:GetService("Players")

local dayCount = 0

local function updateDayCount()
    dayCount = dayCount + 1
    for _, player in ipairs(Players:GetPlayers()) do
        local leaderstats = player:FindFirstChild("leaderstats")
        if not leaderstats then
            leaderstats = Instance.new("Folder")
            leaderstats.Name = "leaderstats"
            leaderstats.Parent = player
        end

        local daysSurvived = leaderstats:FindFirstChild("DaysSurvived")
        if not daysSurvived then
            daysSurvived = Instance.new("IntValue")
            daysSurvived.Name = "DaysSurvived"
            daysSurvived.Parent = leaderstats
        end
        daysSurvived.Value = dayCount
    end
end

local function onDayCycle()
    updateDayCount()
end

game:GetService("RunService").Heartbeat:Connect(function()
    if dayCount < 3 then
        onDayCycle()
    end
end)