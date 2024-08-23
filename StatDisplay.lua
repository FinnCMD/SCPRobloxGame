local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PlayerStatsDisplayGui"
screenGui.Parent = playerGui

local statsFrame = Instance.new("Frame")
statsFrame.Size = UDim2.new(0.2, 0, 0.1, 0)
statsFrame.Position = UDim2.new(0.8, 0, 0.9, 0)
statsFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
statsFrame.BackgroundTransparency = 0.5
statsFrame.Parent = screenGui

local healthLabel = Instance.new("TextLabel")
healthLabel.Size = UDim2.new(1, 0, 0.5, 0)
healthLabel.Position = UDim2.new(0, 0, 0, 0)
healthLabel.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
healthLabel.BackgroundTransparency = 0.5
healthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
healthLabel.TextScaled = true
healthLabel.TextWrapped = true
healthLabel.TextXAlignment = Enum.TextXAlignment.Left
healthLabel.TextYAlignment = Enum.TextYAlignment.Center
healthLabel.Text = "Health: --"
healthLabel.Parent = statsFrame

local roleLabel = Instance.new("TextLabel")
roleLabel.Size = UDim2.new(1, 0, 0.5, 0)
roleLabel.Position = UDim2.new(0, 0, 0.5, 0)
roleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
roleLabel.BackgroundTransparency = 0.7
roleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
roleLabel.TextScaled = true
roleLabel.TextWrapped = true
roleLabel.TextXAlignment = Enum.TextXAlignment.Left
roleLabel.TextYAlignment = Enum.TextYAlignment.Center
roleLabel.Text = "Role: --"
roleLabel.Parent = statsFrame

local function updateHealthDisplay(healthPercentage)
	local healthText = "Health: " .. math.floor(healthPercentage * 100) .. "%"
	healthLabel.Text = healthText
	healthLabel.Size = UDim2.new(healthPercentage, 0, 0.5, 0)
end

local function updateStats()
	local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		local healthPercentage = humanoid.Health / humanoid.MaxHealth
		updateHealthDisplay(healthPercentage)
	end

	local rank = player:GetAttribute("Rank")
	if rank then
		roleLabel.Text = "Role: " .. rank
	else
		roleLabel.Text = "Role: Unknown"
	end
end

RunService.RenderStepped:Connect(function()
	updateStats()
end)
