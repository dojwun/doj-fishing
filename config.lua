Config = {}

Config.Fish24hours = true                                       -- [true = fish anytime] [false = fishing only available moring to night (6am to 11pm in-game time)]
Config.FishingWaitTime = {minTime = 21000, maxTime = 45000}     -- How long a player will be waiting to fish, during or after casting fishingrod
Config.RentalBoat = "dinghy"                                    -- Fishing boat of Choice
Config.StopFishing =  73                                        -- Stop Fishing Key [X]
Config.BoatPrice = 100                                          -- Price of the boat rental, price is divided when boat is returned
Config.PedDistance = 60.0                                       -- Distance of ped spawning
Config.PearlsExoticCard = "pearlscard"                          -- Name of item to sell exotic/illegal fish
Config.TestFish = false						-- Test Fish with commands /startfish or /spawnfish

Config.fishingRodPrice = 50                                     -- Price of a fishing rod
Config.fishingBaitPrice = 5                                     -- Price of fishing bait
Config.BoatAnchorPrice = 500                                    -- Price of a Boat Anchor
Config.fishPrice         = 35                                   -- Price of Normal Fish
Config.stingrayPrice     = 50                                   -- Price of Stingrays
Config.dolphinPrice      = 100                                  -- Price of Dolphins
Config.sharktigerPrice   = 200                                  -- Price of Tigersharks
Config.sharkhammerPrice  = 200                                  -- Price of Hammerhead Sharks
Config.killerwhalePrice  = 500                                  -- Price of Killer whales
Config.PearlsSellsBlip = vector3(-1816.406, -1193.334, 13.305)  -- Blip for Fish Sells

Config.BoatSpawnLocation = {
    LaPuerta	= vector4(-802.05, -1504.36, -0.47, 112.27),        
	PaletoCove 	= vector4(-1599.932, 5259.831, 1.578, 20.6317),        
	ElGordo 	= vector4(3372.705, 5188.673, 0.121, 272.03),        
	ActDam 		= vector4(1701.506, 43.897, 161.767, 188.579),
	AlamoSea 	= vector4(1294.363, 4232.013, 31.709, 160.441),        
}
Config.PlayerReturnLocation = {
    LaPuerta 	= vector4(-802.883, -1495.654, 1.595, 294.265),      
	PaletoCove 	= vector4(-1605.342, 5258.052, 2.083, 292.725),       
	ElGordo 	= vector4(3371.141, 5183.996, 1.46, 99.634),     
	ActDam 		= vector4(1695.805, 43.456, 161.767, 103.579),
	AlamoSea 	= vector4(1301.1, 4233.696, 33.909, 337.548),        
}
