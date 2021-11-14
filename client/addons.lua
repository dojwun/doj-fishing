
local QBCore = exports['qb-core']:GetCoreObject()

function BoatMenuLaPuerta()
    exports['qb-menu']:openMenu({
        {
            header = "La Puerta Boat Rental",
            isMenuHeader = true
        },
        {
            header = "Boat: "..Config.RentalBoat,
            txt = "Price: $"..Config.BoatPrice,
            params = {
                event = "doj:client:rentaBoat",
				args = 1
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

function BoatMenuPaletoCove()
    exports['qb-menu']:openMenu({
        {
            header = "Paleto Cove Boat Rental",
            isMenuHeader = true
        },
        {
            header = "Boat: "..Config.RentalBoat,
            txt = "Price: $"..Config.BoatPrice,
            params = {
                event = "doj:client:rentaBoat",
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
end 

function BoatMenuElGordo()
    exports['qb-menu']:openMenu({
        {
            header = "El Gordo Boat Rental",
            isMenuHeader = true
        },
        {
            header = "Boat: "..Config.RentalBoat,
            txt = "Price: $"..Config.BoatPrice,
            params = {
                event = "doj:client:rentaBoat",
				args = 3
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


function BoatMenuActDam()
    exports['qb-menu']:openMenu({
        {
            header = "Act Dam Boat Rental",
            isMenuHeader = true
        },
        {
            header = "Boat: "..Config.RentalBoat,
            txt = "Price: $"..Config.BoatPrice,
            params = {
                event = "doj:client:rentaBoat",
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
end 

function BoatMenuAlamoSea()
    exports['qb-menu']:openMenu({
        {
            header = "Alamo Sea Boat Rental",
            isMenuHeader = true
        },
        {
            header = "Boat: "..Config.RentalBoat,
            txt = "Price: $"..Config.BoatPrice,
            params = {
                event = "doj:client:rentaBoat",
				args = 5
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
--============================================================== ReturnMenus

function ReturnBoatLaPuerta()
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
				args = 1
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

function ReturnBoatPaletoCove()
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
end 

function ReturnBoatElGordo()
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
				args = 3
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

function ReturnBoatActDam()
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
end 

function ReturnBoatAlamoSea()
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
				args = 5
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

--============================================================== Sell/Gear Menus

RegisterNetEvent('doj:client:SellLegalFish')
AddEventHandler('doj:client:SellLegalFish', function()
    exports['qb-menu']:openMenu({
		{
            header = "Pearl's Seafood Restaurant",
            isMenuHeader = true
        },
        {
            header = "Sell Mackerel",
            txt = "Current Price: $"..Config.mackerelPrice.." each",
            params = {
				isServer = true,
                event = "fishing:server:SellLegalFish",
				args = 1
            }
        },
        {
            header = "Sell Codfish",
            txt = "Current Price: $"..Config.codfishPrice.." each",
            params = {
				isServer = true,
                event = "fishing:server:SellLegalFish",
				args = 2
            }
        },
		{
            header = "Sell Bass",
            txt = "Current Price: $"..Config.bassPrice.." each",
            params = {
				isServer = true,
                event = "fishing:server:SellLegalFish",
				args = 3 
            }
        },
        {
            header = "Sell Flounder",
            txt = "Current Price: $"..Config.flounderPrice.." each",
            params = {
				isServer = true,
                event = "fishing:server:SellLegalFish",
				args = 4
            }
        },
		{
            header = "Sell Stingray",
            txt = "Current Price: $"..Config.stingrayPrice.." each",
            params = {
				isServer = true,
                event = "fishing:server:SellLegalFish",
				args = 5
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
            header = "Buy Fishing Bait",
            txt = "$"..Config.fishingBaitPrice,
            params = {
				isServer = true,
                event = "fishing:server:BuyFishingGear",
				args = 1
            }
        },
		{
            header = "Buy Fishing Rod",
            txt = "$"..Config.fishingRodPrice,
            params = {
				isServer = true,
                event = "fishing:server:BuyFishingGear",
				args = 2
            }
        },
        {
            header = "Buy Boat Anchor",
            txt = "$"..Config.BoatAnchorPrice,
            params = {
				isServer = true,
                event = "fishing:server:BuyFishingGear",
				args = 3
            }
        },
        {
            header = "Buy Fishing Box",
            txt = "$"..Config.FishingBoxPrice,
            params = {
				isServer = true,
                event = "fishing:server:BuyFishingGear",
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
					header = "Sell Orca",
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
	end, "pearlscard")
end)
