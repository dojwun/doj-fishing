
--============================================================================ Items
-- QBCore.Functions.CreateUseableItem("harpoon", function(source, item)
-- 	local src = source
--     local Player = QBCore.Functions.GetPlayer(source)
-- 	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
-- 		TriggerClientEvent('fishing:fishstart', src)
-- 		TriggerClientEvent('fishing:setbait', src, "killerwhale")
--     end
-- end)

QBCore.Functions.CreateUseableItem("fish", function(source)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName("fishingrod") then
		TriggerClientEvent('fishing:setbait', src, "stingray")
		TriggerClientEvent("fishing:client:progressBar",src)
		SetTimeout(1000, function()
			Player.Functions.RemoveItem('fish', 1)
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fish"], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "You attach the fish onto your fishing rod")
        end)
	else
		TriggerClientEvent('QBCore:Notify', src, "You dont have a fishing rod!", "error")
	end
end)

QBCore.Functions.CreateUseableItem("fishbait", function(source)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName("fishingrod") then
		TriggerClientEvent('fishing:setbait', src, "fish")
		TriggerClientEvent("fishing:client:progressBar",src)
		SetTimeout(1000, function()
			Player.Functions.RemoveItem('fishbait', 1)
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fishbait"], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "You attach the fish bait onto your fishing rod")
        end)
	else
		TriggerClientEvent('QBCore:Notify', src, "You dont have a fishing rod!", "error")
	end
end)


QBCore.Functions.CreateUseableItem("stingray", function(source)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName("fishingrod") then
		TriggerClientEvent('fishing:setbait', src, "dolphin")
		TriggerClientEvent("fishing:client:progressBar",src)
		SetTimeout(1000, function()
			Player.Functions.RemoveItem('stingray', 1)
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["stingray"], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "You attach the stingray meat onto the fishing rod")
        end)
	else
		TriggerClientEvent('QBCore:Notify', src, "You dont have a fishing rod!", "error")
	end
end)


QBCore.Functions.CreateUseableItem("dolphin", function(source)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName("fishingrod") then
		TriggerClientEvent('fishing:setbait', src, "sharktiger")
		TriggerClientEvent("fishing:client:progressBar",src)
		SetTimeout(1000, function()
			Player.Functions.RemoveItem('dolphin', 1)
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["dolphin"], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "You attach the dolphin meat onto the fishing rod")
        end)
	else
		TriggerClientEvent('QBCore:Notify', src, "You dont have a fishing rod!", "error")
	end
end)

QBCore.Functions.CreateUseableItem("sharktiger", function(source)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName("fishingrod") then
		TriggerClientEvent('fishing:setbait', src, "sharkhammer")
		TriggerClientEvent("fishing:client:progressBar",src)
		SetTimeout(1000, function()
			Player.Functions.RemoveItem('sharktiger', 1)
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["sharktiger"], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "You attach the tiger shark meat onto the fishing rod")
        end)
	else
		TriggerClientEvent('QBCore:Notify', src, "You dont have a fishing rod!", "error")
	end
end)


QBCore.Functions.CreateUseableItem("sharkhammer", function(source)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName("fishingrod") then
		TriggerClientEvent('fishing:setbait', src, "killerwhale")
		TriggerClientEvent("fishing:client:progressBar",src)
		SetTimeout(1000, function()
			Player.Functions.RemoveItem('sharkhammer', 1)
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["sharkhammer"], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "You attach the hammerhead shark meat onto the fishing rod")
        end)
	else
		TriggerClientEvent('QBCore:Notify', src, "You dont have a fishing rod!", "error")
	end
end)


QBCore.Functions.CreateUseableItem("fishingrod", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
 		TriggerClientEvent('fishing:fishstart', source)
    end
end)


