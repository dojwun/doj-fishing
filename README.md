# Fishing Script for QB 

### ***Frequently Updated! Check back for more!***

**[Source](https://github.com/Kuzkay/esx_AdvancedFishing)**

## Info
- **[Rent](https://streamable.com/bymhyv)** a fishing boat
- **[Return](https://streamable.com/ns3qeb)** boat for small refund
- **[Fish](https://streamable.com/ca7wo7)** spawn once caught **Updated Anim* 
- **[Sell](https://streamable.com/5c8nm0)** regular fish easily & exotics no so much 
- **[Purchase](https://i.imgur.com/LIj0Rs8.png)** fishing gear to start your trip 
- **[Store](https://i.imgur.com/eeQrnD0.png)** fish you have caught
-  **[Inventory Tooltip](https://i.imgur.com/vnpIb2b.png)** will display species, weight & type
- Catch & Sell 9 diffrent fish (5 normal & 4 exotic) + 2 Extra Trash items
- Sell exotic fish with a special card item ***(You must choose how a player will recieve this item!)***
- Few extras & More to come ***Stay Tuned***


## Dependencies:
**[textUi](https://github.com/dojwun/textUi)**

**[qb-menu](https://github.com/qbcore-framework/qb-menu)**


**[qb-target](https://github.com/BerkieBb/berkie-target)**

**[reload-skillbar](https://github.com/Utinax/reload-skillbar)**

**[progressBars](https://drive.google.com/drive/folders/1uuxtWibJIZYx2yDY_7y4mnl5AbqDpSqt?usp=sharing)**

# images
- **Regular Fish**

![bass](https://i.imgur.com/kye5oAh.png)
![sting](https://i.imgur.com/KtUf7C6.png)
![flounder](https://i.imgur.com/O0JYxfp.png)
![codfish](https://i.imgur.com/rfwERIW.png)
![mackerel](https://i.imgur.com/A1Qrktl.png)

- **Trash items**
 
![fishingboot](https://i.imgur.com/Vuk4yHA.png)
![fishingtin](https://i.imgur.com/8G5Mx4i.png)

- **Exotic Fish**

![tiger](https://i.imgur.com/L5Zi26u.png)
![hammer](https://i.imgur.com/SpDnz4O.png)
![dolphin](https://i.imgur.com/Pisfl7A.png)
![whale](https://i.imgur.com/iB9Ky68.png)

- **Gear & items**
 
![rod](https://i.imgur.com/dzM4b7U.png)
![bait](https://i.imgur.com/A4XBvDb.png)
![anchor](https://i.imgur.com/1OYiDYa.png)
![pearlscard](https://i.imgur.com/xFEmoLt.png)
![fishingicebox](https://i.imgur.com/YnJzonA.png)



## Required:
- qb-core/shared.lua info
```
	-- Regular Fish
	['stingray'] 			     	 = {['name'] = 'stingray', 				    ['label'] = 'Stingray',            		['weight'] = 2500,      ['type'] = 'item',      ['image'] = 'stingray.png',         	['unique'] = true,     ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Stingray'},
	['flounder'] 			     	 = {['name'] = 'flounder', 				    ['label'] = 'Flounder',            		['weight'] = 2500,      ['type'] = 'item',      ['image'] = 'flounder.png',         	['unique'] = true,     ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Flounder'},
	['codfish'] 			     	 = {['name'] = 'codfish', 				    ['label'] = 'Cod',            			['weight'] = 2500,      ['type'] = 'item',      ['image'] = 'codfish.png',         		['unique'] = true,     ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Cod'},
	['mackerel'] 			     	 = {['name'] = 'mackerel', 				    ['label'] = 'Mackerel',            		['weight'] = 2500,      ['type'] = 'item',      ['image'] = 'mackerel.png',         	['unique'] = true,     ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Mackerel'},
	['bass'] 			 		 	 = {['name'] = 'bass', 						['label'] = 'Bass',                     ['weight'] = 1250,      ['type'] = 'item',      ['image'] = 'bass.png',                 ['unique'] = true,     ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'A normal fish Tatses pretty good!'},
	
	-- Trash Items
	['fishingtin'] 			 	 	 = {['name'] = 'fishingtin', 				['label'] = 'Fishing Tin', 				['weight'] = 2500, 		['type'] = 'item', 		['image'] = 'fishingtin.png', 			['unique'] = false,    ['useable'] = false, 	['shouldClose'] = false,	 ['combinable'] = nil,   ['description'] = 'Fishing Tin'},	
	['fishingboot'] 			 	 = {['name'] = 'fishingboot', 				['label'] = 'Fishing Boot', 			['weight'] = 2500, 		['type'] = 'item', 		['image'] = 'fishingboot.png', 			['unique'] = false,    ['useable'] = false, 	['shouldClose'] = false,	 ['combinable'] = nil,   ['description'] = 'Fishing Boot'},	
	
	-- Exotic Fish
	['killerwhale'] 			 	 = {['name'] = 'killerwhale', 				['label'] = 'Whale', 					['weight'] = 15000, 	['type'] = 'item', 		['image'] = 'killerwhale.png', 			['unique'] = true, 	   ['useable'] = false, 	['shouldClose'] = false,	 ['combinable'] = nil,   ['description'] = 'Killer Whale'},	
	['dolphin'] 			     	 = {['name'] = 'dolphin', 					['label'] = 'Dolphin',          		['weight'] = 5000,      ['type'] = 'item',      ['image'] = 'dolphin.png',       		['unique'] = true,     ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Dolphin'},
	['sharkhammer'] 			     = {['name'] = 'sharkhammer', 				['label'] = 'Shark',         			['weight'] = 5000,      ['type'] = 'item',      ['image'] = 'sharkhammer.png',       	['unique'] = true,     ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Hammerhead Shark'},
	['sharktiger'] 			     	 = {['name'] = 'sharktiger', 				['label'] = 'Shark',          			['weight'] = 5000,      ['type'] = 'item',      ['image'] = 'sharktiger.png',       	['unique'] = true,     ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Tigershark'},
	
	-- Gear
	['fishbait'] 			     	 = {['name'] = 'fishbait', 					['label'] = 'Fish Bait', 				['weight'] = 400, 		['type'] = 'item', 		['image'] = 'fishbait.png', 			['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Fishing bait'},
	['fishingrod'] 			 		 = {['name'] = 'fishingrod', 				['label'] = 'Fishing Rod', 				['weight'] = 750, 		['type'] = 'item', 		['image'] = 'fishingrod.png', 			['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A fishing rod for adventures with friends!!'},	
	['pearlscard'] 			 	 	 = {['name'] = 'pearlscard', 				['label'] = 'Pearls Exotic Card', 		['weight'] = 100, 		['type'] = 'item', 		['image'] = 'pearlscard.png', 			['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A special card to sell exotic goods at Pearl\'s Seafood Restaurant'},	
	['anchor'] 			 	 		 = {['name'] = 'anchor', 					['label'] = 'Boat Anchor', 				['weight'] = 2500, 		['type'] = 'item', 		['image'] = 'anchor.png', 				['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Boat Anchor'},	
	['fishicebox'] 			 	 	 = {['name'] = 'fishicebox', 				['label'] = 'Fishing Ice Chest', 		['weight'] = 2500, 		['type'] = 'item', 		['image'] = 'fishicebox.png', 			['unique'] = true,     ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Ice Box to store all of your fish'},	

 ``` 


