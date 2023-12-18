// ~Homebrew~ Goodboy Galaxy
// #ID = 27584
// timenoe

// Common

function bitFlip(addr) => bit(addr[0], addr[1]) > prev(bit(addr[0], addr[1]))

function nextBit(addr)
{
	if (addr[0] == 7) return [0, addr[1] + 1]
	else return [addr[0] + 1, addr[1]]
}

function getBits(addr, count)
{
	bits = []
	for bit in range(1, count)
	{
		array_push(bits, bit(addr[0], addr[1]))
		addr = nextBit(addr)
	}
	return bits
}

function maxof(values)
{
	if (length(values) == 1) return values[0]
	else if (length(values) == 2) return max_of(values[0], values[1])
}

// Constants

versionOffset = 
{
	1.2: 0,
	//1.3: ?
}

noSpecificMap = 0x00
oldFactory2 = 0x02
echelonResidential = 0x0c
arcades = 0x0d
echelonMall = 0x0e
echelonCentral = 0x0f
heavensGate = 0x11
saltsoupBasin = 0x13
observatoryBasement = 0x1f
observatory = 0x20
musicTower = 0x23
witchesHut = 0x2e
xenolith = 0x30
starbiMansion = 0x32

woofer = 0
tweeter = 1
special2 = 2
special1 = 3

normal = 0
easy = 1
special = 2

hyperBeamLocked = 0
hyperBeamUnlocked = 1

maps = ["The Outpost", "Croxco Scrapheap", "Zandunia", "Rumbly Jungle", "Wytchberg", "Totummy Temples", "Grand Zootel", "Resonarion", "Lunar Penitentiary", "Echelon L. Central", "Echelon L. Residential", "Echelon Mega Mall", "Echelon L. Industrial", "Echelon Upper", "Xenolith", "Bolly Dimension", "Orange Dimension"]

mapTitles = 
{
	"The Outpost": "Crash Site",
	"Croxco Scrapheap": "Tough Dogs Only",
	"Zandunia": "Sunset Paradise",
	"Rumbly Jungle": "Watch for Falling Rocks",
	"Wytchberg": "Beware of Bats",
	"Totummy Temples": "Trial and Error",
	"Grand Zootel": "Interactive Beastiary",
	"Resonarion": "High Score Haven",
	"Lunar Penitentiary": "Prison Break",
	"Echelon L. Central": "Commuter Crossing",
	"Echelon L. Residential": "Hustle and Bustle",
	"Echelon Mega Mall": "Infinite Escalators",
	"Echelon L. Industrial": "Concrete Jungle",
	"Echelon Upper": "Heaven's Gate",
	"Xenolith": "Planet SR388",
	"Bolly Dimension": "Quantum-Space",
	"Orange Dimension": "Pastel Dreams"
}

mapIDs = 
{
	"The Outpost": [0x1f, 0x20, 0x21],
	"Croxco Scrapheap": [0x04, 0x05, 0x06],
	"Zandunia": [0x31, 0x32, 0x33],
	"Rumbly Jungle": [0x24, 0x25],
	"Wytchberg": [0x2d, 0x2e, 0x2f],
	"Totummy Temples": [0x26, 0x27, 0x28, 0x29, 0x2a, 0x2b],
	"Grand Zootel": [0x34, 0x35],
	"Resonarion": [0x22, 0x23],
	"Lunar Penitentiary": [0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d],
	"Echelon L. Central": [0x0f],
	"Echelon L. Residential": [0x0c, 0x0d],
	"Echelon Mega Mall": [0x0e],
	"Echelon L. Industrial": [0x0b],
	"Echelon Upper": [0x0a, 0x11],
	"Xenolith": [0x30],
	"Bolly Dimension": [0x01],
	"Orange Dimension": [0x1e]
}