--============================================================================ Events
RegisterNetEvent('fishing:server:catch')
AddEventHandler('fishing:server:catch', function(bait)
	local src = source
	local weight = 2
	local rnd = math.random(1,100)
	local Player = QBCore.Functions.GetPlayer(src)

	if bait == "stingray" then
		if rnd >= 78 then
			if rnd >= 94 then
				if TriggerClientEvent('fishing:break', src) then
					Player.Functions.RemoveItem('fishingrod', 1)
					TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["fishingrod"], "remove", 1)
					TriggerClientEvent('fishing:setbait', src, "none")
					TriggerClientEvent('QBCore:Notify', src, "You struggled with the stingray & broke your fishing rod!", "error")
				end
			else
				local weight = math.random(4,9)
				local info = {species = "Manta ray", lbs = weight, type = "Normal"}
				if TriggerClientEvent('stingray:spawnFish', src) then
					TriggerClientEvent('fishing:setbait', src, "none")
					Player.Functions.AddItem('stingray', 1, nil, info, {["quality"] = 100})
					TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['stingray'], "add", 1)
					TriggerClientEvent('QBCore:Notify', src, "You caught a "..weight.."lbs stingray!", "success")
				end
			end
		else
			if rnd >= 75 then
				local weight = math.random(1,6)
				local info = {species = "Trout", lbs = weight, type = "Normal"}
				if TriggerClientEvent('fish:spawnFish', src) then
					TriggerClientEvent('fishing:setbait', src, "none")
					Player.Functions.AddItem('fish', 1, nil, info, {["quality"] = 100})
					TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fish'], "add", 1)
					TriggerClientEvent('QBCore:Notify', src, "You caught a fish: " .. weight .. " lbs", "success")
				end
			else
				local weight = math.random(1,6)
				local info = {species = "Trout", lbs = weight, type = "Normal"}
				if TriggerClientEvent('fish:spawnFish', src) then
					Player.Functions.AddItem('fish', 1, nil, info, {["quality"] = 100})
					TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fish'], "add", 1)
					TriggerClientEvent('QBCore:Notify', src, "You caught a fish: " .. weight .. " lbs", "success")
				end
			end
		end
	else
		if bait == "fish" then
			if rnd >= 75 then
				local weight = math.random(4,11)
				local info = {species = "Trout", lbs = weight, type = "Normal"}
				if TriggerClientEvent('fish:spawnFish', src) then
					TriggerClientEvent('fishing:setbait', src, "none")
					Player.Functions.AddItem('fish', 1, nil, info, {["quality"] = 100})
					TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fish'], "add", 1)
					TriggerClientEvent('QBCore:Notify', src, "You caught a fish: " .. weight .. " lbs", "success")
				end
			else
				local weight = math.random(1,6)
				local info = {species = "Trout", lbs = weight, type = "Normal"}
				if TriggerClientEvent('fish:spawnFish', src) then
					TriggerClientEvent('fishing:setbait', src, "none")
					Player.Functions.AddItem('fish', 1, nil, info, {["quality"] = 100})
					TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fish'], "add", 1)
					TriggerClientEvent('QBCore:Notify', src, "You caught a fish: " .. weight .. " lbs", "success")
				end
			end
		end
		if bait == "none" then
			TriggerClientEvent('QBCore:Notify', src, "You are currently fishing without any equipped bait", "error")
			if rnd >= 70 then
				local weight = math.random(1,3)
				local info = {species = "Trout", lbs = weight, type = "Normal"}
				if TriggerClientEvent('fish:spawnFish', src) then
					Player.Functions.AddItem('fish', 1, nil, info, {["quality"] = 100})
					TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fish'], "add", 1)
					TriggerClientEvent('QBCore:Notify', src, "You caught a fish: " .. weight .. " lbs", "success")
				end
			else
				local weight = math.random(1,2)
				local info = {species = "Trout", lbs = weight, type = "Normal"}
				if TriggerClientEvent('fish:spawnFish', src) then
					Player.Functions.AddItem('fish', 1, nil, info, {["quality"] = 100})
					TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fish"], "add", 1)
					TriggerClientEvent('QBCore:Notify', src, "You caught a fish: " .. weight .. " lbs", "success")
				end
			end
		end
		if bait == "sharktiger" then
			if rnd >= 82 then
				if rnd >= 91 then
					if TriggerClientEvent('fishing:break', src) then
						Player.Functions.RemoveItem('fishingrod', 1)
						TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["fishingrod"], "remove", 1)
						TriggerClientEvent('fishing:setbait', src, "none")
						TriggerClientEvent('QBCore:Notify', src, "You struggled with the fish & broke your fishing rod!", "error")
					end
				else
					local weight = math.random(1,6)
					local info = {species = "Tiger Shark", lbs = weight, type = "Exotic"}
					if TriggerClientEvent('sharktiger:spawnFish', src) then
						TriggerClientEvent('fishing:setbait', src, "none")
						Player.Functions.AddItem('sharktiger', 1, nil, info, {["quality"] = 100})
						TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['sharktiger'], "add", 1)
						TriggerClientEvent('QBCore:Notify', src, "You caught a tiger shark!\nThese are endangered species and are illegal to possess", "primary")
					end
				end
			else
				local weight = math.random(1,6)
				local info = {species = "Trout", lbs = weight, type = "Normal"}
				if TriggerClientEvent('fish:spawnFish', src) then
					TriggerClientEvent('fishing:setbait', src, "none")
					Player.Functions.AddItem('fish', 1, nil, info, {["quality"] = 100})
					TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fish'], "add", 1)
					TriggerClientEvent('QBCore:Notify', src, "You caught a fish: " .. weight .. " lbs", "success")
				end
			end
		end
		if bait == "sharkhammer" then
			if rnd >= 82 then
				if rnd >= 91 then
					if TriggerClientEvent('fishing:break', src) then
						Player.Functions.RemoveItem('fishingrod', 1)
						TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["fishingrod"], "remove", 1)
						TriggerClientEvent('fishing:setbait', src, "none")
						TriggerClientEvent('QBCore:Notify', src, "You struggled with the fish & broke your fishing rod!", "error")
					end
				else
					local weight = math.random(20,30)
					local info = {species = "Hammerhead Shark", lbs = weight, type = "Exotic"}
					if TriggerClientEvent('sharkhammer:spawnFish', src) then
						TriggerClientEvent('fishing:setbait', src, "none")
						Player.Functions.AddItem('sharkhammer', 1, nil, info, {["quality"] = 100})
						TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['sharkhammer'], "add", 1)
						TriggerClientEvent('QBCore:Notify', src, "You caught a hammerhead shark!\nThese are endangered species and are illegal to possess", "primary")
					end
				end
			else
				local weight = math.random(1,6)
				local info = {species = "Trout", lbs = weight, type = "Normal"}
				if TriggerClientEvent('fish:spawnFish', src) then
					TriggerClientEvent('fishing:setbait', src, "none")
					Player.Functions.AddItem('fish', 1, nil, info, {["quality"] = 100})
					TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fish'], "add", 1)
					TriggerClientEvent('QBCore:Notify', src, "You caught a fish: " .. weight .. " lbs", "success")
				end
			end
        end
		if bait == "dolphin" then
			if rnd >= 82 then
				if rnd >= 91 then
					if TriggerClientEvent('fishing:break', src) then
						Player.Functions.RemoveItem('fishingrod', 1)
						TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["fishingrod"], "remove", 1)
						TriggerClientEvent('fishing:setbait', src, "none")
						TriggerClientEvent('QBCore:Notify', src, "You struggled with the fish & broke your fishing rod!", "error")
					end
				else
					local weight = math.random(10,28)
					local info = {species = "Bottlenose",lbs = weight, type = "Exotic"}
					if TriggerClientEvent('dolphin:spawnFish', src) then
						TriggerClientEvent('fishing:setbait', src, "none")
						Player.Functions.AddItem('dolphin', 1, nil, info, {["quality"] = 100})
						TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dolphin'], "add", 1)
						TriggerClientEvent('QBCore:Notify', src, "You caught a dolphin!\nThese are endangered species and are illegal to possess", "primary")
					end
				end
			else
				local weight = math.random(1,6)
				local info = {species = "Trout", lbs = weight, type = "Normal"}
				if TriggerClientEvent('fish:spawnFish', src) then
					TriggerClientEvent('fishing:setbait', src, "none")
					Player.Functions.AddItem('fish', 1, nil, info, {["quality"] = 100})
					TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fish'], "add", 1)
					TriggerClientEvent('QBCore:Notify', src, "You caught a fish: " .. weight .. " lbs", "success")
				end
			end
        end
		if bait == "killerwhale" then
			if rnd >= 82 then
				if rnd >= 91 then
					if TriggerClientEvent('fishing:break', src) then
						Player.Functions.RemoveItem('fishingrod', 1)
						TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["fishingrod"], "remove", 1)
						TriggerClientEvent('fishing:setbait', src, "none")
						TriggerClientEvent('QBCore:Notify', src, "You struggled with the fish & broke your fishing rod!", "error")
					end
				else
					local weight = math.random(850,1000)
					local info = {species = "Orca",lbs = weight,type = "Exotic"}
					if TriggerClientEvent('killerwhale:spawnFish', src) then
						TriggerClientEvent('fishing:setbait', src, "none")
						Player.Functions.AddItem('killerwhale', 1, nil, info, {["quality"] = 100})
						TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['killerwhale'], "add", 1)
						TriggerClientEvent('QBCore:Notify', src, "You caught a killer whale!\nThese are endangered species and are illegal to possess", "primary")
					end
				end
			else
				local weight = math.random(1,6)
				local info = {species = "Trout", lbs = weight, type = "Normal"}
				if TriggerClientEvent('fish:spawnFish', src) then
					TriggerClientEvent('fishing:setbait', src, "none")
					Player.Functions.AddItem('fish', 1, nil, info, {["quality"] = 100})
					TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fish'], "add", 1)
					TriggerClientEvent('QBCore:Notify', src, "You caught a fish: " .. weight .. " lbs", "success")
				end
			end
		end
	end
