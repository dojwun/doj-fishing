

local fishing = false
local pause = false
local pausetimer = 0
local correct = 0
local bait = "none"
local genderNum = 0
local peds = {}

--============================================================== For testing

if Config.TestFish then 
	RegisterCommand("startfish", function(source)
		TriggerEvent("fishing:fishstart")
	end)

	RegisterCommand('spawnfish', function()
		local  RandomFish = {     
			"killerwhale",
			"dolphin",
			"sharkhammer",
			"sharktiger",
			"none",
			"stingray",
			"fish"
		}
		local FishBait = RandomFish[math.random(#RandomFish)] 
		TriggerServerEvent('fishing:server:catch', FishBait) 
	end, false)
end

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
	while true do
		Citizen.Wait(1)
		if fishing then
				if IsControlJustReleased(0, 23) then
					input = 1
			   	end

			if IsControlJustReleased(0, Config.StopFishing) then
				endFishing()
			end

			if fishing then
				playerPed = PlayerPedId()
				local pos = GetEntityCoords(playerPed)
				if GetWaterHeight(pos.x, pos.y, pos.z-2, pos.z-3.0)  then
				else
					endFishing()
				end
				if IsEntityDead(playerPed) or IsEntityInWater(playerPed) then
					endFishing()
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
				catchAnimation()
			end
        end
    end
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
			-- TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_FISHING", 0, true)
			-- fishing = true
			fishAnimation()
		else
			QBCore.Functions.Notify('You need to go further away from the shore', 'error')
		end
	end
end, false)

RegisterNetEvent('doj:client:ReturnBoat')
AddEventHandler('doj:client:ReturnBoat', function(args)
	local ped = PlayerPedId()
	local args = tonumber(args)
	if IsPedInAnyVehicle(ped) then
		if args == 1 then 
			local boat = GetVehiclePedIsIn(ped,true) 
			QBCore.Functions.DeleteVehicle(boat)
			SetEntityCoords(ped, Config.PlayerReturnLocation.LaPuerta.x, Config.PlayerReturnLocation.LaPuerta.y, Config.PlayerReturnLocation.LaPuerta.z, 0, 0, 0, false) 
			SetEntityHeading(ped, Config.PlayerReturnLocation.LaPuerta.w)
			TriggerServerEvent('fishing:server:returnDeposit')
		elseif args == 2 then
			local boat = GetVehiclePedIsIn(ped,true) 
			QBCore.Functions.DeleteVehicle(boat)
			SetEntityCoords(ped, Config.PlayerReturnLocation.PaletoCove.x, Config.PlayerReturnLocation.PaletoCove.y, Config.PlayerReturnLocation.PaletoCove.z, 0, 0, 0, false) 
			SetEntityHeading(ped, Config.PlayerReturnLocation.PaletoCove.w)
			TriggerServerEvent('fishing:server:returnDeposit')
		elseif args == 3 then
			local boat = GetVehiclePedIsIn(ped,true) 
			QBCore.Functions.DeleteVehicle(boat)
			SetEntityCoords(ped, Config.PlayerReturnLocation.ElGordo.x, Config.PlayerReturnLocation.ElGordo.y, Config.PlayerReturnLocation.ElGordo.z, 0, 0, 0, false) 
			SetEntityHeading(ped, Config.PlayerReturnLocation.ElGordo.w)
			TriggerServerEvent('fishing:server:returnDeposit')
		elseif args == 3 then
			local boat = GetVehiclePedIsIn(ped,true) 
			QBCore.Functions.DeleteVehicle(boat)
			SetEntityCoords(ped, Config.PlayerReturnLocation.ActDam.x, Config.PlayerReturnLocation.ActDam.y, Config.PlayerReturnLocation.ActDam.z, 0, 0, 0, false) 
			SetEntityHeading(ped, Config.PlayerReturnLocation.ActDam.w)
			TriggerServerEvent('fishing:server:returnDeposit')
		else
			local boat = GetVehiclePedIsIn(ped,true) 
			QBCore.Functions.DeleteVehicle(boat)
			SetEntityCoords(ped, Config.PlayerReturnLocation.AlamoSea.x, Config.PlayerReturnLocation.AlamoSea.y, Config.PlayerReturnLocation.AlamoSea.z, 0, 0, 0, false) 
			SetEntityHeading(ped, Config.PlayerReturnLocation.AlamoSea.w)
			TriggerServerEvent('fishing:server:returnDeposit')
		end
	end
end)

RegisterNetEvent('doj:client:rentaBoat')
AddEventHandler('doj:client:rentaBoat', function(args)
	local args = tonumber(args)
	QBCore.Functions.TriggerCallback('fishing:server:checkMoney', function(isSuccess)
		if isSuccess then
			if args == 1 then 
				QBCore.Functions.SpawnVehicle(Config.RentalBoat, function(boat)
					SetVehicleNumberPlateText(boat, "Rent-a-Boat")
					exports['LegacyFuel']:SetFuel(boat, 100.0)
					SetEntityHeading(boat, Config.BoatSpawnLocation.LaPuerta.w)
					TaskWarpPedIntoVehicle(PlayerPedId(), boat, -1)
					TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(boat))
					SetVehicleEngineOn(boat, true, true)
				end, Config.BoatSpawnLocation.LaPuerta, true) 
			elseif args == 2 then 
				QBCore.Functions.SpawnVehicle(Config.RentalBoat, function(boat)
					SetVehicleNumberPlateText(boat, "Rent-a-Boat")
					exports['LegacyFuel']:SetFuel(boat, 100.0)
					SetEntityHeading(boat, Config.BoatSpawnLocation.PaletoCove.w)
					TaskWarpPedIntoVehicle(PlayerPedId(), boat, -1)
					TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(boat))
					SetVehicleEngineOn(boat, true, true)
				end, Config.BoatSpawnLocation.PaletoCove, true) 
			elseif args == 3 then 
				QBCore.Functions.SpawnVehicle(Config.RentalBoat, function(boat)
					SetVehicleNumberPlateText(boat, "Rent-a-Boat")
					exports['LegacyFuel']:SetFuel(boat, 100.0)
					SetEntityHeading(boat, Config.BoatSpawnLocation.ElGordo.w)
					TaskWarpPedIntoVehicle(PlayerPedId(), boat, -1)
					TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(boat))
					SetVehicleEngineOn(boat, true, true)
				end, Config.BoatSpawnLocation.ElGordo, true) 
			elseif args == 3 then
				QBCore.Functions.SpawnVehicle(Config.RentalBoat, function(boat)
					SetVehicleNumberPlateText(boat, "Rent-a-Boat")
					exports['LegacyFuel']:SetFuel(boat, 100.0)
					SetEntityHeading(boat, Config.BoatSpawnLocation.ActDam.w)
					TaskWarpPedIntoVehicle(PlayerPedId(), boat, -1)
					TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(boat))
					SetVehicleEngineOn(boat, true, true)
				end, Config.BoatSpawnLocation.ActDam, true) 
			else
				QBCore.Functions.SpawnVehicle(Config.RentalBoat, function(boat)
					SetVehicleNumberPlateText(boat, "Rent-a-Boat")
					exports['LegacyFuel']:SetFuel(boat, 100.0)
					SetEntityHeading(boat, Config.BoatSpawnLocation.AlamoSea.w)
					TaskWarpPedIntoVehicle(PlayerPedId(), boat, -1)
					TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(boat))
					SetVehicleEngineOn(boat, true, true)
				end, Config.BoatSpawnLocation.AlamoSea, true) 
			end  
		end
	end)
