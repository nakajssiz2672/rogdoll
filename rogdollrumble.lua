-- Create the GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local SpeedButton = Instance.new("TextButton")
local FlyButton = Instance.new("TextButton")
local HealthButton = Instance.new("TextButton")
local TitleLabel = Instance.new("TextLabel")
local StatusLabel = Instance.new("TextLabel")

-- Set up GUI properties
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0.4, 0, 0.5, 0)
MainFrame.Position = UDim2.new(0.3, 0, 0.25, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0

-- Title Label
TitleLabel.Parent = MainFrame
TitleLabel.Size = UDim2.new(1, 0, 0.2, 0)
TitleLabel.Text = "Cheat Menu"
TitleLabel.TextColor3 = Color3.fromRGB(255, 215, 0) -- Gold color
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 36
TitleLabel.BackgroundTransparency = 1

-- Speed Button
SpeedButton.Parent = MainFrame
SpeedButton.Size = UDim2.new(0.8, 0, 0.15, 0)
SpeedButton.Position = UDim2.new(0.1, 0, 0.25, 0)
SpeedButton.Text = "Toggle Speed Boost"
SpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50) -- Green color
SpeedButton.Font = Enum.Font.SourceSansBold
SpeedButton.TextSize = 24
SpeedButton.BorderSizePixel = 0

-- Fly Button
FlyButton.Parent = MainFrame
FlyButton.Size = UDim2.new(0.8, 0, 0.15, 0)
FlyButton.Position = UDim2.new(0.1, 0, 0.45, 0)
FlyButton.Text = "Toggle Fly Mode"
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyButton.BackgroundColor3 = Color3.fromRGB(50, 50, 150) -- Blue color
FlyButton.Font = Enum.Font.SourceSansBold
FlyButton.TextSize = 24
FlyButton.BorderSizePixel = 0

-- Infinite Health Button
HealthButton.Parent = MainFrame
HealthButton.Size = UDim2.new(0.8, 0, 0.15, 0)
HealthButton.Position = UDim2.new(0.1, 0, 0.65, 0)
HealthButton.Text = "Toggle Infinite Health"
HealthButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HealthButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50) -- Red color
HealthButton.Font = Enum.Font.SourceSansBold
HealthButton.TextSize = 24
HealthButton.BorderSizePixel = 0

-- Status Label
StatusLabel.Parent = MainFrame
StatusLabel.Size = UDim2.new(1, 0, 0.15, 0)
StatusLabel.Position = UDim2.new(0, 0, 0.85, 0)
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red color
StatusLabel.Font = Enum.Font.SourceSansBold
StatusLabel.TextSize = 24
StatusLabel.BackgroundTransparency = 1

-- Variables for cheats
local speedBoostActive = false
local flyActive = false
local infiniteHealthActive = false

-- Function to toggle speed boost
local function toggleSpeedBoost()
    speedBoostActive = not speedBoostActive
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    if speedBoostActive then
        humanoid.WalkSpeed = 100 -- Increase speed
        StatusLabel.Text = "Speed Boost Activated"
    else
        humanoid.WalkSpeed = 16 -- Default speed
        StatusLabel.Text = "Speed Boost Deactivated"
    end
end

-- Function to toggle fly mode
local function toggleFly()
    flyActive = not flyActive
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    if flyActive then
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
        bodyVelocity.Parent = character:FindFirstChild("HumanoidRootPart")

        game:GetService("UserInputService").InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Keyboard then
                if input.KeyCode == Enum.KeyCode.Space then
                    bodyVelocity.Velocity = Vector3.new(0, 50, 0) -- Fly upwards
                end
            end
        end)

        StatusLabel.Text = "Fly Mode Activated"
    else
        for _, v in pairs(character:GetChildren()) do
            if v:IsA("BodyVelocity") then
                v:Destroy()
            end
        end
        StatusLabel.Text = "Fly Mode Deactivated"
    end
end

-- Function to toggle infinite health
local function toggleInfiniteHealth()
    infiniteHealthActive = not infiniteHealthActive
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    if infiniteHealthActive then
        humanoid.HealthChanged:Connect(function()
            humanoid.Health = humanoid.MaxHealth -- Restore health
        end)
        StatusLabel.Text = "Infinite Health Activated"
    else
        StatusLabel.Text = "Infinite Health Deactivated"
    end
end

-- Connect button clicks to functions
SpeedButton.MouseButton1Click:Connect(toggleSpeedBoost)
FlyButton.MouseButton1Click:Connect(toggleFly)
HealthButton.MouseButton1Click:Connect(toggleInfiniteHealth)

-- Cleanup on GUI removal
game.Players.LocalPlayer.PlayerRemoving:Connect(function()
    ScreenGui:Destroy()
end)
