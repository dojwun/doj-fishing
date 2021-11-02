Config = {}

Config.Fish24hours = true                                       -- [true = fish anytime] [false = fishing only available moring to night (6am to 11pm in-game time)]
Config.FishingWaitTime = {minTime = 21000, maxTime = 45000}     -- How long a player will be waiting to fish, during or after casting fishingrod
Config.RentalBoat = "dinghy"                                    -- Fishing boat of Choice
Config.StopFishing =  73                                        -- Stop Fishing Key [X]
Config.BoatPrice = 100                                          -- Price of the boat rental, price is divided when boat is returned
Config.PedDistance = 60.0                                       -- Distance of ped spawning
Config.PearlsExoticCard = "pearlscard"                          -- Name of item to sell exotic/illegal fish
Config.TestFish = false						-- Test Fish with commands /startfish & /spawnfish

Config.fishingRodPrice = 50                                     -- Price of a fishing rod
Config.fishingBaitPrice = 5                                     -- Price of fishing bait
Config.fishPrice         = 35                                   -- Price of Normal Fish
Config.stingrayPrice     = 50                                   -- Price of Stingrays
Config.dolphinPrice      = 100                                  -- Price of Dolphins
Config.sharktigerPrice   = 200                                  -- Price of Tigersharks
Config.sharkhammerPrice  = 200                                  -- Price of Hammerhead Sharks
Config.killerwhalePrice  = 500                                  -- Price of Killer whales
Config.PearlsSellsBlip = vector3(-1816.406, -1193.334, 13.305)  -- Blip for Fish Sells
Config.ReturnLocation = {
    coords = vector4(-802.883, -1495.654, 1.595, 294.265),      -- Position a player will spawn at once they return the boat
}
Config.SpawnLocation = {
    coords = vector4(-802.05, -1504.36, -0.47, 112.27),         -- Spawn location of fishing boat once its rented
}
Config.PedList = {                                              -- Peds that will be spawned in
	{
		model = "s_m_y_ammucity_01",                            -- Boat/Gear Menu
		coords = vector3(-806.17, -1496.57, 0.6),               
		heading = 100.0,
		gender = "male",
        scenario = "WORLD_HUMAN_STAND_FISHING"
		-- animDict = "",
		-- animName = "",
	},
    {
		model = "s_m_y_busboy_01",
		coords = vector3(-1816.406, -1193.334, 13.305),         -- Regular/Exotic Fish Sells
		heading = 325.172,
		gender = "male",
        scenario = "WORLD_HUMAN_CLIPBOARD"
	},
}