end)

RegisterNetEvent('doj:client:BoatMenu')
AddEventHandler('doj:client:BoatMenu', function(data)
	local ped = PlayerPedId()
    local inVehicle = IsPedInAnyVehicle(ped)
	if data.location == 1 then 
        if Config.Fish24hours then
            if inVehicle then
                ReturnBoatLaPuerta()
            else
                BoatMenuLaPuerta()
            end
        else
            if GetClockHours() >= 6 and GetClockHours() <= 21 then
                if inVehicle then
                    ReturnBoatLaPuerta()
                else
                    BoatMenuLaPuerta()
                end
            else
                QBCore.Functions.Notify('Too Late to Fish!, Opened from 6:00am / 21:00pm', 'error')
            end
        end
	elseif data.location == 2 then
        if Config.Fish24hours then
            if inVehicle then
                ReturnBoatPaletoCove()
            else
                BoatMenuPaletoCove()
            end
        else
            if GetClockHours() >= 6 and GetClockHours() <= 21 then
                if inVehicle then
                    ReturnBoatPaletoCove()
                else
                    BoatMenuPaletoCove()
                end
            else
                QBCore.Functions.Notify('Too Late to Fish!, Opened from 6:00am / 21:00pm', 'error')
            end
        end
    elseif data.location == 3 then
        if Config.Fish24hours then
            if inVehicle then
                ReturnBoatElGordo()
            else
                BoatMenuElGordo()
            end
        else
            if GetClockHours() >= 6 and GetClockHours() <= 21 then
                if inVehicle then
                    ReturnBoatElGordo()
                else
                    BoatMenuElGordo()
                end
            else
                QBCore.Functions.Notify('Too Late to Fish!, Opened from 6:00am / 21:00pm', 'error')
            end
        end
    elseif data.location == 4 then
		if Config.Fish24hours then
			if inVehicle then
				ReturnBoatActDam()
			else
				BoatMenuActDam()
			end
		else
			if GetClockHours() >= 6 and GetClockHours() <= 21 then
				if inVehicle then
					ReturnBoatActDam()
				else
					BoatMenuActDam()
				end
			else
				QBCore.Functions.Notify('Too Late to Fish!, Opened from 6:00am / 21:00pm', 'error')
			end
		end
	else
        if Config.Fish24hours then
            if inVehicle then
                ReturnBoatAlamoSea()
            else
                BoatMenuAlamoSea()
            end
        else
            if GetClockHours() >= 6 and GetClockHours() <= 21 then
                if inVehicle then
                    ReturnBoatAlamoSea()
                else
                    BoatMenuAlamoSea()
                end
            else
                QBCore.Functions.Notify('Too Late to Fish!, Opened from 6:00am / 21:00pm', 'error')
            end
        end
	end
end)

