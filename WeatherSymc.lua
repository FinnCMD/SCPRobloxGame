local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

local dayLength = 600
local currentTime = 0

local weatherTypes = {"Clear", "Rain", "Thunderstorm"}
local currentWeather = "Clear"
local weatherDuration = 120
local weatherChangeTimer = 0

local function changeWeather()
	currentWeather = weatherTypes[math.random(1, #weatherTypes)]

	if currentWeather == "Clear" then
		Lighting.Brightness = 2
		Lighting.FogEnd = 100000
		Lighting.Atmosphere.Density = 0.3
		Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
	elseif currentWeather == "Rain" then
		Lighting.Brightness = 1
		Lighting.FogEnd = 300
		Lighting.Atmosphere.Density = 0.5
		Lighting.OutdoorAmbient = Color3.fromRGB(100, 100, 100)
	elseif currentWeather == "Thunderstorm" then
		Lighting.Brightness = 0.5
		Lighting.FogEnd = 100
		Lighting.Atmosphere.Density = 0.7
		Lighting.OutdoorAmbient = Color3.fromRGB(80, 80, 80)
	end
end

local function updateTime(deltaTime)
	currentTime = (currentTime + deltaTime) % dayLength
	local timeOfDay = (currentTime / dayLength) * 24
	Lighting.ClockTime = timeOfDay
end

RunService.Heartbeat:Connect(function(deltaTime)
	updateTime(deltaTime)
	weatherChangeTimer = weatherChangeTimer + deltaTime
	if weatherChangeTimer >= weatherDuration then
		weatherChangeTimer = 0
		changeWeather()
	end
end)
