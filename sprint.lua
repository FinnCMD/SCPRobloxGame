local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local walkSpeed = 16
local sprintSpeed = 30

local function updateWalkSpeed(isSprinting)
	if isSprinting then
		humanoid.WalkSpeed = sprintSpeed
	else
		humanoid.WalkSpeed = walkSpeed
	end
end

UserInputService.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.LeftShift then
		updateWalkSpeed(true)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.LeftShift then
		updateWalkSpeed(false)
	end
end)
