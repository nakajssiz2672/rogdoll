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
AutoPlayButton.Position = UDim2.new(0.05, 0, 1.05, 0
