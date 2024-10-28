-- Create the GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ToggleAutoAttackButton = Instance.new("TextButton")
local TitleLabel = Instance.new("TextLabel")
local StatusLabel = Instance.new("TextLabel")

-- Set up GUI properties
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0

-- Title Label
TitleLabel.Parent = MainFrame
TitleLabel.Size = UDim2.new(1, 0, 0.2, 0)
TitleLabel.Text = "Auto-Attack Menu"
TitleLabel.TextColor3 = Color3.fromRGB(255, 215, 0) -- Gold color
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 24
TitleLabel.BackgroundTransparency = 1

-- Toggle Auto Attack Button
ToggleAutoAttackButton.Parent = MainFrame
ToggleAutoAttackButton.Size = UDim2.new(0.9, 0, 0.4, 0)
ToggleAutoAttackButton.Position = UDim2.new(0.05, 0, 0.25, 0)
ToggleAutoAttackButton.Text = "Toggle Auto Attack"
ToggleAutoAttackButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleAutoAttackButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50) -- Green color
ToggleAutoAttackButton.Font = Enum.Font.SourceSansBold
ToggleAutoAttackButton.TextSize = 18
ToggleAutoAttackButton.BorderSizePixel = 0

-- Status Label
StatusLabel.Parent = MainFrame
StatusLabel.Size = UDim2.new(1, 0, 0.2, 0)
StatusLabel.Position = UDim2.new(0, 0, 0.65, 0)
StatusLabel.Text = "Auto Attack: OFF"
StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red color
StatusLabel.Font = Enum.Font.SourceSansBold
StatusLabel.TextSize = 18
StatusLabel.BackgroundTransparency = 1

-- Variables for auto attack
local autoAttackActive = false

-- Function to toggle auto attack
local function toggleAutoAttack()
    autoAttackActive = not autoAttackActive
    if autoAttackActive then
        StatusLabel.Text = "Auto Attack: ON"
        while autoAttackActive do
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            -- Move above enemies and attack
            for _, enemy in pairs(game.Workspace:GetChildren()) do
                if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") and enemy ~= character then
                    -- Position above the enemy
                    local enemyPosition = enemy.HumanoidRootPart.Position
                    humanoidRootPart.CFrame = CFrame.new(enemyPosition + Vector3.new(0, 20, 0)) -- Move above the enemy
                    
                    -- Attack
                    attackEnemy(enemy)
                    wait(1) -- Wait before attacking the next enemy
                end
            end

            wait(0.5) -- Wait briefly before re-evaluating enemies
        end
    else
        StatusLabel.Text = "Auto Attack: OFF"
    end
end

-- Function to hit enemies
local function attackEnemy(enemy)
    if enemy:FindFirstChild("Humanoid") then
        -- Simulate an attack (replace this with your attack method)
        enemy.Humanoid:TakeDamage(10) -- Deal a small amount of damage
        print("Attacked enemy for 10 damage!")
    end
end

-- Connect button click to toggle auto attack
ToggleAutoAttackButton.MouseButton1Click:Connect(toggleAutoAttack)

-- Make GUI movable
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        if dragging then
            update(input)
        end
    end
end)
