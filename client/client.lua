
local QBCore = exports['qb-core']:GetCoreObject()
local fishing = false
local pause = false
local pausetimer = 0
local correct = 0
local genderNum = 0
local peds = {} 

--============================================================== For testing

if Config.TestFish then 
	RegisterCommand("startfish", function(source)
		TriggerEvent("fishing:fishstart")
	end)

	RegisterCommand('spawnfish', function()
	 	TriggerServerEvent('fishing:server:catch') 
	end)
end

--============================================================== Threads
CreateThread(function()
	while true do
		Wait(1200)
		if pause and fishing then
			pausetimer = pausetimer + 1
		end
	end
end)

CreateThread(function()
	while true do
		Wait(1)
		if fishing then
				if IsControlJustReleased(0, 23) then
					input = 1
			   	end

			if IsControlJustReleased(0, Config.StopFishing) then
				endFishing()
				QBCore.Functions.Notify('You Stopped Fishing', 'error')
			end

			if fishing then
				playerPed = PlayerPedId()
				local pos = GetEntityCoords(playerPed)
				if GetWaterHeight(pos.x, pos.y, pos.z-2, pos.z -3.0)  then
				else
					endFishing()
					QBCore.Functions.Notify('Water isnt deep enough to fish', 'error')
				end
				if IsEntityDead(playerPed) or IsEntityInWater(playerPed) then
					endFishing()
					QBCore.Functions.Notify('Fishing ended', 'error')
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
					exports["qb-core"]:HideText()
					loseBait()
				end
			end
		end
	end
end)

CreateThread(function()
	while true do

		local wait = math.random(Config.FishingWaitTime.minTime , Config.FishingWaitTime.maxTime)
		Wait(wait)
		if fishing then
			pause = true
			correct = 1
			TriggerEvent('3dme:triggerDisplay', 'Fishing Rod Starts to Tug!')
			exports["qb-core"]:DrawText("Press [F] to Catch Fish!")
			input = 0
			pausetimer = 0
		end
	end
end)

CreateThread(function()
	while true do
		Wait(500)
		for k = 1, #Config.PedList, 1 do
			v = Config.PedList[k]
			local playerCoords = GetEntityCoords(PlayerPedId())
			local dist = #(playerCoords - v.coords)

			if dist < 50.0 and not peds[k] then
				local ped = nearPed(v.model, v.coords, v.heading, v.gender, v.animDict, v.animName, v.scenario)
				peds[k] = {ped = ped}
			end

			if dist >= 50.0 and peds[k] then
				for i = 255, 0, -51 do
					Wait(50)
					SetEntityAlpha(peds[k].ped, i, false)
				end
				DeletePed(peds[k].ped)
				peds[k] = nil
			end
		end
	end
end)

--============================================================== Events


RegisterNetEvent('fishing:client:attemptTreasureChest', function()
	local ped = PlayerPedId()
	attemptTreasureChest()
	local HasItem = QBCore.Functions.HasItem("fishingkey")
	if HasItem then 
		QBCore.Functions.Progressbar("accepted_key", "Inserting Key..", (math.random(2000, 5000)), false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {
			animDict = "mini@repair",
			anim = "fixing_a_player",
			flags = 16,
		}, {}, {}, function() -- Done
			ClearPedTasks(ped)
			openedTreasureChest()
		end, function() -- Cancel
			ClearPedTasks(ped)
			QBCore.Functions.Notify("Canceled!", "error")
		end)
	else
	  QBCore.Functions.Notify("You dont have a key to this lock!", "error")
	end
end)


RegisterNetEvent('fishing:SkillBar', function(message)
	exports["qb-core"]:HideText()
	if Config.Skillbar == "reload-skillbar" then
		local finished = exports["reload-skillbar"]:taskBar(math.random(5000,7500),math.random(2,4))
		if finished ~= 100 then
			QBCore.Functions.Notify('The Fish Got Away!', 'error')
			loseBait()
		else
			local finished2 = exports["reload-skillbar"]:taskBar(math.random(2500,5000),math.random(3,5))
			if finished2 ~= 100 then
				QBCore.Functions.Notify('The Fish Escaped!', 'error')
				loseBait()
			else
				local finished3 = exports["reload-skillbar"]:taskBar(math.random(900,2000),math.random(5,7))
				if finished3 ~= 100 then
					QBCore.Functions.Notify('The Fish Got Away!', 'error')
					loseBait()
				else
					catchAnimation()
				end
			end
		end
	elseif Config.Skillbar == "np-skillbar" then 
		local finished = exports["np-skillbar"]:taskBar(1000,math.random(3,5))
		if finished ~= 100 then
			QBCore.Functions.Notify('The Fish Got Away!', 'error')
			loseBait()
		else
			catchAnimation()
		end
	elseif Config.Skillbar == "qb-skillbar" then
		local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
		Skillbar.Start({
			duration = math.random(2500,5000),
			pos = math.random(10, 30),
			width = math.random(10, 20),
		}, function()
			catchAnimation()
		end, function()
			QBCore.Functions.Notify('The Fish Escaped!', 'error')
			loseBait()
		end)
	end
end) 