mapAddrs = 
{
	"The Outpost": [0xe49c, 0xe49d, 0xe49e, 0xe4a1, 0xe4a2, 0xe4a5, 0xe4a6],
	"Croxco Scrapheap": [0xe430, 0xe431, 0xe432, 0xe434, 0xe435, 0xe438, 0xe439, 0xe43a, 0xe43b],
	"Zandunia": [0xe4e4, 0xe4e5, 0xe4e6, 0xe4e7, 0xe4e9, 0xe4ec, 0xe4ed],
	"Rumbly Jungle": [0xe4b0, 0xe4b1, 0xe4b2, 0xe4b3, 0xe4b4, 0xe4b5],
	"Wytchberg": [0xe4d4, 0xe4d5, 0xe4d6, 0xe4d7, 0xe4d8, 0xe4dc],
	"Totummy Temples": [0xe4b8, 0xe4bc, 0xe4c0, 0xe4c4, 0xe4c8, 0xe4c9, 0xe4ca, 0xe4cb, 0xe4cc],
	"Grand Zootel": [0xe4f0, 0xe4f1, 0xe4f4],
	"Resonarion": [0xe4a8, 0xe4a9, 0xe4aa, 0xe4ac],
	"Lunar Penitentiary": [0xe480, 0xe484, 0xe488, 0xe48c, 0xe490, 0xe494, 0xe495],
	"Echelon L. Central": [0xe45c, 0xe45d, 0xe45e, 0xe45f],
	"Echelon L. Residential": [0xe450, 0xe451, 0xe452, 0xe453, 0xe454, 0xe455],
	"Echelon Mega Mall": [0xe458, 0xe459, 0xe45a, 0xe45b],
	"Echelon L. Industrial": [0xe44c, 0xe44d, 0xe44e, 0xe44f],
	"Echelon Upper": [0xe448, 0xe464],
	"Xenolith": [0xe4e0, 0xe4e1, 0xe4e2],
	"Bolly Dimension": [0xe424, 0xe425],
	"Orange Dimension": [0xe498, 0xe499, 0xe49a, 0xe49b]
}

mapTotals = 
{
	"The Outpost": 37,
	"Croxco Scrapheap": 60,
	"Zandunia": 51,
	"Rumbly Jungle": 43,
	"Wytchberg": 37,
	"Totummy Temples": 51,
	"Grand Zootel": 15,
	"Resonarion": 30,
	"Lunar Penitentiary": 22,
	"Echelon L. Central": 31,
	"Echelon L. Residential": 47,
	"Echelon Mega Mall": 31,
	"Echelon L. Industrial": 30,
	"Echelon Upper": 10,
	"Xenolith": 17,
	"Bolly Dimension": 11,
	"Orange Dimension": 26
}

// Addresses

cropettFruitAddr = [6, 0xe339]
cassettedisksAddr = [4, 0xe33d]
raysweeperAddr = [4, 0xe343]
amongUsOrange = [0, 0xe33a]
cassettedisksRevealedAddr = [0, 0xe407]
hyperBeamAddr = [4, 0xe56c]
beastiesAddr = [0, 0xe578]
xenoratAddr = [2, 0xe57a]
chestsAddr = [0, 0xe584]
fishAddr = [0, 0xe590]
poopSweeperInstalledAddr = [4, 0xe5da]
checkpointsAddr = [0, 0xe5e0]

// Functions

function versionIdentifier(version)
{
	if (version == 1.2) return always_true()
	else if (version == 1.3) return always_true()
}

function file(offset) => byte(0xe27c + offset)
function planet(offset) => byte(0x50d8 + offset)
function map(offset) => byte(0x50d4 + offset)
function music(offset) => byte(0x8a10 + offset)
function xPos(offset) => dword(0x4f0c + offset)
function yPos(offset) => dword(0x4f10 + offset)
function animation(offset) => word(0x4f44 + offset)
function dialogueState(offset) => byte(0x99a0 + offset)
function dialogueSprite(offset) => byte(0x99a2 + offset)
function friends(offset) => byte(0xe300 + offset)
function items(offset) => byte(0xe3dc + offset)
function gizmoShards(offset) => bit0(0xf3f4 + offset) + bit0(0xf408 + offset)
function secondsPlayed(offset) => dword(0x50ec + offset) / 59.7275
function difficulty(offset) => byte(0xe291 + offset)
function poopSweeperPtr(offset) => tbyte(0x4a54 + offset)
function poopSweeperWins(offset) => word(0xe58c + offset)
function poopSweeperTime(offset) => word(poopSweeperPtr(offset) + 0x80a4)
function rhythmGameFinalScore(offset) => tbyte(0x110dd + offset)
function lilacForcePtr(offset) => tbyte(0x532c + offset)
function lilacForceScore(offset) => dword(lilacForcePtr(offset) + 0x8000)
function burgerdogFinalScore(offset) => tbyte(0x1063d + offset)
function creditsTextPtr(offset) => tbyte(0x5360 + offset)
function cropettsMissionCompletePtr(offset) => tbyte(0x11178 + offset)

