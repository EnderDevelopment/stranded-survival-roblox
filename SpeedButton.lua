-- SpeedButton.lua

local Players = game:GetService("Players")

local function onPlayerAdded(player)
    local speedButton = Instance.new("TextButton")
    speedButton.Name = "SpeedButton"
    speedButton.Size = UDim2.new(0, 100, 0, 50)
    speedButton.Position = UDim2.new(0.5, -50, 0.8, 0)
    speedButton.Text = "Speed Boost"
    speedButton.Parent = player:WaitForChild("PlayerGui")

    local cooldown = false

    local function onSpeedButtonClicked()
        if not cooldown then
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = 20
                    cooldown = true
                    speedButton.Text = "Cooldown"
                    wait(10)
                    humanoid.WalkSpeed = 16
                    cooldown = false
                    speedButton.Text = "Speed Boost"
                end
            end
        end
    end

    speedButton.MouseButton1Click:Connect(onSpeedButtonClicked)
end

Players.PlayerAdded:Connect(onPlayerAdded)