local QBCore = exports['qb-core']:GetCoreObject()
--============================================================================ Items

QBCore.Functions.CreateUseableItem("anchor", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
		TriggerClientEvent('fishing:client:anchor', source)
    end
end)

QBCore.Functions.CreateUseableItem("fishingrod", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
 		TriggerClientEvent('fishing:fishstart', source)
    end
end)

QBCore.Functions.CreateUseableItem("fishicebox", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
		TriggerClientEvent('fishing:client:useFishingBox', source, item.info.boxid)  
    end
end)

QBCore.Functions.CreateUseableItem("fishinglootbig", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
		TriggerClientEvent("fishing:client:attemptTreasureChest", src)
    end
end)

QBCore.Functions.CreateUseableItem("fishingloot", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
		Player.Functions.RemoveItem("fishingloot", 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingloot'], "remove", 1)
		TriggerClientEvent('QBCore:Notify', src, "Opening Box", "primary")
		SetTimeout(1000, function()
			Player.Functions.AddItem('fishingkey', 1, nil, {["quality"] = 100}) 
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingkey'], "add", 1)

			Player.Functions.AddItem(Config.smallLootboxReward, 1, nil, {["quality"] = 100}) 
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.smallLootboxReward], "add", 1)

			Player.Functions.AddMoney('cash', Config.smallLootboxCash, "fishingloot")
			TriggerClientEvent('QBCore:Notify', src, "You found a couple items and $"..Config.smallLootboxCash, "success")
		end)
    end
end)