RegisterNetEvent('fishing:client:spawnFish', function(args)
	local time = 10000
	local args = tonumber(args)
	if args == 1 then 
		RequestTheModel("A_C_KillerWhale")
		local pos = GetEntityCoords(PlayerPedId())
		local ped = CreatePed(29, `A_C_KillerWhale`, pos.x, pos.y, pos.z, 90.0, true, false)
		SetEntityHealth(ped, 0)
		DecorSetInt(ped, "propHack", 74)
		SetModelAsNoLongerNeeded(`A_C_KillerWhale`)
		Wait(time)
		DeletePed(ped)	
	elseif args == 2 then 
		RequestTheModel("A_C_dolphin")
		local pos = GetEntityCoords(PlayerPedId())
		local ped = CreatePed(29, `A_C_dolphin`, pos.x, pos.y, pos.z, 90.0, true, false)
		SetEntityHealth(ped, 0)
		DecorSetInt(ped, "propHack", 74)
		SetModelAsNoLongerNeeded(`A_C_dolphin`)
		Wait(time)
		DeletePed(ped)
	elseif args == 3 then
		RequestTheModel("A_C_sharkhammer")
		local pos = GetEntityCoords(PlayerPedId())
		local ped = CreatePed(29, `A_C_sharkhammer`, pos.x, pos.y, pos.z, 90.0, true, false)
		SetEntityHealth(ped, 0)
		DecorSetInt(ped, "propHack", 74)
		SetModelAsNoLongerNeeded(`A_C_sharkhammer`)
		Wait(time)
		DeletePed(ped)
	elseif args == 4 then
		RequestTheModel("A_C_SharkTiger")
		local pos = GetEntityCoords(PlayerPedId())
		local ped = CreatePed(29, `A_C_SharkTiger`, pos.x, pos.y, pos.z, 90.0, true, false)
		SetEntityHealth(ped, 0)
		DecorSetInt(ped, "propHack", 74)
		SetModelAsNoLongerNeeded(`A_C_SharkTiger`)
		Wait(time)
		DeletePed(ped)
	elseif args == 5 then
		RequestTheModel("A_C_stingray")
		local pos = GetEntityCoords(PlayerPedId())
		local ped = CreatePed(29, `A_C_stingray`, pos.x, pos.y, pos.z, 90.0, true, false)
		SetEntityHealth(ped, 0)
		DecorSetInt(ped, "propHack", 74)
		SetModelAsNoLongerNeeded(`A_C_stingray`)
		Wait(time)
		DeletePed(ped)
	else
		RequestTheModel("a_c_fish")
		local pos = GetEntityCoords(PlayerPedId())
		local ped = CreatePed(29, `a_c_fish`, pos.x, pos.y, pos.z, 90.0, true, false)
		SetEntityHealth(ped, 0)
		DecorSetInt(ped, "propHack", 74)
		SetModelAsNoLongerNeeded(`a_c_fish`)
		Wait(time)
		DeletePed(ped)
	end
end)

RegisterNetEvent('fishing:client:useFishingBox', function(BoxId)
	TriggerServerEvent("inventory:server:OpenInventory", "stash", 'FishingBox_'..BoxId, {maxweight = 18000000, slots = 250})
	TriggerEvent("inventory:client:SetCurrentStash", 'FishingBox_'..BoxId) 
end) 

RegisterNetEvent('fishing:fishstart', function()
	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(playerPed) 
	if IsPedSwimming(playerPed) then return QBCore.Functions.Notify("You can't be swimming and fishing at the same time.", "error") end 
	if IsPedInAnyVehicle(playerPed) then return QBCore.Functions.Notify("You need to exit your vehicle to start fishing.", "error") end 
	if GetWaterHeight(pos.x, pos.y, pos.z-2, pos.z - 3.0)  then
		local time = 1000
		QBCore.Functions.Notify('Using Fishing Rod', 'primary', time)
		Wait(time)
		exports["qb-core"]:DrawText("Press [X] to stop fishing at any time") 
		fishAnimation()
	else
		QBCore.Functions.Notify('You need to go further away from the shore', 'error')
	end
end, false)