function maxwellsMission(offset) => file(offset) != 3
function cropettsMission(offset) => file(offset) == 3
function inGame(offset) => planet(offset) != 0
function inMap(offset, map) => map(offset) == map
function inArea(offset, x1, x2, y1, y2) => xPos(offset) >= x1 && xPos(offset) <= x2 && yPos(offset) >= y1 && yPos(offset) <= y2
function commenceDialogue(offset) => __ornext(prev(dialogueState(offset)) == 0 || prev(dialogueState(offset)) == 6) && dialogueState(offset) == 7
function rhythmGame(offset, game) => byte(0x110d8 + offset) == game
function burgerdog(offset, special) => byte(0x10638 + offset) == special
function onDifficulty(offset, diff) => difficulty(offset) == diff

function trueBit(offset, addr) => bit(addr[0], addr[1] + offset) == 1
function checkBit(offset, addr, status) => bit(addr[0], addr[1] + offset) == status
function trueBits(offset, addr, count) => sum_of(getBits([addr[0], addr[1] + offset], count), s => s) == count
function checkBits(offset, addr, count, sum) => sum_of(getBits([addr[0], addr[1] + offset], count), s => s) == sum
function findBit(offset, addr, map)
{
	if (map <= 0) return inGame(offset) && bitFlip([addr[0], addr[1] + offset])
	else return inMap(offset, map) && bitFlip([addr[0], addr[1] + offset])
} 
function findBits(offset, addr, count, map, mission)
{
	if (map <= 0) return prev(sum_of(getBits([addr[0], addr[1] + offset], count), s => s)) == count - 1 && measured(sum_of(getBits([addr[0], addr[1] + offset], count), s => s) == count, when = mission(offset) && inGame(offset))
	else return inMap(offset, map) && prev(sum_of(getBits([addr[0], addr[1] + offset], count), s => s)) == count - 1 && measured(sum_of(getBits([addr[0], addr[1] + offset], count), s => s) == count, when = mission(offset) && inGame(offset))
}
function reachCount(offset, value, count) => prev(value(offset)) == count - 1 && measured(value(offset) == count, when = maxwellsMission(offset) && inGame(offset))

function mapArea(offset, map)
{
	mapCheck = always_false()
	for id in mapIDs[map] mapCheck = __ornext(mapCheck || map(offset) == id)

	mapSum = 0
	for mapAddr in mapAddrs[map] mapSum = mapSum + bitcount(mapAddr) 

	return mapCheck && prev(mapSum) == mapTotals[map] - 1 && measured(mapSum == mapTotals[map], when = maxwellsMission(offset) && inGame(offset), format = "percent")
}

function beastModeWitch(offset) => inMap(offset, witchesHut) && commenceDialogue(offset) && dialogueSprite(offset) == 0x64
function beautyModeWitch(offset) => inMap(offset, witchesHut) && commenceDialogue(offset) && dialogueSprite(offset) == 0x6a
function uncoverGizmo(offset) => inMap(offset, echelonMall) && prev(gizmoShards(offset)) == 1 && gizmoShards(offset) == 2
function fallFromHeaven(offset) => inMap(offset, heavensGate) && prev(animation(offset)) == 0x850 && animation(offset) == 0x3d0
function findPodly(offset) => inMap(offset, echelonCentral) && inArea(offset, 0x54354, 0x552d4, 0x1000, 0xa5cf)

function beatGame(offset, status) => checkBit(offset, hyperBeamAddr, status) && inMap(offset, observatory) && prev(creditsTextPtr(offset)) == 0 && creditsTextPtr(offset) != 0
function hundoGame(offset, status) => friends(offset) == 67 && items(offset) == 124 && trueBits(offset, chestsAddr, 30) && trueBits(offset, checkpointsAddr, 38) && trueBit(offset, xenoratAddr) && poopSweeperWins(offset) >= 5 && beatGame(offset, status)
function beatCropettsMission(offset) => inMap(offset, oldFactory2) && prev(cropettsMissionCompletePtr(offset)) == 0 && cropettsMissionCompletePtr(offset) != 0
function hundoCropettsMission(offset) => trueBits(offset, cropettFruitAddr, 8) && beatCropettsMission(offset)
function poopSweeperWin(offset) => maxwellsMission(offset) && inGame(offset) && poopSweeperPtr(offset) != 0 && poopSweeperWins(offset) > prev(poopSweeperWins(offset))
function rhythmGameEnd(offset, game) => inMap(offset, musicTower) && rhythmGame(offset, game) && byte(0x110f0 + offset) < prev(byte(0x110f0 + offset))
function lilacForceEnd(offset) => inMap(offset, arcades) && lilacForcePtr(offset) != 0 && prev(byte(lilacForcePtr(offset) + 0x8054)) == 5 && byte(lilacForcePtr(offset) + 0x8054) == 6
function burgerdogEnd(offset, type) => inMap(offset, echelonResidential) && burgerdog(offset, type) && byte(0x11093 + offset) < prev(byte(0x11093 + offset))

