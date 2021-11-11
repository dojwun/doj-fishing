Config = {}

Config.Fish24hours = true                                       -- [true = fish anytime] [false = fishing only available moring to night (6am to 11pm in-game time)]
Config.FishingWaitTime = {minTime = 21000, maxTime = 45000}     -- How long a player will be waiting to fish, during or after casting fishingrod
Config.RentalBoat = "dinghy"                                    -- Fishing boat of Choice
Config.StopFishing =  73                                        -- Stop Fishing Key [X] (https://docs.fivem.net/docs/game-references/controls/)
Config.BoatPrice = 100                                          -- Price of the boat rental, price is divided when boat is returned
Config.TestFish = false											-- Test Fish with commands /startfish or /spawnfish
Config.Skillbar = "np-skillbar"                             	-- Must choose one of the avalible skillbars ["reload-skillbar","np-skillbar","qb-skillbar"]
Config.targetExport = "qb-target"                               -- The name of the Target export you are using ["qb-target", "qtarget", "bt-target"]

Config.PearlsSellsBlip = vector3(-1816.406, -1193.334, 13.305)  -- Blip to sell fish you have caught

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

-- Gear
Config.fishingRodPrice = 50                                     -- Price of a fishing rod
Config.fishingBaitPrice = 5                                     -- Price of fishing bait
Config.BoatAnchorPrice = 500                                    -- Price of a Boat Anchor
Config.FishingBoxPrice = 1000                                   -- Price of a Fishing Ice Box

-- Regular Fish
Config.mackerelPrice     = 5                                    -- Price of Mackerel
Config.codfishPrice      = 15                                   -- Price of Cod
Config.bassPrice         = 35                                   -- Price of Normal Fish
Config.flounderPrice     = 40                                   -- Price of Flounder
Config.stingrayPrice     = 50                                   -- Price of Stingrays

-- Exotic Fish
Config.dolphinPrice      = 100                                  -- Price of Dolphins
Config.sharktigerPrice   = 200                                  -- Price of Tigersharks
Config.sharkhammerPrice  = 200                                  -- Price of Hammerhead Sharks
Config.killerwhalePrice  = 500                                  -- Price of Killer whales

-- Rewards
Config.smallLootboxCash = 100                                  	-- Price of the cash reward for the "Metal Box"
Config.smallLootboxReward = 'diamond_ring'                      -- Item reward besides the "Corroded Key"

Config.largeLootboxRewards = {                                  -- Rewards found in the treasure chest (keep price = 0)
    [1] = { name = "water", price = 0, amount = 1, info = {}, type = "item", slot = 1, },
	[2] = { name = "water", price = 0, amount = 1, info = {}, type = "item", slot = 2, },
    [3] = { name = "water", price = 0, amount = 1, info = {}, type = "item", slot = 3, },
    [4] = { name = "water", price = 0, amount = 1, info = {}, type = "item", slot = 4, },
    [5] = { name = "water", price = 0, amount = 1, info = {}, type = "item", slot = 5, },

}

-- [SOURCE: https://github.com/sjpfeiffer/ped_spawner]
Config.PedList = {                                              -- Peds that will be spawned in (if you change a ped model here you need to also change the ped model in client/addons.lua qb-target exports)
	{
		model = "s_m_y_ammucity_01",                            -- Boat/Gear Menu
		coords = vector3(-806.17, -1496.57, 0.6),               
		heading = 100.0,
		gender = "male",
        scenario = "WORLD_HUMAN_STAND_FISHING"
	},
	{
		model = "u_m_m_filmdirector",                            -- Boat/Gear Menu
		coords = vector3(-1604.236, 5256.483, 1.073),               
		heading = 291.202,
		gender = "male",
        scenario = "WORLD_HUMAN_STAND_FISHING"
	},
	{
		model = "s_m_o_busker_01",                            -- Boat/Gear Menu
		coords = vector3(3373.215, 5183.515, 0.46),               
		heading = 266.111,
		gender = "male",
        scenario = "WORLD_HUMAN_STAND_FISHING"
	},
	{
		model = "ig_cletus",                            -- Boat/Gear Menu
		coords = vector3(1694.811, 39.927, 160.767),               
		heading = 191.786,
		gender = "male",
        scenario = "WORLD_HUMAN_STAND_FISHING"
	},
	{
		model = "a_m_m_hillbilly_01",                            -- Boat/Gear Menu
		coords = vector3(1299.665, 4231.885, 32.909),               
		heading = 81.693,
		gender = "male",
        scenario = "WORLD_HUMAN_STAND_FISHING"
	},
    {
		model = "s_m_y_busboy_01",
		coords = vector3(-1816.406, -1193.334, 13.305),         -- Regular/Exotic Fish Sells
		heading = 325.172,
		gender = "male",
        scenario = "WORLD_HUMAN_CLIPBOARD"
	},
}