QBCore.Functions.CreateUseableItem("fishtacklebox", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then

		TriggerClientEvent('QBCore:Notify', src, "Opening Tackel Box", "success")
		Player.Functions.RemoveItem("fishtacklebox", 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishtacklebox'], "remove", 1)

		SetTimeout(1250, function()
			Player.Functions.AddItem('pearlscard', 1, nil, {["quality"] = 100}) 
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pearlscard'], "add", 1)
		end)
    end
end)

--============================================================================ Events

RegisterNetEvent('fishing:server:removeFishingBait', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('fishbait', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishbait'], "remove", 1)
end)

RegisterNetEvent("fishing:server:addTackleBox", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent('QBCore:Notify', src, "There seems to tackle box left over from another fisherman", "primary")
	SetTimeout(1000, function()
		Player.Functions.AddItem('fishtacklebox', 1, nil, {["quality"] = 100}) 
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishtacklebox'], "add", 1)
	end)
end) 

RegisterNetEvent("fishing:server:returnDeposit", function()
	local src = source
    local pData = QBCore.Functions.GetPlayer(src)
	local price = math.floor(Config.BoatPrice/2)
	pData.Functions.AddMoney('bank', price , "boat-rental")
	TriggerClientEvent('QBCore:Notify', src, "Boat has been returned for $"..price, "success")
end) 

RegisterNetEvent('fishing:server:catch', function() 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local luck = math.random(1, 100)
    local itemFound = true
    local itemCount = 1

    if itemFound then
        for i = 1, itemCount, 1 do
            if luck == 100 then
				local weight = math.random(850,1000)
				local info = {species = "Orca",lbs = weight,type = "Exotic"}
				TriggerClientEvent('fishing:client:spawnFish', src, 1)
				Player.Functions.AddItem('killerwhale', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['killerwhale'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a killer whale!\nThese are endangered species and are illegal to possess", "primary")
			elseif luck >= 95 and luck <= 100 then
				Player.Functions.AddItem('fishinglootbig', 1, nil, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishinglootbig'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You found a Treasure Chest!", "success")
			elseif luck >= 90 and luck <= 95 then
				local weight = math.random(10,28)
				local info = {species = "Bottlenose",lbs = weight, type = "Exotic"}
				TriggerClientEvent('fishing:client:spawnFish', src, 2)
				Player.Functions.AddItem('dolphin', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dolphin'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a dolphin!\nThese are endangered species and are illegal to possess", "primary")
			elseif luck >= 85 and luck <= 90 then
				local weight = math.random(20,30)
				local info = {species = "Hammerhead Shark", lbs = weight, type = "Exotic"}
				TriggerClientEvent('fishing:client:spawnFish', src, 3)
				Player.Functions.AddItem('sharkhammer', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['sharkhammer'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a hammerhead shark!\nThese are endangered species and are illegal to possess", "primary")
			elseif luck >= 80 and luck <= 85 then
				local weight = math.random(1,6)
				local info = {species = "Tiger Shark", lbs = weight, type = "Exotic"}
				TriggerClientEvent('fishing:client:spawnFish', src, 4)
				Player.Functions.AddItem('sharktiger', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['sharktiger'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a tiger shark!\nThese are endangered species and are illegal to possess", "primary")
			elseif luck >= 75 and luck <= 80 then
				local weight = math.random(4,9)
				local info = {species = "Manta ray", lbs = weight, type = "Normal"}
				TriggerClientEvent('fishing:client:spawnFish', src, 5)
				Player.Functions.AddItem('stingray', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['stingray'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a "..weight.."lbs Stingray!", "success")
			elseif luck >= 70 and luck <= 75 then
				local weight = math.random(10,15)
				local info = {species = "Flounder", lbs = weight, type = "Normal"}
				TriggerClientEvent('fishing:client:spawnFish', src, 6)
				Player.Functions.AddItem('flounder', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['flounder'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a " .. weight .. "lbs Flounder", "success")
			elseif luck >= 65 and luck <= 70 then
				Player.Functions.AddItem('fishingboot', 1, nil, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingboot'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a fishing boot!", "primary")
			elseif luck >= 60 and luck <= 65 then
				local weight = math.random(1,6)
				local info = {species = "Bass", lbs = weight, type = "Normal"}
				TriggerClientEvent('fishing:client:spawnFish', src, 6)
				Player.Functions.AddItem('bass', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bass'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a " .. weight .. "lbs Bass", "success")
			elseif luck >= 55 and luck <= 60 then
				Player.Functions.AddItem('fishingloot', 1, nil, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingloot'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You found a small box!", "success")
			elseif luck >= 50 and luck <= 55 then
				local weight = math.random(5,7)
				local info = {species = "Cod", lbs = weight, type = "Normal"}
				TriggerClientEvent('fishing:client:spawnFish', src, 6)
				Player.Functions.AddItem('codfish', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['codfish'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a " .. weight .. "lbs  Cod", "success")
			elseif luck >= 45 and luck <= 50 then
				Player.Functions.AddItem('fishingtin', 1, nil, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingtin'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a fishing tin!", "primary")
			elseif luck >= 0 and luck <= 45 then
				local weight = math.random(1,5)
				local info = {species = "Mackerel", lbs = weight, type = "Normal"}
				TriggerClientEvent('fishing:client:spawnFish', src, 6)
				Player.Functions.AddItem('mackerel', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['mackerel'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a " .. weight .. "lbs Mackerel", "success")
            end
            Citizen.Wait(500)
        end
    end
end)

RegisterNetEvent('fishing:server:SellillegalFish', function(args)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
	if args == 1 then 
		local dolphin = Player.Functions.GetItemByName("dolphin")
		if dolphin ~= nil then
			local payment = Config.dolphinPrice
			Player.Functions.RemoveItem("dolphin", 1, k)
			Player.Functions.AddMoney('bank', payment , "dolphin-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['dolphin'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "Dolphin Sold for $"..payment, "success")
			TriggerClientEvent("doj:client:SellillegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any Dolphin to sell", 'error')
		end
	elseif args == 2 then 
		local sharktiger = Player.Functions.GetItemByName("sharktiger")
		if sharktiger ~= nil then
			local payment = Config.sharktigerPrice
			Player.Functions.RemoveItem("sharktiger", 1, k)
			Player.Functions.AddMoney('bank', payment , "sharktiger-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sharktiger'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "Tiger Shark Sold for $"..payment, "success")
			TriggerClientEvent("doj:client:SellillegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any Tiger Shark to sell", 'error')
		end
	elseif args == 3 then 
		local sharkhammer = Player.Functions.GetItemByName("sharkhammer")
		if sharkhammer ~= nil then
			local payment = Config.sharkhammerPrice
			Player.Functions.RemoveItem("sharkhammer", 1, k)
			Player.Functions.AddMoney('bank', payment , "sharkhammer-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sharkhammer'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "Hammerhead Shark Sold for $"..payment, "success")
			TriggerClientEvent("doj:client:SellillegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any Hammerhead Shark to sell", 'error')
		end
	else
		local killerwhale = Player.Functions.GetItemByName("killerwhale")
		if killerwhale ~= nil then
			local payment = Config.killerwhalePrice
			Player.Functions.RemoveItem("killerwhale", 1, k)
			Player.Functions.AddMoney('bank', payment , "killerwhale-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['killerwhale'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "Killer Whale Sold for $"..payment, "success")
			TriggerClientEvent("doj:client:SellillegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any Killer Whale to sell", "error")
		end
	end
end)

RegisterNetEvent('fishing:server:SellLegalFish', function(args) 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
	if args == 1 then 
		local mackerel = Player.Functions.GetItemByName("mackerel")
		if mackerel ~= nil then
			local payment = Config.mackerelPrice
			Player.Functions.RemoveItem("mackerel", 1, k)
			Player.Functions.AddMoney('bank', payment , "mackerel-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mackerel'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 Mackerel Sold for $"..payment, "success")
			TriggerClientEvent("doj:client:SellLegalFish", source)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any Mackerels to sell", "error")
		end
	elseif args == 2 then
		local codfish = Player.Functions.GetItemByName("codfish")
		if codfish ~= nil then
			local payment = Config.codfishPrice
			Player.Functions.RemoveItem("codfish", 1, k)
			Player.Functions.AddMoney('bank', payment , "codfish-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['codfish'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 Cod Sold for $"..payment, "success")
			TriggerClientEvent("doj:client:SellLegalFish", source)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any Cods to sell", "error")
		end
	elseif args == 3 then
		local bass = Player.Functions.GetItemByName("bass") 
		if bass ~= nil then
			local payment = Config.bassPrice
			Player.Functions.RemoveItem("bass", 1, k)
			Player.Functions.AddMoney('bank', payment , "bass-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['bass'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 Bass Sold for $"..payment, "success")
			TriggerClientEvent("doj:client:SellLegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any Bass to sell", "error")
		end
	elseif args == 4 then
		local flounder = Player.Functions.GetItemByName("flounder")
		if flounder ~= nil then
			local payment = Config.flounderPrice
			Player.Functions.RemoveItem("flounder", 1, k)
			Player.Functions.AddMoney('bank', payment , "flounder-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flounder'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 Flounder Sold for $"..payment, "success")
			TriggerClientEvent("doj:client:SellLegalFish", source)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any Flounders to sell", "error")
		end
	else
		local stingray = Player.Functions.GetItemByName("stingray")
		if stingray ~= nil then
			local payment = Config.stingrayPrice
			Player.Functions.RemoveItem("stingray", 1, k)
			Player.Functions.AddMoney('bank', payment , "stingray-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['stingray'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 Stingray Sold for $"..payment, "success")
			TriggerClientEvent("doj:client:SellLegalFish", source)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any Stingray to sell", "error")
		end
	end
end)

RegisterNetEvent('fishing:server:BuyFishingGear', function(args)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
	local bankBalance = Player.PlayerData.money["bank"]

	if args == 1 then 
		if bankBalance >= Config.fishingBaitPrice then
			Player.Functions.RemoveMoney('bank', Config.fishingBaitPrice, "fishbait")
			Player.Functions.AddItem('fishbait', 1, nil, {["quality"] = 100})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishbait'], "add", 1)
			TriggerClientEvent("doj:client:buyFishingGear", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have enough money..", "error")
		end
	elseif args == 2 then 
		if bankBalance >= Config.fishingRodPrice then
			Player.Functions.RemoveMoney('bank', Config.fishingRodPrice, "fishingrod")
			Player.Functions.AddItem('fishingrod', 1, nil, {["quality"] = 100})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingrod'], "add", 1)
			TriggerClientEvent("doj:client:buyFishingGear", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have enough money..", "error")
		end
	elseif args == 3 then 
		if bankBalance >= Config.BoatAnchorPrice then
			Player.Functions.RemoveMoney('bank', Config.BoatAnchorPrice, "anchor")
			Player.Functions.AddItem('anchor', 1, nil, {["quality"] = 100})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['anchor'], "add", 1)
			TriggerClientEvent("doj:client:buyFishingGear", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have enough money..", "error")
		end
	else
		if bankBalance >= Config.BoatAnchorPrice then
			Player.Functions.RemoveMoney('bank', Config.BoatAnchorPrice, "fishicebox")
			local info = {
				boxid = math.random(111,999),
				boxOwner = Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname,
			}
			Player.Functions.AddItem('fishicebox', 1, nil, info, {["quality"] = 100})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishicebox'], "add", 1)
			TriggerClientEvent("doj:client:buyFishingGear", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have enough money..", "error")
		end
	end
end)


--============================================================================ Callbacks
QBCore.Functions.CreateCallback('fishing:server:checkMoney', function(source, cb)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    local bankBalance = pData.PlayerData.money["bank"]
	local price = Config.BoatPrice
    if bankBalance >= price then
        pData.Functions.RemoveMoney('bank', Config.BoatPrice, "boat-rental")
		TriggerClientEvent('QBCore:Notify', src, "Boat has been rented for $"..price, "success")
        cb(true)
    else
        TriggerClientEvent('QBCore:Notify', src, "You dont have enough money..", "error")
        cb(false)
    end
end)
