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
            header = "Buy Boat Anchor",
            txt = "$"..Config.BoatAnchorPrice,
            params = {
				isServer = true,
                event = "fishing:server:BuyFishingGear",
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

--============================================================== Exports

exports['qb-target']:SpawnPed({
    [1] = {
        model = 's_m_y_ammucity_01',
        coords = vector4(-806.17, -1496.57, 0.6, 100.0),
        freeze = true,
        invincible = true,
        blockevents = true,
        scenario = 'WORLD_HUMAN_STAND_FISHING',
        target = {
            options = {
                {
                    event = "doj:client:BoatMenu",
                    icon = "fas fa-anchor",
                    label = "Boat Rental",
                    location = 1
                },
                {
                    event = "doj:client:buyFishingGear",
                    icon = "fas fa-fish",
                    label = "Fishing Gear",
                },
            },
            distance = 10.0,
        },
        currentpednumber = 0,
    },
    [2] = {
        model = 'u_m_m_filmdirector',
        coords = vector4(-1604.236, 5256.483, 1.073, 291.202),
        freeze = true,
        invincible = true,
        blockevents = true,
        scenario = 'WORLD_HUMAN_STAND_FISHING',
        target = {
            options = {
                {
                    event = "doj:client:BoatMenu",
                    icon = "fas fa-anchor",
                    label = "Boat Rental",
                    location = 2
                },
                {
                    event = "doj:client:buyFishingGear",
                    icon = "fas fa-fish",
                    label = "Fishing Gear",
                },
            },
            distance = 10.0,
        },
        currentpednumber = 0,
    },
    [3] = {
        model = 's_m_o_busker_01',
        coords = vector4(3373.215, 5183.515, 0.46, 266.111),
        freeze = true,
        invincible = true,
        blockevents = true,
        scenario = 'WORLD_HUMAN_STAND_FISHING',
        target = {
            options = {
                {
                    event = "doj:client:BoatMenu",
                    icon = "fas fa-anchor",
                    label = "Boat Rental",
                    location = 3
                },
                {
                    event = "doj:client:buyFishingGear",
                    icon = "fas fa-fish",
                    label = "Fishing Gear",
                },
            },
            distance = 10.0,
        },
        currentpednumber = 0,
    },
    [4] = {
        model = 'ig_cletus',
        coords = vector4(1694.811, 39.927, 160.767, 191.786),
        freeze = true,
        invincible = true,
        blockevents = true,
        scenario = 'WORLD_HUMAN_STAND_FISHING',
        target = {
            options = {
                {
                    event = "doj:client:BoatMenu",
                    icon = "fas fa-anchor",
                    label = "Boat Rental",
                    location = 4
                },
                {
                    event = "doj:client:buyFishingGear",
                    icon = "fas fa-fish",
                    label = "Fishing Gear",
                },
            },
            distance = 10.0,
        },
        currentpednumber = 0,
    },
    [5] = {
        model = 'a_m_m_hillbilly_01',
        coords = vector4(1299.665, 4231.885, 32.909, 81.693),
        freeze = true,
        invincible = true,
        blockevents = true,
        scenario = 'WORLD_HUMAN_STAND_FISHING',
        target = {
            options = {
                {
                    event = "doj:client:BoatMenu",
                    icon = "fas fa-anchor",
                    label = "Boat Rental",
                    location = 5
                },
                {
                    event = "doj:client:buyFishingGear",
                    icon = "fas fa-fish",
                    label = "Fishing Gear",
                },
            },
            distance = 10.0,
        },
        currentpednumber = 0,
    },
    [6] = {
        model = 's_m_y_busboy_01',
        coords = vector4(-1816.406, -1193.334, 13.305, 325.172),
        freeze = true,
        invincible = true,
        blockevents = true,
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        target = {
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
            distance = 10.0,
        },
        currentpednumber = 0,
    },
}) 