// Trigger Functions

function versionTrigger(func, args)
{
	trigger = always_false()
	if (length(args) == 0) for version in versionOffset trigger = trigger || versionIdentifier(version) && func(versionOffset[version])
	else if (length(args) == 1) for version in versionOffset trigger = trigger || versionIdentifier(version) && func(versionOffset[version], args[0])
	else if (length(args) == 2) for version in versionOffset trigger = trigger || versionIdentifier(version) && func(versionOffset[version], args[0], args[1])
	else if (length(args) == 3) for version in versionOffset trigger = trigger || versionIdentifier(version) && func(versionOffset[version], args[0], args[1], args[2])
	else if (length(args) == 4) for version in versionOffset trigger = trigger || versionIdentifier(version) && func(versionOffset[version], args[0], args[1], args[2], args[3])
	return trigger
}

// Value Functions

function versionValue(func)
{
	values = []
	for version in versionOffset array_push(values, measured(func(versionOffset[version]), when = versionIdentifier(version)))
	return maxof(values)
}

// Achievements

achievement("Spare Spare Part", "Acquire the Raysweeper in The Outpost", 5, versionTrigger(findBit, [raysweeperAddr, observatoryBasement]))

achievement("Fish Fear You", "Catch all 12 fish in Saltsoup Basin", 10, versionTrigger(findBits, [fishAddr, 12, saltsoupBasin, maxwellsMission]))
achievement("Full Occupancy!", "Fill Grand Zootel with all 18 beasties", 25, versionTrigger(findBits, [beastiesAddr, 18, noSpecificMap, maxwellsMission]))
achievement("Treasure Tracker", "Open all 30 chests", 25, versionTrigger(findBits, [chestsAddr, 30, noSpecificMap, maxwellsMission]))
achievement("Woofs and Tweets", "Repair the Musicator in Resonarion (Cassettedisks are now revealed on the map)", 5, versionTrigger(findBit, [raysweeperAddr, observatoryBasement]))
achievement("All the Hits", "Find all 31 Cassettedisks", 25, versionTrigger(findBits, [cassettedisksAddr, 31, noSpecificMap, maxwellsMission]))
achievement("Points? Check!", "Activate all 38 checkpoints", 25, versionTrigger(findBits, [checkpointsAddr, 38, noSpecificMap, maxwellsMission]))
achievement("Friend Zone", "Make all 67 friends", 50, versionTrigger(reachCount, [friends, 67]))
achievement("Cosmic Curator", "Acquire all 124 items", 50, versionTrigger(reachCount, [items, 124]))

achievement("Watch Your Step", "Install Poop Sweeper in pawsOS", 5, versionTrigger(findBit, [poopSweeperInstalledAddr, 0]))
achievement("Clean Sweep", "Win 5 games of Poop Sweeper", 10, versionTrigger(reachCount, [poopSweeperWins, 5]))
achievement("Nocturnal Nuisance", "Catch a special guest for the Grand Zootel penthouse", 10, versionTrigger(findBit, [xenoratAddr, xenolith]))

for map in maps
{
	areaCount = length(mapIDs[map])
	if (areaCount == 1) description = "Map 100% of " + map
	else if (areaCount == 2) description = "Map 100% of both areas in " + map
	else description = "Map 100% of all " + areaCount + " areas in " + map
	achievement(mapTitles[map], description, 10, versionTrigger(mapArea, [map]))
}

achievement("Imposter Among Us", "That pattern on the wall is suspect...", 5, versionTrigger(findBit, [amongUsOrange, starbiMansion]))
achievement("Truly Terrifying", "Speak to Witch while she is in Beast Mode", 5, versionTrigger(beastModeWitch, []))
achievement("Makeover Time", "Speak to Witch while she is in Beauty Mode", 5, versionTrigger(beautyModeWitch, []))
achievement("R.I.P. Gizmo", "Collect the two shards covering the portrait of Gizmo, Rik's old dog", 5, versionTrigger(uncoverGizmo, []))
achievement("Staff Use Only!", "Fall down from heaven", 5, versionTrigger(fallFromHeaven, []))
achievement("Podly Is Real", "Discover an homage to Podly, a character from exelotl's past", 5, versionTrigger(findPodly, []))

