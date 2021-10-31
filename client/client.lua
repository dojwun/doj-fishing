

local fishing = false
local pause = false
local pausetimer = 0
local correct = 0
local bait = "none"
local genderNum = 0
local peds = {}

-- RegisterCommand("fish", function(source)
--     TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_FISHING", 0, true)
--     fishing = true
-- end)

--============================================================== Threads
Citizen.CreateThread(function()
	while true do
		Wait(1200)
		if pause and fishing then
			pausetimer = pausetimer + 1
		end
	end
end)

Citizen.CreateThread(function()
	Blip = AddBlipForCoord(Config.ReturnLocation.coords)
	SetBlipSprite(Blip, 410)
	SetBlipDisplay(Blip, 4)
	SetBlipScale(Blip, 0.8)
	SetBlipColour(Blip, 74)
    SetBlipAsShortRange(Blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("La-Puerta Fishing")
    EndTextCommandSetBlipName(Blip)
end)

Citizen.CreateThread(function()
	Blip = AddBlipForCoord(Config.PearlsSellsBlip)
	SetBlipSprite(Blip, 68)
	SetBlipDisplay(Blip, 4)
	SetBlipScale(Blip, 0.8)
	SetBlipColour(Blip, 74)
    SetBlipAsShortRange(Blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Pearl's Seafood Fish Sells")
    EndTextCommandSetBlipName(Blip)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if fishing then
				if IsControlJustReleased(0, 23) then
					input = 1
			   	end

			if IsPedUsingScenario(PlayerPedId(), "WORLD_HUMAN_STAND_FISHING") then
				BlockWeaponWheelThisFrame()
			end
			
			if IsControlJustReleased(0, Config.StopFishing) then
				fishing = false
				QBCore.Functions.Notify('You Stopped Fishing', 'error')
				TriggerEvent("fishing:break")
			end

			if fishing then
				playerPed = PlayerPedId()
				local pos = GetEntityCoords(playerPed)
				if GetWaterHeight(pos.x, pos.y, pos.z-2, pos.z-3.0)  then
				else
					fishing = false
					QBCore.Functions.Notify('You Stopped Fishing', 'error')
					exports['textUi']:DrawTextUi('hide')
				end
				if IsEntityDead(playerPed) or IsEntityInWater(playerPed) then
					QBCore.Functions.Notify('You Stopped Fishing', 'error')
					exports['textUi']:DrawTextUi('hide')
				end
			end
			
			if pausetimer > 3 then
				input = 99
			end
			
			if pause and input ~= 0 then
				pause = false
				if input == correct then
					TriggerEvent('fishing:SkillBar')
				else
					QBCore.Functions.Notify('The Fish Escaped!', 'error')
					exports['textUi']:DrawTextUi('hide')
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local wait = math.random(Config.FishingWaitTime.minTime , Config.FishingWaitTime.maxTime)
		Citizen.Wait(wait)
		if fishing then
			pause = true
			correct = 1
			TriggerEvent('3dme:triggerDisplay', 'Fishing Rod Starts to Tug!')
			exports['textUi']:DrawTextUi('show', "Press [F] to Catch Fish!")
			input = 0
			pausetimer = 0
		end	
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		for k = 1, #Config.PedList, 1 do
			v = Config.PedList[k]
			local playerCoords = GetEntityCoords(PlayerPedId())
			local dist = #(playerCoords - v.coords)

			if dist < Config.PedDistance and not peds[k] then
				local ped = nearPed(v.model, v.coords, v.heading, v.gender, v.animDict, v.animName, v.scenario)
				peds[k] = {ped = ped}
			end
			
			if dist >= Config.PedDistance and peds[k] then
				for i = 255, 0, -51 do
					Citizen.Wait(50)
					SetEntityAlpha(peds[k].ped, i, false)
				end
				DeletePed(peds[k].ped)
				peds[k] = nil
			end
		end
	end
end)

--============================================================== Events

RegisterNetEvent('fishing:SkillBar')
AddEventHandler('fishing:SkillBar', function(message)
	exports['textUi']:DrawTextUi('hide')
    local finished = exports["reload-skillbar"]:taskBar(math.random(5000,7500),math.random(2,4))
    if finished ~= 100 then
		QBCore.Functions.Notify('The Fish Got Away!', 'error')
    else
        local finished2 = exports["reload-skillbar"]:taskBar(math.random(2500,5000),math.random(3,5))
        if finished2 ~= 100 then
			QBCore.Functions.Notify('The Fish Escaped!', 'error')
        else
			local finished3 = exports["reload-skillbar"]:taskBar(math.random(900,2000),math.random(5,7))
			if finished3 ~= 100 then
				QBCore.Functions.Notify('The Fish Got Away!', 'error')
			else
				local time = 1750
				exports['progressBars']:drawBar(time, 'Fish Caught!')
				Citizen.Wait(time)
				TriggerServerEvent('fishing:server:catch', bait) 
				if math.random(1, 100) < 50 then
					TriggerServerEvent('hud:server:RelieveStress', 50)
				end
				PlaySoundFrontend(-1, "OK", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			end
        end
    end
end)



RegisterNetEvent('fishing:break')
AddEventHandler('fishing:break', function()
	fishing = false
	ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('sharktiger:spawnFish')
AddEventHandler('sharktiger:spawnFish', function()
	RequestTheModel("A_C_SharkTiger")
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, `A_C_SharkTiger`, pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
	DecorSetInt(ped, "propHack", 74)
	SetModelAsNoLongerNeeded(`A_C_SharkTiger`)
	Wait(10000)
        DeletePed(ped)	
end)

RegisterNetEvent('killerwhale:spawnFish')
AddEventHandler('killerwhale:spawnFish', function()
	RequestTheModel("A_C_KillerWhale")
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, `A_C_KillerWhale`, pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
	DecorSetInt(ped, "propHack", 74)
	SetModelAsNoLongerNeeded(`A_C_KillerWhale`)
	Wait(10000)
        DeletePed(ped)
end)

RegisterNetEvent('stingray:spawnFish')
AddEventHandler('stingray:spawnFish', function()
	RequestTheModel("A_C_stingray")
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, `A_C_stingray`, pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
	DecorSetInt(ped, "propHack", 74)
	SetModelAsNoLongerNeeded(`A_C_stingray`)
	Wait(10000)
        DeletePed(ped)
end)

RegisterNetEvent('sharkhammer:spawnFish')
AddEventHandler('sharkhammer:spawnFish', function()
	RequestTheModel("A_C_sharkhammer")
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, `A_C_sharkhammer`, pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
	DecorSetInt(ped, "propHack", 74)
	SetModelAsNoLongerNeeded(`A_C_sharkhammer`)
	Wait(10000)
        DeletePed(ped)
end)

RegisterNetEvent('dolphin:spawnFish')
AddEventHandler('dolphin:spawnFish', function()
	RequestTheModel("A_C_dolphin")
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, `A_C_dolphin`, pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
	DecorSetInt(ped, "propHack", 74)
	SetModelAsNoLongerNeeded(`A_C_dolphin`)
	Wait(10000)
        DeletePed(ped)
end)

RegisterNetEvent('fish:spawnFish')
AddEventHandler('fish:spawnFish', function()
	RequestTheModel("a_c_fish")
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, `a_c_fish`, pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
	DecorSetInt(ped, "propHack", 74)
	SetModelAsNoLongerNeeded(`a_c_fish`)
	Wait(10000)
    DeletePed(ped)
end)

RegisterNetEvent('fishing:setbait')
AddEventHandler('fishing:setbait', function(bool)
	bait = bool
end)

RegisterNetEvent('fishing:client:progressBar')
AddEventHandler('fishing:client:progressBar', function()
	exports['progressBars']:drawBar(1000, 'Applying Fishing Bait')
end)

RegisterNetEvent('fishing:fishstart')
AddEventHandler('fishing:fishstart', function()
	playerPed = PlayerPedId()
	local pos = GetEntityCoords(PlayerPedId())
	if IsPedInAnyVehicle(playerPed) then
		QBCore.Functions.Notify('You can not fish from a vehicle', 'error')
	else
		if GetWaterHeight(pos.x, pos.y, pos.z-2, pos.z - 3.0)  then
			local time = 2500
			exports['progressBars']:drawBar(time, 'Using Fishing Rod')
			Citizen.Wait(time)
			exports['textUi']:DrawTextUi('show', "Press [X] to stop fishing at any time")
			TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_FISHING", 0, true)
			fishing = true
			Citizen.Wait(3700)
			exports['textUi']:DrawTextUi('hide')
		else
			QBCore.Functions.Notify('You need to go further away from the shore', 'error')
		end
	end
end, false)

RegisterNetEvent('doj:OpenBoatsMenu')
AddEventHandler('doj:OpenBoatsMenu', function()
	local ped = PlayerPedId()
    local inVehicle = IsPedInAnyVehicle(ped)
	if Config.Fish24hours then
		if inVehicle then
			ReturnBoatMenu()
		else
			OpenBoatMenu()
		end
	else
		if GetClockHours() >= 6 and GetClockHours() <= 21 then
			if inVehicle then
				ReturnBoatMenu()
			else
				OpenBoatMenu()
			end
		else
			QBCore.Functions.Notify('Too Late to Fish!, Opened from 6:00am / 21:00pm', 'error')
		end
	end
end)

RegisterNetEvent('doj:client:ReturnBoat')
AddEventHandler('doj:client:ReturnBoat', function()
	local ped = PlayerPedId()
	if IsPedInAnyVehicle(ped) then
		local boat = GetVehiclePedIsIn(ped,true) 
		QBCore.Functions.DeleteVehicle(boat)
		SetEntityCoords(ped, Config.ReturnLocation.coords.x, Config.ReturnLocation.coords.y, Config.ReturnLocation.coords.z, 0, 0, 0, false) 
		SetEntityHeading(ped, Config.ReturnLocation.coords.w)
		TriggerServerEvent('fishing:server:returnDeposit')
	end
end)

RegisterNetEvent('doj:client:rentaBoat')
AddEventHandler('doj:client:rentaBoat', function()
	QBCore.Functions.TriggerCallback('fishing:server:checkMoney', function(isSuccess)
        if isSuccess then
			QBCore.Functions.SpawnVehicle(Config.RentalBoat, function(boat)
				SetVehicleNumberPlateText(boat, "Rent-a-Boat")
				exports['LegacyFuel']:SetFuel(boat, 100.0)
				SetEntityHeading(boat, Config.SpawnLocation.coords.w)
				TaskWarpPedIntoVehicle(PlayerPedId(), boat, -1)
				TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(boat))
				SetVehicleEngineOn(boat, true, true)
			end, Config.SpawnLocation.coords, true) 
        end
    end)       
end)

RegisterNetEvent('doj:client:SellLegalFish')
AddEventHandler('doj:client:SellLegalFish', function()
    exports['qb-menu']:openMenu({
		{
            header = "Pearl's Seafood Restaurant",
            isMenuHeader = true
        },
		{
            header = "Sell Fish",
            txt = "Current Price: $"..Config.fishPrice.." each",
            params = {
				isServer = true,
                event = "fishing:server:SellLegalFish",
				args = 1
            }
        },
		{
            header = "Sell Stingrays",
            txt = "Current Price: $"..Config.stingrayPrice.." each",
            params = {
				isServer = true,
                event = "fishing:server:SellLegalFish",
				args = 2
            }
        },
        {
            header = "Close",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end)

RegisterNetEvent('doj:client:buyFishingGear')
AddEventHandler('doj:client:buyFishingGear', function() 
    exports['qb-menu']:openMenu({
		{
            header = "Purchase Fishing Gear",
            isMenuHeader = true
        },
		{
            header = "Buy Fishing Rod",
            txt = "$"..Config.fishingRodPrice,
            params = {
				isServer = true,
                event = "fishing:server:BuyFishingGear",
				args = 1
            }
        },
		{
            header = "Buy Fishing Bait",
            txt = "$"..Config.fishingBaitPrice,
            params = {
				isServer = true,
                event = "fishing:server:BuyFishingGear",
				args = 2
            }
        },
        {
            header = "Close",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end)

RegisterNetEvent('doj:client:SellillegalFish')
AddEventHandler('doj:client:SellillegalFish', function() 
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
			local charinfo = QBCore.Functions.GetPlayerData().charinfo
			QBCore.Functions.Notify('Welcome, '..charinfo.firstname..' '..charinfo.lastname)
			exports['qb-menu']:openMenu({
				{
					header = "Pearl's Seafood Restaurant",
					isMenuHeader = true
				},
				{
					header = "Sell Dolphin",
					txt = "Current Price: $"..Config.dolphinPrice.." each",
					params = {
						isServer = true,
						event = "fishing:server:SellillegalFish",
						args = 1
					}
				},
				{
					header = "Sell Tiger Shark",
					txt = "Current Price: $"..Config.sharktigerPrice.." each",
					params = {
						isServer = true,
						event = "fishing:server:SellillegalFish",
						args = 2
					}
				},
				{
					header = "Sell Hammerhead Shark",
					txt = "Current Price: $"..Config.sharkhammerPrice.." each",
					params = {
						isServer = true,
						event = "fishing:server:SellillegalFish",
						args = 3
					}
				},
				{
					header = "Sell Killer Whale",
					txt = "Current Price: $"..Config.killerwhalePrice.." each",
					params = {
						isServer = true,
						event = "fishing:server:SellillegalFish",
						args = 4
					}
				},
				{
					header = "Close",
					txt = "",
					params = {
						event = "qb-menu:closeMenu"
					}
				},
			})
		else
			QBCore.Functions.Notify('You cannot sell to us at the moment, sorry for the inconvenience', 'error', 3500)
		end
	end, Config.PearlsExoticCard)
end)

--============================================================== Functions

function RequestTheModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(0)
	end
end

function OpenBoatMenu()
    exports['qb-menu']:openMenu({
        {
            header = "Fishing Boat Rental",
            isMenuHeader = true
        },
        {
            header = "Boat: "..Config.RentalBoat,
            txt = "Price: $"..Config.BoatPrice,
            params = {
                event = "doj:client:rentaBoat",
            }
        },
        {
            header = "Close",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end 

function ReturnBoatMenu()
    exports['qb-menu']:openMenu({
		{
            header = "Fishing Boat Rental",
            isMenuHeader = true
        },
		{
            header = "Return Boat",
            txt = "return and get $"..math.floor(Config.BoatPrice/2),
            params = {
                event = "doj:client:ReturnBoat",
            }
        },
        {
            header = "Close",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end 

function nearPed(model, coords, heading, gender, animDict, animName, scenario)
	RequestModel(GetHashKey(model))
	while not HasModelLoaded(GetHashKey(model)) do
		Citizen.Wait(1)
	end
	
	if gender == 'male' then
		genderNum = 4
	elseif gender == 'female' then 
		genderNum = 5
	else
		print("No gender provided! Check your configuration!")
	end	

	ped = CreatePed(genderNum, GetHashKey(v.model), coords, heading, false, true)
	SetEntityAlpha(ped, 0, false)
	
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	if animDict and animName then
		RequestAnimDict(animDict)
		while not HasAnimDictLoaded(animDict) do
			Citizen.Wait(1)
		end
		TaskPlayAnim(ped, animDict, animName, 8.0, 0, -1, 1, 0, 0, 0)
	end
	if scenario then
		TaskStartScenarioInPlace(ped, scenario, 0, true)
	end
	for i = 0, 255, 51 do
		Citizen.Wait(50)
		SetEntityAlpha(ped, i, false)
	end
	
	return ped
end

--============================================================== Exports

exports['qb-target']:AddTargetModel(`s_m_y_ammucity_01`, {
    options = {
        {
            event = "doj:OpenBoatsMenu",
            icon = "fas fa-anchor",
            label = "Boat Menu",
        },
		{
            event = "doj:client:buyFishingGear",
            icon = "fas fa-fish",
            label = "Buy Fishing Gear",
        },
    },
    distance = 10.0
}) 

exports['qb-target']:AddTargetModel(`s_m_y_busboy_01`, {
    options = {
        {
            event = "doj:client:SellLegalFish",
            icon = "fa fa-fish",
            label = "Sell Fish",
        },
		{
            event = "doj:client:SellillegalFish",
            icon = "fa fa-fish",
            label = "Sell Exotic Fish",
        },
    },
    distance = 10.0
}) 

