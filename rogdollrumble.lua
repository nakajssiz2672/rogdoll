-- Ragdoll Rumble Auto Attack Script
-- Place this in your Delta Executor

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local AttackButton = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.Size = UDim2.new(0, 200, 0, 100)

AttackButton.Parent = Frame
AttackButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
AttackButton.Size = UDim2.new(1, 0, 1, 0)
AttackButton.Text = "Auto Attack"
AttackButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Function to make the GUI movable
local function makeMovable(frame)
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    game:GetService("RunService").RenderStepped:Connect(function()
        if dragging and dragInput then
            update(dragInput)
        end
    end)
end

makeMovable(Frame)

-- Function to equip hammer and auto attack
local function autoAttack()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hammer = character:FindFirstChild("Hammer") -- Ensure this matches the hammer's actual name

    if hammer then
        character.Humanoid:EquipTool(hammer) -- Equip the hammer

        while AttackButton.Text == "Stop Attack" do
            local enemies = game.Workspace:GetChildren()
            for _, enemy in ipairs(enemies) do
                if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("Head") then
                    local distance = (enemy.Head.Position - character.HumanoidRootPart.Position).magnitude
                    if distance < 30 then -- Attack range
                        hammer:Activate() -- Activate the hammer attack
                        wait(0.5) -- Adjust this wait time for attack frequency
                    end
                end
            end
            wait(1) -- Check every second
        end
    else
        print("Hammer not found.")
    end
end

AttackButton.MouseButton1Click:Connect(function()
    if AttackButton.Text == "Auto Attack" then
        AttackButton.Text = "Stop Attack"
        autoAttack()
    else
        AttackButton.Text = "Auto Attack"
    end
end)