// Leaderboards

id = 84700
leaderboard("Any% Speedrun", "Beat the game in the fastest time", versionTrigger(beatGame, [hyperBeamLocked]), always_false(), always_true(), versionValue(secondsPlayed), format="SECS", lower_is_better=true, id = id)
leaderboard("100% Speedrun", "Beat the game with 100% completion in the fastest time", versionTrigger(hundoGame, [hyperBeamLocked]), always_false(), always_true(), versionValue(secondsPlayed), format="SECS", lower_is_better=true, id = id + 1)
leaderboard("Hyper Beam - Any% Speedrun", "Beat the game using the Hyper Beam in the fastest time", versionTrigger(beatGame, [hyperBeamUnlocked]), always_false(), always_true(), versionValue(secondsPlayed), format="SECS", lower_is_better=true, id = id + 2)
leaderboard("Hyper Beam - 100% Speedrun", "Beat the game with 100% completion using the Hyper Beam in the fastest time", versionTrigger(hundoGame, [hyperBeamUnlocked]), always_false(), always_true(), versionValue(secondsPlayed), format="SECS", lower_is_better=true, id = id + 3)
leaderboard("Cropett's Mission - Any% Speedrun", "Beat Cropett's Mission in the fastest time", versionTrigger(beatCropettsMission, []), always_false(), always_true(), versionValue(secondsPlayed), format="SECS", lower_is_better=true, id = id + 4)
leaderboard("Cropett's Mission - 100% Speedrun", "Beat Cropett's Mission with all 8 Alien Fruit in the fastest time", versionTrigger(hundoCropettsMission, []), always_false(), always_true(), versionValue(secondsPlayed), format="SECS", lower_is_better=true, id = id + 5)
leaderboard("Poop Sweeper - Speedrun", "Win a game of Poop Sweeper in the fastest time", versionTrigger(poopSweeperWin, []), always_false(), always_true(), versionValue(poopSweeperTime), format="SECS", lower_is_better=true, id = id + 6)
leaderboard("Poop Sweeper - Most Wins", "Win the most games of Poop Sweeper", versionTrigger(poopSweeperWin, []), always_false(), always_true(), versionValue(poopSweeperWins), format="VALUE", lower_is_better=false, id = id + 7)
leaderboard("Rhythm Game (Woofer) - High Score", "Finish a game of Woofer with the highest score", versionTrigger(rhythmGameEnd, [woofer]), always_false(), always_true(), versionValue(rhythmGameFinalScore), format="VALUE", lower_is_better=false, id = id + 8)
leaderboard("Rhythm Game (Tweeter) - High Score", "Finish a game of Tweeter with the highest score", versionTrigger(rhythmGameEnd, [tweeter]), always_false(), always_true(), versionValue(rhythmGameFinalScore), format="VALUE", lower_is_better=false, id = id + 9)
leaderboard("Rhythm Game (Special 1) - High Score", "Finish a game of Special 1 with the highest score", versionTrigger(rhythmGameEnd, [special1]), always_false(), always_true(), versionValue(rhythmGameFinalScore), format="VALUE", lower_is_better=false, id = id + 10)
leaderboard("Rhythm Game (Special 2) - High Score", "Finish a game of Special 2 with the highest score", versionTrigger(rhythmGameEnd, [special2]), always_false(), always_true(), versionValue(rhythmGameFinalScore), format="VALUE", lower_is_better=false, id = id + 11)
leaderboard("Lilac Force - High Score", "Finish a game of Lilac Force with the highest score", versionTrigger(lilacForceEnd, []), always_false(), always_true(), versionValue(lilacForceScore), format="VALUE", lower_is_better=false, id = id + 12)
leaderboard("Burgerdog - High Score", "Finish a game of Burgerdog with the highest score", versionTrigger(burgerdogEnd, [normal]), always_false(), always_true(), versionValue(burgerdogFinalScore), format="VALUE", lower_is_better=false, id = id + 13)
leaderboard("Burgerdog (Special) - High Score", "Finish a game of Burgerdog (Special) with the highest score", versionTrigger(burgerdogEnd, [special]), always_false(), always_true(), versionValue(burgerdogFinalScore), format="VALUE", lower_is_better=false, id = id + 14)