RegisterNetEvent('doj:client:ReturnBoat', function(args)
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

RegisterNetEvent('doj:client:rentaBoat', function(args)
	local args = tonumber(args)
	local chance = math.random(1, 20)

	QBCore.Functions.TriggerCallback('fishing:server:checkMoney', function(isSuccess)
		if isSuccess then 
			if chance == 10 then
				TriggerServerEvent("fishing:server:addTackleBox")
			end
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
			elseif args == 4 then
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

RegisterNetEvent('doj:client:BoatMenu', function(data)
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

RegisterNetEvent('fishing:client:anchor', function()
    local currVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    if currVeh ~= 0 then
        local vehModel = GetEntityModel(currVeh)
        if vehModel ~= nil and vehModel ~= 0 then
            if DoesEntityExist(currVeh) then
                if IsThisModelABoat(vehModel) or IsThisModelAJetski(vehModel) or IsThisModelAnAmphibiousCar(vehModel) or IsThisModelAnAmphibiousQuadbike(vehModel) then
                    if IsBoatAnchoredAndFrozen(currVeh) then
						QBCore.Functions.Notify('Retrieving Anchor', 'success')
                        Wait(2000)
						QBCore.Functions.Notify('Anchor Disabled', 'primary')
                        SetBoatAnchor(currVeh, false)
                        SetBoatFrozenWhenAnchored(currVeh, false)
                        SetForcedBoatLocationWhenAnchored(currVeh, false)
                    elseif not IsBoatAnchoredAndFrozen(currVeh) and CanAnchorBoatHere(currVeh) and GetEntitySpeed(currVeh) < 3 then
                        SetEntityAsMissionEntity(currVeh,false,true)
						QBCore.Functions.Notify('Dropping Anchor', 'primary')
                        Wait(2000)
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

loseBait = function()
	local chance = math.random(1, 15)
	if chance <= 5 then
		TriggerServerEvent("fishing:server:removeFishingBait")
		loseBaitAnimation()
	end
end

loseBaitAnimation = function()
	local ped = PlayerPedId()
	local animDict = "gestures@f@standing@casual"
	local animName = "gesture_damn"
	DeleteEntity(rodHandle)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Wait(100)
	end
	TaskPlayAnim(ped, animDict, animName, 1.0, -1.0, 1.0, 0, 0, 0, 48, 0)
	RemoveAnimDict(animDict)
	exports["qb-core"]:DrawText("Fish took your bait!")
	Wait(2000)
	exports["qb-core"]:HideText()
	fishAnimation()
end

RequestTheModel = function(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(0)
	end
end

catchAnimation = function()
	local ped = PlayerPedId()
	local animDict = "mini@tennis"
	local animName = "forehand_ts_md_far"
	DeleteEntity(rodHandle)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Wait(100)
	end
	TaskPlayAnim(ped, animDict, animName, 1.0, -1.0, 1.0, 0, 0, 0, 48, 0)
	local time = 1750
	QBCore.Functions.Notify('Fish Caught!', 'success', time)
	Wait(time)
	TriggerServerEvent('fishing:server:catch') 
	loseBait()
	if math.random(1, 100) < 50 then
		TriggerServerEvent('hud:server:RelieveStress', 50)
	end
	PlaySoundFrontend(-1, "OK", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
	RemoveAnimDict(animDict)
	endFishing()
end

fishAnimation = function()
	local HasItem = QBCore.Functions.HasItem('fishbait')
	if HasItem then
		local ped = PlayerPedId()
		local animDict = "amb@world_human_stand_fishing@idle_a"
		local animName = "idle_c"
		RequestAnimDict(animDict)
		while not HasAnimDictLoaded(animDict) do
			Wait(100)
		end
		TaskPlayAnim(ped, animDict, animName, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
		fishingRodEntity()
		fishing = true
		Wait(3700)
		exports["qb-core"]:HideText()
	else
	  endFishing()
	  QBCore.Functions.Notify("You dont have any fishing bait", "error")
	end
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
		exports["qb-core"]:HideText()
    end
end

attemptTreasureChest = function()
	local ped = PlayerPedId()
	local animDict = "veh@break_in@0h@p_m_one@"
	local animName = "low_force_entry_ds"
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Wait(100)
	end
	TaskPlayAnim(ped, animDict, animName, 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
	RemoveAnimDict(animDict)
	QBCore.Functions.Notify('Attempting to open Treasure Chest', 'primary', 1500)
	Wait(1500)
	ClearPedTasks(PlayerPedId())
end

openedTreasureChest = function()
	if math.random(1,15) == 10 then
		TriggerServerEvent("QBCore:Server:RemoveItem", "fishingkey", 1)
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["fishingkey"], "remove", 1)
		QBCore.Functions.Notify("The corroded key has snapped", "error", 7500)
	end
	TriggerServerEvent("QBCore:Server:RemoveItem", "fishinglootbig", 1)
	TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["fishinglootbig"], "remove", 1)
	QBCore.Functions.Notify("Treasure chest opened! Be sure to collect all of your loot!!", "success", 7500)
	local ShopItems = {} 
	ShopItems.label = "Treasure Chest"
	ShopItems.items = Config.largeLootboxRewards
	ShopItems.slots = #Config.largeLootboxRewards
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_", ShopItems)
end

nearPed = function(model, coords, heading, gender, animDict, animName, scenario)
	RequestModel(GetHashKey(model))
	while not HasModelLoaded(GetHashKey(model)) do
		Wait(1)
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
			Wait(1)
		end
		TaskPlayAnim(ped, animDict, animName, 8.0, 0, -1, 1, 0, 0, 0)
	end
	if scenario then
		TaskStartScenarioInPlace(ped, scenario, 0, true) 
	end
	for i = 0, 255, 51 do
		Wait(50)
		SetEntityAlpha(ped, i, false)
	end

	return ped
end
