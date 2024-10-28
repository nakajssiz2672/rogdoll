-- Create the GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ToggleSizeButton = Instance.new("TextButton")
local AutoDodgeButton = Instance.new("TextButton")
local HitboxButton = Instance.new("TextButton")
local OneHitKillButton = Instance.new("TextButton")
local AutoPlayButton = Instance.new("TextButton")
local TitleLabel = Instance.new("TextLabel")
local StatusLabel = Instance.new("TextLabel")

-- Set up GUI properties
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0.3, 0, 0.4, 0) -- Small size initially
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0

-- Title Label
TitleLabel.Parent = MainFrame
TitleLabel.Size = UDim2.new(1, 0, 0.2, 0)
TitleLabel.Text = "Cheat Menu"
TitleLabel.TextColor3 = Color3.fromRGB(255, 215, 0) -- Gold color
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 24
TitleLabel.BackgroundTransparency = 1

-- Toggle Size Button
ToggleSizeButton.Parent = MainFrame
ToggleSizeButton.Size = UDim2.new(0.9, 0, 0.15, 0)
ToggleSizeButton.Position = UDim2.new(0.05, 0, 0.25, 0)
ToggleSizeButton.Text = "Toggle Size"
ToggleSizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleSizeButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50) -- Green color
ToggleSizeButton.Font = Enum.Font.SourceSansBold
ToggleSizeButton.TextSize = 18
ToggleSizeButton.BorderSizePixel = 0

-- Auto Dodge Button
AutoDodgeButton.Parent = MainFrame
AutoDodgeButton.Size = UDim2.new(0.9, 0, 0.15, 0)
AutoDodgeButton.Position = UDim2.new(0.05, 0, 0.45, 0)
AutoDodgeButton.Text = "Toggle Auto Dodge"
AutoDodgeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoDodgeButton.BackgroundColor3 = Color3.fromRGB(50, 150, 150) -- Cyan color
AutoDodgeButton.Font = Enum.Font.SourceSansBold
AutoDodgeButton.TextSize = 18
AutoDodgeButton.BorderSizePixel = 0

-- Hitbox Button
HitboxButton.Parent = MainFrame
HitboxButton.Size = UDim2.new(0.9, 0, 0.15, 0)
HitboxButton.Position = UDim2.new(0.05, 0, 0.65, 0)
HitboxButton.Text = "Toggle Hitbox"
HitboxButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HitboxButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50) -- Red color
HitboxButton.Font = Enum.Font.SourceSansBold
HitboxButton.TextSize = 18
HitboxButton.BorderSizePixel = 0

-- One Hit Kill Button
OneHitKillButton.Parent = MainFrame
OneHitKillButton.Size = UDim2.new(0.9, 0, 0.15, 0)
OneHitKillButton.Position = UDim2.new(0.05, 0, 0.85, 0)
OneHitKillButton.Text = "Toggle One Hit Kill"
OneHitKillButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OneHitKillButton.BackgroundColor3 = Color3.fromRGB(150, 150, 50) -- Yellow color
OneHitKillButton.Font = Enum.Font.SourceSansBold
OneHitKillButton.TextSize = 18
OneHitKillButton.BorderSizePixel = 0

-- Auto Play Button
AutoPlayButton.Parent = MainFrame
AutoPlayButton.Size = UDim2.new(0.9, 0, 0.15, 0)
AutoPlayButton.Position = UDim2.new(0.05, 0, 1.05, 0)
AutoPlayButton.Text = "Toggle Auto Play"
AutoPlayButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoPlayButton.BackgroundColor3 = Color3.fromRGB(150, 100, 250) -- Purple color
AutoPlayButton.Font = Enum.Font.SourceSansBold
AutoPlayButton.TextSize = 18
AutoPlayButton.BorderSizePixel = 0

-- Status Label
StatusLabel.Parent = MainFrame
StatusLabel.Size = UDim2.new(1, 0, 0.15, 0)
StatusLabel.Position = UDim2.new(0, 0, 1.1, 0)
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red color
StatusLabel.Font = Enum.Font.SourceSansBold
StatusLabel.TextSize = 18
StatusLabel.BackgroundTransparency = 1

-- Variables for cheats
local autoDodgeActive = false
local hitboxActive = false
local oneHitKillActive = false
local autoPlayActive = false

-- Function to toggle size of GUI
local function toggleSize()
    if MainFrame.Size == UDim2.new(0.3, 0, 0.4, 0) then
        MainFrame.Size = UDim2.new(0.15, 0, 0.15, 0) -- Make smaller
    else
        MainFrame.Size = UDim2.new(0.3, 0, 0.4, 0) -- Make larger
    end
end

-- Function to toggle auto dodge
local function toggleAutoDodge()
    autoDodgeActive = not autoDodgeActive
    if autoDodgeActive then
        StatusLabel.Text = "Auto Dodge Activated"
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")

        humanoid.Died:Connect(function()
            autoDodgeActive = false
            StatusLabel.Text = "Auto Dodge Deactivated"
        end)

        -- Auto dodge logic
        game:GetService("RunService").RenderStepped:Connect(function()
            if autoDodgeActive then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping) -- Auto dodge action
                wait(0.5) -- Delay to dodge
            end
        end)
    else
        StatusLabel.Text = "Auto Dodge Deactivated"
    end
end

-- Function to toggle hitbox enlargement
local function toggleHitbox()
    hitboxActive = not hitboxActive
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    if hitboxActive then
        for _, part in ipairs(character:GetChildren()) do
            if part:IsA("Part") and part.Name ~= "HumanoidRootPart" then
                part.Size = part.Size * 2 -- Double the size of each part
            end
        end
        StatusLabel.Text = "Hitbox Enlarged"
    else
        for _, part in ipairs(character:GetChildren()) do
            if part:IsA("Part") and part.Name ~= "HumanoidRootPart" then
                part.Size = part.Size / 2 -- Reset to original size
            end
        end
        StatusLabel.Text = "Hitbox Reset"
    end
end

-- Function to toggle one-hit kill
local function toggleOneHitKill()
    oneHitKillActive = not oneHitKillActive
    if oneHitKillActive then
        StatusLabel.Text = "One Hit Kill Activated"
    else
        StatusLabel.Text = "One Hit Kill Deactivated"
    end
end

-- Function to toggle auto play
local function toggleAutoPlay()
    autoPlayActive = not autoPlayActive
    if autoPlayActive then
        StatusLabel.Text = "Auto Play Activated"
        while autoPlayActive do
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            local enemies = game.Workspace:GetChildren()

            for _, enemy in ipairs(enemies) do
                if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") and enemy ~= character then
                    -- Move towards the enemy
                    humanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5) -- Move closer

                    -- Attack
                    hitEnemy(enemy)
                    wait(1) -- Wait before attacking the next enemy
                end
            end