RegisterNetEvent('fishing:client:anchor')
AddEventHandler('fishing:client:anchor', function()
    local currVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    if currVeh ~= 0 then
        local vehModel = GetEntityModel(currVeh)
        if vehModel ~= nil and vehModel ~= 0 then
            if DoesEntityExist(currVeh) then
                if IsThisModelABoat(vehModel) or IsThisModelAJetski(vehModel) or IsThisModelAnAmphibiousCar(vehModel) or IsThisModelAnAmphibiousQuadbike(vehModel) then
                    if IsBoatAnchoredAndFrozen(currVeh) then
                        exports['progressBars']:drawBar(2000,"Retrieving Anchor")
                        Citizen.Wait(2000)
						QBCore.Functions.Notify('Anchor Disabled', 'primary')
                        SetBoatAnchor(currVeh, false)
                        SetBoatFrozenWhenAnchored(currVeh, false)
                        SetForcedBoatLocationWhenAnchored(currVeh, false)
                    elseif not IsBoatAnchoredAndFrozen(currVeh) and CanAnchorBoatHere(currVeh) and GetEntitySpeed(currVeh) < 3 then
                        SetEntityAsMissionEntity(currVeh,false,true)
                        exports['progressBars']:drawBar(2000,"Dropping Anchor")
                        Citizen.Wait(2000)
						QBCore.Functions.Notify('Anchor Enabled', 'success')
                        SetBoatAnchor(currVeh, true)
                        SetBoatFrozenWhenAnchored(currVeh, true)
                        SetForcedBoatLocationWhenAnchored(currVeh, true)
                    end
                end
            end
        end
    end
end)

--============================================================== Functions

RequestTheModel = function(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(0)
	end
end

catchAnimation = function()
	local ped = PlayerPedId()
	local animDict = "mini@tennis"
	local animName = "forehand_ts_md_far"
	DeleteEntity(rodHandle)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(100)
	end
	TaskPlayAnim(ped, animDict, animName, 1.0, -1.0, 1.0, 0, 0, 0, 48, 0)

	local time = 1750
	exports['progressBars']:drawBar(time, 'Fish Caught!')
	Citizen.Wait(time)
	TriggerServerEvent('fishing:server:catch', bait) 
	if math.random(1, 100) < 50 then
		TriggerServerEvent('hud:server:RelieveStress', 50)
	end
	PlaySoundFrontend(-1, "OK", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
	RemoveAnimDict(animDict)
	fishAnimation()
end

fishAnimation = function()
	local ped = PlayerPedId()
	local animDict = "amb@world_human_stand_fishing@idle_a"
	local animName = "idle_c"
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(100)
	end
	TaskPlayAnim(ped, animDict, animName, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
	fishingRodEntity()
	fishing = true
	Citizen.Wait(3700)
	exports['textUi']:DrawTextUi('hide')
	-- RemoveAnimDict(animDict)
end

fishingRodEntity = function()
	local ped = PlayerPedId()
    local pedPos = GetEntityCoords(ped)
	local fishingRodHash = `prop_fishing_rod_01`
	local bone = GetPedBoneIndex(ped, 18905)
    rodHandle = CreateObject(fishingRodHash, pedPos, true)
    AttachEntityToEntity(rodHandle, ped, bone, 0.1, 0.05, 0, 80.0, 120.0, 160.0, true, true, false, true, 1, true)
end

endFishing = function() 
	local ped = PlayerPedId()
    if rodHandle ~= 0 then
		DeleteObject(rodHandle)
		ClearPedTasks(ped)
		fishing = false
		rodHandle = 0
		QBCore.Functions.Notify('You Stopped Fishing', 'error')
		exports['textUi']:DrawTextUi('hide')
    end
end
