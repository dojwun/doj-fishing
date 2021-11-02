# Fishing Script for QB

**[Source](https://github.com/Kuzkay/esx_AdvancedFishing)**

## Info
- **[Rent](https://streamable.com/bymhyv)** a fishing boat
- **[Return](https://streamable.com/ns3qeb)** boat for small refund
- **[Fish](https://streamable.com/ml41rw)** spawn once caught
- **[Sell](https://streamable.com/5c8nm0)** regular fish easily & exotics no so much 
- **[Purchase](https://i.imgur.com/bwscYuB.png)** fishing gear to start your trip 
- Catch & Sell 6 diffrent fish (2 normal & 4 exotic)
- Sell exotic fish with a special card item ***(You must choose how a player will recieve this item!)***
- Fish display species, weight & type in **[tooltip](https://i.imgur.com/vnpIb2b.png)**
- Few extras 
- More to come


## Dependencies:
**[textUi](https://github.com/dojwun/textUi)**

**[qb-menu](https://github.com/qbcore-framework/qb-menu)**

**[reload-skillbar](https://github.com/Utinax/reload-skillbar)**

**[progressBars](https://drive.google.com/drive/folders/1uuxtWibJIZYx2yDY_7y4mnl5AbqDpSqt?usp=sharing)**

# images
![rod](https://i.imgur.com/2Btjjcy.png)
![bait](https://i.imgur.com/A4XBvDb.png)
![fish](https://i.imgur.com/kye5oAh.png)
![sting](https://i.imgur.com/KtUf7C6.png)
![tiger](https://i.imgur.com/L5Zi26u.png)
![hammer](https://i.imgur.com/SpDnz4O.png)
![dolphin](https://i.imgur.com/Pisfl7A.png)
![whale](https://i.imgur.com/iB9Ky68.png)
![anchor](https://i.imgur.com/1OYiDYa.png)
![pearlscard](https://i.imgur.com/xFEmoLt.png)



## Required:
- qb-core/shared.lua info
```
	['fish'] 			 		 	 = {['name'] = 'fish', 						['label'] = 'Fish',                     ['weight'] = 1250,      ['type'] = 'item',      ['image'] = 'fish.png',                 ['unique'] = true,     ['useable'] = true,     ['shouldClose'] = true,     ['combinable'] = nil,   ['description'] = 'A normal fish Tatses pretty good!'},
	['stingray'] 			     	 = {['name'] = 'stingray', 				    ['label'] = 'Stingray',            		['weight'] = 2500,      ['type'] = 'item',      ['image'] = 'stingray.png',         	['unique'] = true,     ['useable'] = true,     ['shouldClose'] = true,     ['combinable'] = nil,   ['description'] = 'Stingray'},
	['dolphin'] 			     	 = {['name'] = 'dolphin', 					['label'] = 'Dolphin',          		['weight'] = 5000,      ['type'] = 'item',      ['image'] = 'dolphin.png',       		['unique'] = true,     ['useable'] = true,     ['shouldClose'] = true,     ['combinable'] = nil,   ['description'] = 'Dolphin'},
	['sharkhammer'] 			     = {['name'] = 'sharkhammer', 				['label'] = 'Shark',         			['weight'] = 5000,      ['type'] = 'item',      ['image'] = 'sharkhammer.png',       	['unique'] = true,     ['useable'] = true,     ['shouldClose'] = true,     ['combinable'] = nil,   ['description'] = 'Hammerhead Shark'},
	['sharktiger'] 			     	 = {['name'] = 'sharktiger', 				['label'] = 'Shark',          			['weight'] = 5000,      ['type'] = 'item',      ['image'] = 'sharktiger.png',       	['unique'] = true,     ['useable'] = true,     ['shouldClose'] = true,     ['combinable'] = nil,   ['description'] = 'Tigershark'},
	['killerwhale'] 			 	 = {['name'] = 'killerwhale', 				['label'] = 'Whale', 					['weight'] = 15000, 	['type'] = 'item', 		['image'] = 'killerwhale.png', 			['unique'] = true, 	   ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Killer Whale'},	
	['fishbait'] 			     	 = {['name'] = 'fishbait', 					['label'] = 'Fish Bait', 				['weight'] = 400, 		['type'] = 'item', 		['image'] = 'fishbait.png', 			['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Fishing bait'},
	['fishingrod'] 			 		 = {['name'] = 'fishingrod', 				['label'] = 'Fishing Rod', 				['weight'] = 750, 		['type'] = 'item', 		['image'] = 'fishingrod.png', 			['unique'] = false, 	   ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A fishing rod for adventures with friends!!'},	
	['pearlscard'] 			 	 	 = {['name'] = 'pearlscard', 				['label'] = 'Pearls Exotic Card', 		['weight'] = 100, 		['type'] = 'item', 		['image'] = 'pearlscard.png', 			['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A special card to sell exotic goods at Pearl\'s Seafood Restaurant'},	
	['anchor'] 			 	 		 = {['name'] = 'anchor', 					['label'] = 'Boat Anchor', 				['weight'] = 2500, 		['type'] = 'item', 		['image'] = 'anchor.png', 				['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Boat Anchor'},	

 ``` 


