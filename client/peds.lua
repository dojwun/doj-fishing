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