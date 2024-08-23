local MAX_HEALTH = 100
local INITIAL_INJURY = 0
local INJURY_DECREASE_RATE = 1
local HEAL_AMOUNT = 10

local function initializePlayer(player)
	player:SetAttribute("Health", MAX_HEALTH)
	player:SetAttribute("Injury", INITIAL_INJURY)
end

game.Players.PlayerAdded:Connect(function(player)
	initializePlayer(player)
	player.CharacterAdded:Connect(function(character)
		player:SetAttribute("Health", MAX_HEALTH)
		player:SetAttribute("Injury", INITIAL_INJURY)
	end)
end)

local function applyInjury(player, injuryAmount)
	local currentHealth = player:GetAttribute("Health") or MAX_HEALTH
	local currentInjury = player:GetAttribute("Injury") or INITIAL_INJURY
	player:SetAttribute("Injury", math.min(currentInjury + injuryAmount, MAX_HEALTH))
	player:SetAttribute("Health", math.max(currentHealth - injuryAmount, 0))
end

local function healPlayer(player)
	local currentHealth = player:GetAttribute("Health") or MAX_HEALTH
	local injuryLevel = player:GetAttribute("Injury") or INITIAL_INJURY
	player:SetAttribute("Health", math.min(currentHealth + HEAL_AMOUNT, MAX_HEALTH))
	player:SetAttribute("Injury", math.max(injuryLevel - INJURY_DECREASE_RATE, 0))
end

local function simulateInjury(player)
	applyInjury(player, 20)
end

local function simulateHealing(player)
	healPlayer(player)
end
