local administratorIds = {
	3394423549, 
	3175070715,
	1112026961,
	1578833506
}

local function createHeadTag(player)
	local character = player.Character
	if not character or not character:FindFirstChild("Head") then
		return
	end

	local billboardGui = Instance.new("BillboardGui")
	billboardGui.Name = "PlayerHeadTag"
	billboardGui.Parent = character.Head
	billboardGui.Size = UDim2.new(3, 0, 1, 0)
	billboardGui.StudsOffset = Vector3.new(0, 3, 0)
	billboardGui.AlwaysOnTop = true

	local rankLabel = Instance.new("TextLabel")
	rankLabel.Parent = billboardGui
	rankLabel.Size = UDim2.new(1, 0, 0.5, 0)
	rankLabel.BackgroundTransparency = 1

	local rank = player:GetAttribute("Rank") or "unknown"
	rankLabel.Text = rank
	rankLabel.TextScaled = true
	rankLabel.Font = Enum.Font.SourceSansBold
	rankLabel.TextStrokeTransparency = 0.5

	if rank == "Administrator" then
		rankLabel.TextColor3 = Color3.fromRGB(139, 0, 0) -- Dark Red
	elseif rank == "Class-D" then
		rankLabel.TextColor3 = Color3.fromRGB(255, 165, 0) -- Orange
	else
		rankLabel.TextColor3 = Color3.new(1, 1, 1) -- Default White
	end

	local nameLabel = Instance.new("TextLabel")
	nameLabel.Parent = billboardGui
	nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
	nameLabel.Position = UDim2.new(0, 0, 0.5, 0)
	nameLabel.BackgroundTransparency = 1
	nameLabel.Text = "@" .. player.Name
	nameLabel.TextColor3 = Color3.new(0.282353, 0.282353, 0.282353)
	nameLabel.TextScaled = true
	nameLabel.Font = Enum.Font.SourceSans
	nameLabel.TextStrokeTransparency = 0.5
end

game.Players.PlayerAdded:Connect(function(player)
    
	local isAdmin = false
	for _, id in ipairs(administratorIds) do
		if player.UserId == id then
			isAdmin = true
			break
		end
	end

	local role = isAdmin and "Administrator" or "Class-D"
	player:SetAttribute("Rank", role)

	player.CharacterAdded:Connect(function()
		createHeadTag(player)
	end)
end)