end)

RegisterServerEvent("fishing:server:returnDeposit")
AddEventHandler("fishing:server:returnDeposit", function()
	local src = source
    local pData = QBCore.Functions.GetPlayer(src)
	local price = math.floor(Config.BoatPrice/2)
	pData.Functions.AddMoney('bank', price , "boat-rental")
	TriggerClientEvent('QBCore:Notify', src, "Boat has been returned for $"..price, "success")
end) 

RegisterServerEvent('fishing:server:SellillegalFish')
AddEventHandler('fishing:server:SellillegalFish', function(args)
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

RegisterServerEvent('fishing:server:SellLegalFish')
AddEventHandler('fishing:server:SellLegalFish', function(args)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
	if args == 1 then 
		local fish = Player.Functions.GetItemByName("fish") 
		if fish ~= nil then
			local payment = Config.fishPrice
			Player.Functions.RemoveItem("fish", 1, k)
			Player.Functions.AddMoney('bank', payment , "fish-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['fish'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 Fish Sold for $"..payment, "success")
			TriggerClientEvent("doj:client:SellLegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any Fish to sell", "error")
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

RegisterServerEvent('fishing:server:BuyFishingGear')
AddEventHandler('fishing:server:BuyFishingGear', function(args)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
	local bankBalance = Player.PlayerData.money["bank"]

	if args == 1 then 
		if bankBalance >= Config.fishingRodPrice then
			Player.Functions.RemoveMoney('bank', Config.fishingRodPrice, "fishingrod")
			Player.Functions.AddItem('fishingrod', 1, nil, {["quality"] = 100})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingrod'], "add", 1)
			TriggerClientEvent("doj:client:buyFishingGear", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have enough money..", "error")
		end
	else
		if bankBalance >= Config.fishingBaitPrice then
			Player.Functions.RemoveMoney('bank', Config.fishingBaitPrice, "fishbait")
			Player.Functions.AddItem('fishbait', 1, nil, {["quality"] = 100})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishbait'], "add", 1)
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



























--=========================================================================== Sell All [fish]
-- RegisterServerEvent('fishing:server:SellLegalFish')
-- AddEventHandler('fishing:server:SellLegalFish', function(args)
-- 	local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
-- 	local args = tonumber(args)
-- 	if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
--         for k, v in pairs(Player.PlayerData.items) do 
--          	if Player.PlayerData.items[k] ~= nil then 
-- 				if args == 1 then 
-- 					local fish = Player.Functions.GetItemByName("fish")
-- 					if fish ~= nil then
-- 						local payment = Config.fishPrice * Player.PlayerData.items[k].amount
-- 						Player.Functions.RemoveItem("fish", Player.PlayerData.items[k].amount, k)
-- 						Player.Functions.AddMoney('bank', payment , "Fish-sell")
-- 						TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['fish'], "remove", Player.PlayerData.items[k].amount)
-- 						TriggerClientEvent('QBCore:Notify', src, ""..Player.PlayerData.items[k].amount.." Fish Sold for $"..payment, "success")
-- 					else
-- 						TriggerClientEvent('QBCore:Notify', src, "You dont have any Fish to sell", 'error')
-- 					end
-- 				else
-- 					local stingray = Player.Functions.GetItemByName("stingray")
-- 					if stingray ~= nil then
-- 						local payment = Config.StingrayPrice * Player.PlayerData.items[k].amount
-- 						Player.Functions.RemoveItem("stingray", Player.PlayerData.items[k].amount, k)
-- 						Player.Functions.AddMoney('bank', payment , "stingray-sell")
-- 						TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['stingray'], "remove", Player.PlayerData.items[k].amount)
-- 						TriggerClientEvent('QBCore:Notify', src, ""..Player.PlayerData.items[k].amount.." Stingray Sold for $"..payment, "success")
-- 					else
-- 						TriggerClientEvent('QBCore:Notify', src, "You dont have any Stingray to sell", "error")
-- 					end
-- 				end
-- 	        end
--         end
-- 	end
-- end)

-- RegisterServerEvent('fishing:server:SellillegalFish')
-- AddEventHandler('fishing:server:SellillegalFish', function(args)
-- 	local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
-- 	local args = tonumber(args)
-- 	if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
--         for k, v in pairs(Player.PlayerData.items) do 
--          	if Player.PlayerData.items[k] ~= nil then 
-- 				if args == 1 then 
-- 					local dolphin = Player.Functions.GetItemByName("dolphin")
-- 					if dolphin ~= nil then
-- 						local payment = Config.dolphinPrice * Player.PlayerData.items[k].amount
-- 						Player.Functions.RemoveItem("dolphin", Player.PlayerData.items[k].amount, k)
-- 						Player.Functions.AddMoney('bank', payment , "dolphin-sell")
-- 						TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['dolphin'], "remove", Player.PlayerData.items[k].amount)
-- 						TriggerClientEvent('QBCore:Notify', src, ""..Player.PlayerData.items[k].amount.." dolphin Sold for $"..payment, "success")
-- 					else
-- 						TriggerClientEvent('QBCore:Notify', src, "You dont have any Dolphin to sell", 'error')
-- 					end
-- 				elseif args == 2 then 
-- 					local sharktiger = Player.Functions.GetItemByName("sharktiger")
-- 					if sharktiger ~= nil then
-- 						local payment = Config.sharktigerPrice * Player.PlayerData.items[k].amount
-- 						Player.Functions.RemoveItem("sharktiger", Player.PlayerData.items[k].amount, k)
-- 						Player.Functions.AddMoney('bank', payment , "sharktiger-sell")
-- 						TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sharktiger'], "remove", Player.PlayerData.items[k].amount)
-- 						TriggerClientEvent('QBCore:Notify', src, ""..Player.PlayerData.items[k].amount.." sharktiger Sold for $"..payment, "success")
-- 					else
-- 						TriggerClientEvent('QBCore:Notify', src, "You dont have any Tiger Shark to sell", 'error')
-- 					end
-- 				elseif args == 3 then 
-- 					local sharkhammer = Player.Functions.GetItemByName("sharkhammer")
-- 					if sharkhammer ~= nil then
-- 						local payment = Config.sharkhammerPrice * Player.PlayerData.items[k].amount
-- 						Player.Functions.RemoveItem("sharkhammer", Player.PlayerData.items[k].amount, k)
-- 						Player.Functions.AddMoney('bank', payment , "sharkhammer-sell")
-- 						TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sharkhammer'], "remove", Player.PlayerData.items[k].amount)
-- 						TriggerClientEvent('QBCore:Notify', src, ""..Player.PlayerData.items[k].amount.." sharkhammer Sold for $"..payment, "success")
-- 					else
-- 						TriggerClientEvent('QBCore:Notify', src, "You dont have any Hammerhead Shark to sell", 'error')
-- 					end
-- 				else
-- 					local killerwhale = Player.Functions.GetItemByName("killerwhale")
-- 					if killerwhale ~= nil then
-- 						local payment = Config.killerwhalePrice * Player.PlayerData.items[k].amount
-- 						Player.Functions.RemoveItem("killerwhale", Player.PlayerData.items[k].amount, k)
-- 						Player.Functions.AddMoney('bank', payment , "killerwhale-sell")
-- 						TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['killerwhale'], "remove", Player.PlayerData.items[k].amount)
-- 						TriggerClientEvent('QBCore:Notify', src, ""..Player.PlayerData.items[k].amount.." killerwhale Sold for $"..payment, "success")
-- 					else
-- 						TriggerClientEvent('QBCore:Notify', src, "You dont have any Killer Whale to sell", "error")
-- 					end
-- 				end
-- 	        end
--         end
-- 	end
-- end)
