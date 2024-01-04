// ~Homebrew~ Goodboy Galaxy
// #ID = 27584
// Author: timenoe
// Date Published: 2024-01-02

// Common
function bitFlip(addr) => bit(addr[0], addr[1]) > prev(bit(addr[0], addr[1]))

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
	// Add more cases if needed
}

function nextBit(addr)
{
	if (addr[0] == 7) return [0, addr[1] + 1]
	else return [addr[0] + 1, addr[1]]
}

// Constants - Values
anyDifficulty = 2
beastMode = 0x40
beautyMode = 0x34
boss1 = 0x801e
boss2 = 0x8026
boss3 = 0x802e
burgerdogMaxRankScore = 860
burgerdogSpecialSRankScore = 7500
dress = 0x58
easy = 1
exact = 1
eyepatch = 0x64
hyperBeamLocked = 0
hyperBeamUnlocked = 1
jumpsuit = 0x70
measured = 1
normal = 0
noSpecificMap = 0x00
special = 2
special1 = 3
special1Duration = 0x26b4
special1SRankScore = 4583
special2 = 2
special2Duration = 0x1ec5
special2SRankScore = 4205
tweeter = 1
tweeterDuration = 0x921
tweeterSRankScore = 495
unexact = 0
unmeasured = 0
warpBolt = 1
woofer = 0
wooferDuration = 0xfe2
wooferSRankScore = 782

// Constants - Arrays
dubelleCameraTarget = [0x7000, 0x48c00]
hyperBeamAddr = [4,0xe56c]
installedAppAddrs = [bit4(0xe5da), bit5(0xe5da), bit7(0xe5da)]
maps = ["The Outpost", "Croxco Scrapheap", "Zandunia", "Rumbly Jungle", "Wytchberg", "Totummy Temples", "Grand Zootel", "Resonarion", "Lunar Penitentiary", "Echelon L. Central", "Echelon L. Residential", "Echelon Mega Mall", "Echelon L. Industrial", "Echelon Upper", "Xenolith", "Bolly Dimension", "Orange Dimension"]
newAppAddrs = [bit0(0xe592), bit0(0xe5b8), bit1(0xe5b8), bit2(0xe5b8), bit3(0xe5b8), bit0(0xe5c8), bit2(0xe5c8), bit4(0xe5d8), bit5(0xe5d8)]
nuyuCameraTarget = [0x1f000, 0x43000]
specialScorecardAddrs = [bit2(0xe5b8), bit3(0xe5b8), bit2(0xe5c8)]
tuffStuffAddrs = [bit7(0xe337), bit1(0xe339), bit6(0xe343), bit7(0xe343)]

// Constants - Dictionaries
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
mapIds = 
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
mapTitles = 
{
	"The Outpost": "Crash Site",
	"Croxco Scrapheap": "Tough-Dogs Only",
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
versionOffset = 
{
	1.2: 0,
	//1.3: ?
}

// Functions - Common
function checkBit(offset, addr, status) => bit(addr[0], addr[1] + offset) == status
function clearConsecutiveBits(offset, addr, count, map) => map(offset) == map && prev(sum_of(getBits([addr[0], addr[1] + offset], count), s => s)) > 0 && sum_of(getBits([addr[0], addr[1] + offset], count), s => s) == 0
function falseBit(offset, addr) => bit(addr[0], addr[1] + offset) == 0
function trueBit(offset, addr) => bit(addr[0], addr[1] + offset) == 1
function trueBits(offset, addr, count) => sum_of(getBits([addr[0], addr[1] + offset], count), s => s) == count

function findBit(offset, addr, map) => map(offset) == map && hyperBeamLocked(offset) && bitFlip([addr[0], addr[1] + offset])
function findBits(offset, addr, sum) => prev(sum_of(addr, s => s)) == sum - 1 && measured(sum_of(addr, s => s) == sum, when = maxwellsMission(offset) && inGame(offset) && hyperBeamLocked(offset))
function findConsecutiveBits(offset, addr, count, sum, maps, measured)
{
	if (maps[0] == 0)
	{
		if (measured == 1) return prev(sum_of(getBits([addr[0], addr[1] + offset], count), s => s)) == sum - 1 && measured(sum_of(getBits([addr[0], addr[1] + offset], count), s => s) == sum, when = maxwellsMission(offset) && inGame(offset) && hyperBeamLocked(offset))
		else return maxwellsMission(offset) && inGame(offset) && hyperBeamLocked(offset) && prev(sum_of(getBits([addr[0], addr[1] + offset], count), s => s)) == sum - 1 && sum_of(getBits([addr[0], addr[1] + offset], count), s => s) == sum
	}
	else
	{
		hyperBeamCheck = hyperBeamLocked(offset)
		if (maps[0] == 0x03)
		{
			mission = cropettsMission(offset)
			hyperBeamCheck = always_true()
		}
		else mission = maxwellsMission(offset)
		
		mapCheck = always_false()
		for id in maps mapCheck = __ornext(mapCheck || map(offset) == id)

		if (measured == 1) return mapCheck && prev(sum_of(getBits([addr[0], addr[1] + offset], count), s => s)) == sum - 1 && measured(sum_of(getBits([addr[0], addr[1] + offset], count), s => s) == sum, when = mission && inGame(offset) && hyperBeamCheck)
		else return mapCheck && hyperBeamCheck && prev(sum_of(getBits([addr[0], addr[1] + offset], count), s => s)) == sum - 1 && sum_of(getBits([addr[0], addr[1] + offset], count), s => s) == sum
	}
}
function reachCount(offset, value, count, map, measured, exact)
{
	if (map == 0)
	{
		if (measured == 1)
		{
			if (exact == 1) return prev(value(offset)) == count - 1 && measured(value(offset) == count, when = maxwellsMission(offset) && inGame(offset) && hyperBeamLocked(offset))
			else return prev(value(offset)) < count && measured(value(offset) == count, when = maxwellsMission(offset) && inGame(offset) && hyperBeamLocked(offset))
			
		}
		else
		{
			if (exact == 1) return maxwellsMission(offset) && inGame(offset) && hyperBeamLocked(offset) && prev(value(offset)) == count - 1 && value(offset) == count
			return maxwellsMission(offset) && inGame(offset) && hyperBeamLocked(offset) && prev(value(offset)) < count && value(offset) == count
		}
	}
	else
	{
		hyperBeamCheck = hyperBeamLocked(offset)
		if (map == 0x02)
		{
			mission = cropettsMission(offset)
			hyperBeamCheck = always_true()
		}
		else mission = maxwellsMission(offset)
		
		if (measured == 1)
		{
			if (exact == 1) return map(offset) == map && prev(value(offset)) == count - 1 && measured(value(offset) == count, when = mission && hyperBeamCheck)
			else return map(offset) == map && prev(value(offset)) < count && measured(value(offset) == count, when = mission && hyperBeamCheck)
		}
		else
		{
			if (exact == 1) return mission && map(offset) == map && hyperBeamCheck && prev(value(offset)) == count - 1 && value(offset) == count
			else return mission && map(offset) == map && hyperBeamCheck && prev(value(offset)) < count && value(offset) == count
		}
	}
} 
function valueIncrease(offset, value) => value(offset) > prev(value(offset))

// Functions - Addresses
function albyProgress(offset) => byte(0xe5dc + offset)
function animation(offset) => word(0x4f44 + offset)
function bossHealth(offset, boss) => word(tbyte(0x5100 + offset) + boss)
function burgerdogPtr(offset) => tbyte(0x52cc + offset)
function burgerdogFinalScore(offset) => tbyte(0x1063d + offset)
function burgerdogScore(offset) => dword(burgerdogPtr(offset) + 0x8001)
function councilProgress(offset) => byte(0xe569 + offset)
function creditsTextPtr(offset) => tbyte(0x5360 + offset)
function cropettsMissionCompletePtr(offset) => tbyte(0x11178 + offset)
function dialogueActive(offset) => byte(0x4768 + offset)
function difficulty(offset) => byte(0xe291 + offset)
function file(offset) => byte(0xe27c + offset)
function finaleProgress(offset) => byte(0xe525 + offset)
function friends(offset) => byte(0xe300 + offset)
function gizmoShards(offset) => dword(0xf3f4 + offset) + dword(0xf408 + offset)
function items(offset) => byte(0xe3dc + offset)
function lilacForcePtr(offset) => tbyte(0x532c + offset)
function lilacForceScore(offset) => dword(lilacForcePtr(offset) + 0x8000)
function map(offset) => byte(0x50d4 + offset)
function music(offset) => byte(0x8a10 + offset)
function navSysPtr(offset) => tbyte(0x5288 + offset)
function nearbyNpcPtr(offset) => tbyte(0x5094 + offset)
function outfit(offset) => byte(0x2c9c + offset)
function pawsOsPtr(offset) => tbyte(0x4a6c + offset)
function pawsOsTheme(offset) => byte(0xe5de + offset)
function planet(offset) => byte(0x50d8 + offset)
function poopSweeperPtr(offset) => tbyte(0x4a54 + offset)
function poopSweeperTime(offset) => word(poopSweeperPtr(offset) + 0x80a4)
function poopSweeperWins(offset) => word(0xe58c + offset)
function prisonProgress(offset) => byte(0xe546 + offset)
function rhythmGamePtr(offset) => tbyte(0x5340 + offset)
function rhythmGameFinalScore(offset) => tbyte(0x110dd + offset)
function rhythmGameScore(offset) => tbyte(rhythmGamePtr(offset) + 0x81d1)
function secondsPlayed(offset) => dword(0x50ec + offset) / 59.7275
function shards(offset) => word(0xe2fc + offset)
function shieldRechargeTimer(offset) => word(0x4f54 + offset)
function shotsLeft(offset) => byte(0x4fc8 + offset)
function starbiPtr(offset) => tbyte(0xeb74 + offset)
function weaponMode(offset) => byte(0xe56b + offset)
function witchPtr(offset) => tbyte(0xe9bc + offset)
function xenolithProgress(offset) => byte(0xe568 + offset)
function xPos(offset) => dword(0x4fe8 + offset)
function yPos(offset) => dword(0x4fec + offset)

// Functions - Helpers
function allLaserdrillShardRocks(offset)
{
	allRocks = []
	for rockAddr in range(0xe98c + offset, 0xf0f8 + offset, 0x14) if ((rockAddr != 0xec20 + offset) && (rockAddr != 0xec34 + offset)) array_push(allRocks, dword(rockAddr))
	return allRocks
}
function bossDefeated(offset, boss) => prev(bossHealth(offset, boss)) > 0 && bossHealth(offset, boss) == 0
function burgerdog(offset, special) => byte(0x10638 + offset) == special
function burgerdogEnd(offset) => byte(burgerdogPtr(offset) + 0x8871) > prev(byte(burgerdogPtr(offset) + 0x8871))
function chadCouncilDefeated(offset) => once(bossDefeated(offset, boss1)) && once(bossDefeated(offset, boss3)) && bossDefeated(offset, boss2)
function checkDifficulty(offset, diff)
{
	if (diff > 1) return always_true()
	else return difficulty(offset) == diff
}
function commenceDialogue(offset) => valueIncrease(offset, dialogueActive)
function cropettsMission(offset) => file(offset) == 3
function dying(offset) => byte(0x4f1c + offset) == 0x2
function endMinigame(offset) => prev(byte(0x9a84 + offset)) == 3 && byte(0x9a84 + offset) == 4
function exitBoss(offset) => dying(offset) || notInGame(offset)
function falling(offset) => animation(offset) == 0x850
function grounded(offset) => byte(0x54c4 + offset) == 1
function henchmenDefeated(offset) => prev(bossHealth(offset, boss1)) > 0x11 && bossHealth(offset, boss1) == 0x11
function hyperBeamLocked(offset) => falseBit(offset, hyperBeamAddr)
function inArea(offset, x1, x2, y1, y2) => xPos(offset) >= x1 && xPos(offset) <= x2 && yPos(offset) >= y1 && yPos(offset) <= y2
function inGame(offset) => planet(offset) != 0
function inPlanet(offset) => navSysPtr(offset) == 0
function mapArea(offset, map)
{
	mapCheck = always_false()
	for id in mapIds[map] mapCheck = __ornext(mapCheck || map(offset) == id)

	mapSum = 0
	for mapAddr in mapAddrs[map] mapSum = mapSum + bitcount(mapAddr) 

	return mapCheck && prev(mapSum) == mapTotals[map] - 1 && measured(mapSum == mapTotals[map], when = maxwellsMission(offset) && inGame(offset), format = "percent")
}
function maxwellsMission(offset) => file(offset) != 3
function nearNpc(offset, npcID) => nearbyNpcPtr(offset) != 0 && dword(nearbyNpcPtr(offset)) == npcID
function normalDifficulty(offset) => difficulty(offset) == normal
function notInGame(offset) => planet(offset) == 0
function npcCommenceDialogue(offset, npcID) => wasNearNpc(offset, npcID) && commenceDialogue(offset)
function npcInOutfit(offset, npcPtr, outfit) => npcPtr(offset) != 0 && byte(npcPtr(offset) + 0x2c) == outfit
function outOfOrderCouncil(offset) => (bossHealth(offset, boss3) == 0 && bossHealth(offset, boss1) > 0) || (bossHealth(offset, boss2) == 0 && bossHealth(offset, boss1) > 0) || (bossHealth(offset, boss2) == 0 && bossHealth(offset, boss3) > 0)
function pawsed(offset) => pawsOsPtr(offset) != 0
function poopSweeperStarted(offset) => byte(poopSweeperPtr(offset) + 0x8028) > 0
function regenShield(offset) => prev(shieldRechargeTimer(offset)) > 0 && shieldRechargeTimer(offset) == 0
function rhythmGame(offset, game) => byte(0x110d8 + offset) == game
function rhythmGameEnd(offset, duration) => prev(dword(rhythmGamePtr(offset) + 0x8844)) < duration && dword(rhythmGamePtr(offset) + 0x8844) == duration
function shootBlaster(offset) => shotsLeft(offset) < prev(shotsLeft(offset))
function spawnHardRocks(offset) => word(0xe806 + offset) > prev(word(0xe806 + offset))
function startBountyHuntersBoss(offset, diff, hyperBeamStatus) => checkDifficulty(offset, diff) && map(offset) == 0x12 && checkBit(offset, hyperBeamAddr, hyperBeamStatus) && prev(music(offset)) != 0x4a && music(offset) == 0x4a
function startCouncilBoss(offset, diff, hyperBeamStatus) => checkDifficulty(offset, diff) && map(offset) == 0x9 && checkBit(offset, hyperBeamAddr, hyperBeamStatus) && falling(offset) && regenShield(offset)
function startHenchmenBoss(offset, diff) => difficulty(offset) == diff && map(offset) == 0x25 && prev(music(offset)) != 0x10 && music(offset) == 0x10
function startMamacuda1Boss(offset, diff, hyperBeamStatus) => checkDifficulty(offset, diff) && map(offset) == 0x33 && checkBit(offset, hyperBeamAddr, hyperBeamStatus) && prev(music(offset)) != 0x16 && music(offset) == 0x16
function startMamacuda2Boss(offset, diff, hyperBeamStatus) => checkDifficulty(offset, diff) && map(offset) == 0x2a && checkBit(offset, hyperBeamAddr, hyperBeamStatus) && prev(music(offset)) != 0x16 && music(offset) == 0x16
function startSlimerBoss(offset, diff, hyperBeamStatus) => checkDifficulty(offset, diff) && map(offset) == 0x1f && checkBit(offset, hyperBeamAddr, hyperBeamStatus) && prev(music(offset)) != 6 && music(offset) == 6
function threeBossesDefeated(offset) => prev(bossHealth(offset, boss1)) + prev(bossHealth(offset, boss2)) + prev(bossHealth(offset, boss3)) > 0 && bossHealth(offset, boss1) + bossHealth(offset, boss2) + bossHealth(offset, boss3) == 0
function tookDamage(offset) => shieldRechargeTimer(offset) > 0
function trackCameraTarget(offset, cameraTarget) => dword(0x97d0 + offset) == 0x400 && dword(0x97f0 + offset) == cameraTarget[0] && dword(0x97f4 + offset) == cameraTarget[1]
function useWeapon(offset, mode) => weaponMode(offset) == mode && shootBlaster(offset)
function versionIdentifier(version)
{
	if (version == 1.2) return always_true()
	else if (version == 1.3) return always_true()
	// Add more cases if needed
}
function wasNearNpc(offset, npcID) => prev(nearbyNpcPtr(offset)) != 0 && prev(dword(nearbyNpcPtr(offset))) == npcID

// Functions - Achievements
function bountyHuntersChallenge(offset) => never(shootBlaster(offset) || tookDamage(offset) || notInGame(offset)) && once(startBountyHuntersBoss(offset, normal, hyperBeamLocked)) && trigger_when(threeBossesDefeated(offset))
function changeTheme(offset) => inGame(offset) && pawsed(offset) && trigger_when(prev(pawsOsTheme(offset)) == 5 && pawsOsTheme(offset) == 6)
function changeOutfit(offset) => map(offset) == 0x0e && trackCameraTarget(offset, nuyuCameraTarget) && trigger_when(outfit(offset) != prev(outfit(offset)))
function councilChallenge(offset) => never(outOfOrderCouncil(offset) || tookDamage(offset) || notInGame(offset)) && once(startCouncilBoss(offset, normal, hyperBeamLocked)) && trigger_when(chadCouncilDefeated(offset))
function cropettSpeedrun(offset) => cropettsMission(offset) && inGame(offset) && secondsPlayed(offset) <= 600 && trigger_when(beatCropettsMission(offset))
function dangerNut(offset) => never(xPos(offset) > 0x6f9 && xPos(offset) < 0x727 || yPos(offset) > 0x650 || dying(offset)) && once(map(offset) == 0x31 && hyperBeamLocked(offset) && prev(nearbyNpcPtr(offset)) == tbyte(0xf3bc + offset) && npcCommenceDialogue(offset, 0x9e81d50)) && trigger_when(xPos(offset) >= 0x140 && xPos(offset) <= 0x200 && grounded(offset))
function dayThreeBombParts(offset) => planet(offset) == 0xa && inPlanet(offset) && byte(0xe548 + offset) <= 3 && prev(sum_of(getBits([7, 0xe336 + offset], 5), s => s)) < 5 && trigger_when(sum_of(getBits([7, 0xe336 + offset], 5), s => s) == 5)
function fallFromHeaven(offset) => map(offset) == 0x11 && prev(animation(offset)) == 0x850 && animation(offset) == 0x3d0
function findPodly(offset) => inPlanet(offset) && map(offset) == 0x0f && trueBit(offset, hyperBeamAddr) && trigger_when(inArea(offset, 0x54a, 0x559, 0x0b3, 0x0b3))
function flexOnGuard(offset) => map(offset) == 0x2b && trueBit(offset, [4,0xe540]) && trigger_when(npcCommenceDialogue(offset, 0x9e829a8))
function get10kShards(offset) => maxwellsMission(offset) && inGame(offset) && prev(shards(offset)) < 10000 && shards(offset) >= 10000
function henchmenChallenge(offset) => never(tookDamage(offset) || notInGame(offset)) && once(startHenchmenBoss(offset, normal)) && trigger_when(henchmenDefeated(offset))
function hideInBox(offset) => map(offset) == 0x1c && prisonProgress(offset) > 8 && trigger_when(prev(byte(0x004f1c + offset)) == 9 && byte(0x004f1c + offset) == 0xa)
function hugJenovi(offset) => inPlanet(offset) && map(offset) == 0x22 && trueBit(offset, [5,0xe305]) && trigger_when(npcCommenceDialogue(offset, 0x9e821b4))
function installNewApp(offset) => inGame(offset) && pawsed(offset) && sum_of(newAppAddrs, s => s) > 0 && prev(sum_of(installedAppAddrs, s => s)) == 0 && trigger_when(sum_of(installedAppAddrs, s => s) == 1)
function laserdrillChallenge(offset) => prev(sum_of(allLaserdrillShardRocks(offset), s => s)) < 93 && measured(sum_of(allLaserdrillShardRocks(offset), s => s) >= 93, when = difficulty(offset) == normal && map(offset) == 0x05 && music(offset) == 0x1d)
function mamacuda1Challenge(offset) => never(dying(offset) || notInGame(offset)) && never(once(startMamacuda1Boss(offset, normal, hyperBeamLocked)) && repeated(1201, always_true())) && once(startMamacuda1Boss(offset, normal, hyperBeamLocked)) && trigger_when(bossDefeated(offset, boss1))
function mamacuda2Challenge(offset) => never(useWeapon(offset, warpBolt) || dying(offset) || notInGame(offset)) && once(startMamacuda2Boss(offset, normal, hyperBeamLocked)) && trigger_when(bossDefeated(offset, boss1))
function mamacudaSaysHi(offset) => inPlanet(offset) && map(offset) == 0x31 && trueBit(offset, [2,0xe52d]) && prev(byte(0x11172 + offset)) == 0 && trigger_when(byte(0x11172) + offset == 1)
function mapAchievements(maps, id)
{
	for map in maps
	{
		areaCount = length(mapIds[map])
		if (areaCount == 1) description = "Map 100% of " + map
		else if (areaCount == 2) description = "Map 100% of both areas in " + map
		else description = "Map 100% of all " + areaCount + " areas in " + map
		achievement(mapTitles[map], description, 10, versionTrigger(mapArea, [map]), id=id)
		id = id + 1
	}
}
function petKappa(offset) => map(offset) == 0x2d && wasNearNpc(offset, 0x9e7ec68) && prev(byte(0x4f1c + offset)) == 0 && trigger_when(byte(0x4f1c + offset) == 0x10)
function plestroChallenge(offset) => inPlanet(offset) && map(offset) == 0x31 && trueBit(offset, [7,0xe401]) && falseBit(offset, [0,0xe402]) && falseBit(offset, [1,0xe402]) && prev(bit0(0xe303 + offset)) == 0 && trigger_when(trueBit(offset, [0,0xe303]))
function poopThink(offset) => inGame(offset) && poopSweeperPtr(offset) != 0 && never(byte(poopSweeperPtr(offset) + 0x80d8) == 0) && trigger_when(repeated(60, byte(poopSweeperPtr(offset) + 0x80d8) == 1))
function rankBurgerdog(offset, special, score) => map(offset) == 0x0c && burgerdog(offset, special) && burgerdogPtr(offset) != 0 && burgerdogScore(offset) >= score && trigger_when(burgerdogEnd(offset))
function rankRhythmGame(offset, game, score, duration) => map(offset) == 0x23 && rhythmGame(offset, game) && rhythmGamePtr(offset) != 0 && rhythmGameScore(offset) >= score && trigger_when(rhythmGameEnd(offset, duration))
function readUselessSign(offset) => inPlanet(offset) && map(offset) == 0x31 && trueBit(offset, [4,0xe52d]) && trigger_when(npcCommenceDialogue(offset, 0x9e82a50))
function revealHyperBeam(offset) => inPlanet(offset) && map(offset) == 0x0f && trueBit(offset, [4,0xe56c]) && prev(byte(0x1116d + offset)) == 0 && trigger_when(byte(0x01116d + offset) == 1)
function ringDubelleBluePath(offset) => map(offset) == 0x2a && hyperBeamLocked(offset) && music(offset) == 0x27 && trigger_when(trackCameraTarget(offset, dubelleCameraTarget))
function seeStarbiOutfit(offset, outfit) => map(offset) == 0x32 && npcInOutfit(offset, starbiPtr, outfit) && trigger_when(nearNpc(offset, 0x9e82864))
function shipWarp(offset) => inGame(offset) && byte(0x509c + offset) < 2 && prev(dword(0x5098 + offset)) == 119 && dword(0x5098 + offset) == 0
function slimerChallenge(offset) => never(repeated(3, spawnHardRocks(offset)) || dying(offset) || notInGame(offset)) && once(startSlimerBoss(offset, normal, hyperBeamLocked)) && trigger_when(bossDefeated(offset, boss1))
function sPlusRankLilacForce(offset) => map(offset) == 0x0d && lilacForcePtr(offset) != 0 && lilacForceScore(offset) >= 390464 && trigger_when(endMinigame(offset))
function speakToWitch(offset, mode) => map(offset) == 0x2e && npcInOutfit(offset, witchPtr, mode) && commenceDialogue(offset)
function sRankPoopSweeper(offset) => inGame(offset) && poopSweeperPtr(offset) != 0 && poopSweeperStarted(offset) && poopSweeperTime(offset) <= 15 && trigger_when(valueIncrease(offset, poopSweeperWins))
function uncoverGizmo(offset) => map(offset) == 0x0e && prev(gizmoShards(offset)) < 2 && trigger_when(gizmoShards(offset) == 2)
function unlockHyperBeam(offset) => tbyte(0xe76c + offset) != 0 && byte(tbyte(0xe76c + offset) + 0x840c) > prev(byte(tbyte(0xe76c + offset) + 0x840c)) 

// Functions - Leaderboards
function beatCropettsMission(offset) => map(offset) == 0x02 && prev(cropettsMissionCompletePtr(offset)) == 0 && cropettsMissionCompletePtr(offset) != 0
function beatGame(offset, hyperBeamStatus) => map(offset) == 0x20 && checkBit(offset, hyperBeamAddr, hyperBeamStatus) && prev(creditsTextPtr(offset)) == 0 && creditsTextPtr(offset) != 0
function clearRhythmGame(offset, game, duration) => map(offset) == 0x23 && rhythmGame(offset, game) && rhythmGamePtr(offset) != 0 && rhythmGameEnd(offset, duration)
function endBurgerdog(offset, special) => map(offset) == 0x0c && burgerdog(offset, special) && burgerdogPtr(offset) != 0 && burgerdogEnd(offset)
function endLilacForce(offset) => map(offset) == 0x0d && lilacForcePtr(offset) != 0 && endMinigame(offset)
function hundoCropettsMission(offset) => trueBits(offset, [6, 0xe339], 8) && beatCropettsMission(offset)
function hundoGame(offset, status) => friends(offset) == 67 && items(offset) == 124 && trueBits(offset, [0,0xe584], 30) && trueBits(offset, [0,0xe5e0], 38) && trueBit(offset, [2,0xe57a]) && poopSweeperWins(offset) >= 5 && beatGame(offset, status)
function winPoopSweeper(offset) => inGame(offset) && poopSweeperPtr(offset) != 0 && valueIncrease(offset, poopSweeperWins)

// Functions - Trigger
function versionTrigger(func, args)
{
	trigger = always_false()
	if (length(args) == 0) for version in versionOffset trigger = trigger || versionIdentifier(version) && func(versionOffset[version])
	else if (length(args) == 1) for version in versionOffset trigger = trigger || versionIdentifier(version) && func(versionOffset[version], args[0])
	else if (length(args) == 2) for version in versionOffset trigger = trigger || versionIdentifier(version) && func(versionOffset[version], args[0], args[1])
	else if (length(args) == 3) for version in versionOffset trigger = trigger || versionIdentifier(version) && func(versionOffset[version], args[0], args[1], args[2])
	else if (length(args) == 4) for version in versionOffset trigger = trigger || versionIdentifier(version) && func(versionOffset[version], args[0], args[1], args[2], args[3])
	else if (length(args) == 5) for version in versionOffset trigger = trigger || versionIdentifier(version) && func(versionOffset[version], args[0], args[1], args[2], args[3], args[4])
	else if (length(args) == 6) for version in versionOffset trigger = trigger || versionIdentifier(version) && func(versionOffset[version], args[0], args[1], args[2], args[3], args[4], args[5])
	// Add more cases if needed
	return trigger
}

// Functions - Leaderboard Value
function versionValue(func)
{
	values = []
	for version in versionOffset array_push(values, measured(func(versionOffset[version]), when = versionIdentifier(version)))
	return maxof(values)
}

// Achievements

// The Outpost, Orange Dimension
// Progression
achievement("Pootooty Salad Slam", "Reclaim your Jetpack after the crash-landing", 1, versionTrigger(findBit, [[2, 0xe335], 0x21]), id=385559) // Progression
achievement("Junk Retriever", "Find 3 spare parts to fix your ship", 5, versionTrigger(findConsecutiveBits, [[2,0xe343], 4, 3, [0x1f], measured]), id=385560) // Progression
// Completion
achievement("Spare Spare Part", "Find an extra spare part", 3, versionTrigger(findConsecutiveBits, [[2,0xe343], 4, 4, [0x1f], unmeasured]), id=385561)
achievement("Citrus Surprise", "Find 22 oranges for Azure", 10, versionTrigger(findConsecutiveBits, [[6,0xe339], 30, 22, [noSpecificMap], unmeasured]), id=385562)
achievement("Vitamin C Overload", "Find all 30 oranges for Azure", 25, versionTrigger(findConsecutiveBits, [[6,0xe339], 30, 30, [noSpecificMap], measured]), id=385563)
achievement("Orange Island Beta Tester", "Find all 3 Alien Tech. cartridges for Azure", 10, versionTrigger(findConsecutiveBits, [[3,0xe339], 3, 3, [0x1e], measured]), id=385564)
achievement("Fragmented Memories", "Defeat the hidden Slimer", 10, versionTrigger(findBit, [[4, 0xe524], 0x1f]), id=385565)
mapAchievements(["The Outpost", "Orange Dimension"], 385566)
// Miscellaneous
achievement("Not-So-Alien Fruit", "Meet Azure (oranges are now marked on the map)", 1, versionTrigger(findBit, [[3, 0xe3eb], 0x21]), id=385568)
// Challenges
achievement("Target Practice", "Defeat the hidden Slimer while only letting it summon at most 3 Hard-Rocks on Normal difficulty", 10, versionTrigger(slimerChallenge, []), id=385569) // Missable

// Zandunia, Rumbly Jungle, Croxco Scrapheap, Saltsoup Basin
// Progression
achievement("Surf ‘N’ Guns Hut", "Acquire the Rapid Fire Mod", 3, versionTrigger(findBit, [[5,0xe335], 0x31]), id=385570) // Progression
achievement("Certified Tough-Guy", "Find all 4 articles of tuff-stuff for Crox", 10, versionTrigger(findBits, [tuffStuffAddrs, 4]), id=385571) // Progression
achievement("Starbi-Fanboy", "Find 5 different Pooki flavours for Starbi", 10, versionTrigger(findConsecutiveBits, [[4,0xe341], 10, 5, [noSpecificMap], unmeasured]), id=385572)
achievement("Post-Death Body", "Acquire the Tibia", 5, versionTrigger(findBit, [[0,0xe344], 0x06]), id=385573) // Progression
achievement("Killer Munchies", "Acquire the Blast Module", 5, versionTrigger(findBit, [[6,0xe335], 0x31]), id=385574) // Progression
achievement("Long Distance Relationship", "Reunite Jeeko and Teeko", 5, versionTrigger(findBit, [[1,0xe339], 0x24]), id=385575) // Progression
achievement("True Goodest of Lads", "Deliver the Salvage Bulb to Precise", 5, versionTrigger(findBit, [[4,0xe347], 0x25]), id=385576) // Progression
achievement("Sneaky Saboteur", "Escape from Planck's henchmen and acquire the Laserblade Grip from Jeeko and Teeko", 5, versionTrigger(findBit, [[7,0xe343], 0x24]), id=385577) // Progression
achievement("Crox Rox", "Escape the Laserdrill and acquire the Laserblade from Crox", 5, versionTrigger(findBit, [[4,0xe335], 0x5]), id=385578) // Progression
// Completion
achievement("Maxwell D. Goodboy", "Safely cross the channel on the raft", 3, versionTrigger(findBit, [[4,0xe402], 0x31]), id=385579)
achievement("Top the Charts", "Find all 10 different Pooki flavours for Starbi", 10, versionTrigger(findConsecutiveBits, [[4,0xe341], 10, 10, [noSpecificMap], measured]), id=385580)
achievement("Door-to-Door Pooki Salesman", "Clear the Zandunia warehouse of beasties, or find a way out", 5, versionTrigger(findConsecutiveBits, [[7,0xe401], 3, 1, [0x33], unmeasured]), id=385581)
achievement("Plestro's Guard Dog", "Defeat Mamacuba in the Zandunia warehouse", 5, versionTrigger(findBit, [[2,0xe52d], 0x33]), id=385582)
achievement("Little Lost Souls", "Find and return all 4 of Aelia's missing babies", 5, versionTrigger(findConsecutiveBits, [[5,0xe528], 4, 4, [0x04], measured]), id=385583)
achievement("Fish Fear You", "Catch all 12 fish", 10, versionTrigger(findConsecutiveBits, [[0,0xe590], 12, 12, [0x13], measured]), id=385584)
mapAchievements(["Zandunia", "Rumbly Jungle", "Croxco Scrapheap"], 385585)
// Miscellaneous
achievement("Token Useless Sign", "Read Whippy's sign of great advice after blasting the Hard-Rock", 1, versionTrigger(readUselessSign, []), id=385588)
achievement("Top Pirate-Raid Insurance", "Tell Plestro that Mamacuda says hi", 1, versionTrigger(mamacudaSaysHi, []), id=385589)
achievement("Clearly a Star", "Approach Starbi when she is wearing the dress", 1, versionTrigger(seeStarbiOutfit, [dress]), id=385590)
achievement("Eye See You", "Approach Starbi when she is wearing the eyepatch", 1, versionTrigger(seeStarbiOutfit, [eyepatch]), id=385591)
achievement("Jumpsuit Jams", "Approach Starbi when she is wearing the jumpsuit", 1, versionTrigger(seeStarbiOutfit, [jumpsuit]), id=385592)
achievement("Imposter Among Us", "That pattern on the wall is suspect...", 1, versionTrigger(findBit, [[0,0xe33a], 0x32]), id=385593)
// Challenges
achievement("Small-Brain Danger-Nut", "Disregard Chopo's advice and cross the gap", 5, versionTrigger(dangerNut, []), id=385594)
achievement("Tastes Like Remorse", "Escape the warehouse without defeating any beasties and then return to Plestro", 10, versionTrigger(plestroChallenge, []), id=385595) // Missable
achievement("Rottweiler Tier Guard Dog", "Defeat Mamacuda in Zandunia within 20s on Normal difficulty", 10, versionTrigger(mamacuda1Challenge, []), id=385596) // Missable
achievement("The Bear Necessities", "Defeat Planck's henchmen without taking damage on Normal difficulty", 25, versionTrigger(henchmenChallenge, []), id=385597) // Missable
achievement("Laserdrill Certified", "Have the Laserdrill destroy 93 Shard-Rocks on Normal difficulty", 25, versionTrigger(laserdrillChallenge, []), id=385598) // Missable

// Wytchberg, Totummy Temples, Grand Zootel, Resonarion
// Progression
achievement("I’d Buy That for a Thousand Shards", "Buy the Shrink Module", 3, versionTrigger(findBit, [[7,0xe335], 0x2d]), id=385599) // Progression
achievement("5 Star Rating Alert!", "Collect 5 herbs for Witch", 10, versionTrigger(findConsecutiveBits, [[0,0xe338], 8, 5, [noSpecificMap], unmeasured]), id=385600) // Progression
achievement("Secret of Totummy Temple", "Ring all 3 bells to meet the requirement to open the locked temple door", 5, versionTrigger(findConsecutiveBits, [[0,0xe406], 3, 3, [0x2a], measured]), id=385601) // Progression
achievement("The Gift of Teleportation", "Acquire the Teleport Module", 3, versionTrigger(findBit, [[0, 0xe336], 0x28]), id=385602) // Progression
achievement("Worthy One", "Clear all 3 Totummy trials", 5, versionTrigger(findConsecutiveBits, [[1,0xe540], 3, 3, [0x28], measured]), id=385603) // Progression
achievement("Pirate Goonsquad Initiation", "Defeat Mamacuda in Totummy Temples", 5, versionTrigger(findBit, [[6, 0xe541], 0x2a]), id=385604) // Progression
// Completion
achievement("You Monster...", "Catch a Kapparama for Grand Zootel", 3, versionTrigger(findBit, [[0,0xe57a], 0x2d]), id=385605)
achievement("Return of the Predecessor", "Rescue Wilbo from his stupid job", 5, versionTrigger(findBit, [[6,0xe352], 0x2d]), id=385606)
achievement("Thane of Canis Major", "Collect all 8 herbs for Witch", 10, versionTrigger(findConsecutiveBits, [[0,0xe338], 8, 8, [noSpecificMap], measured]), id=385607)
achievement("Developer Insanity", "Clear the \"cancelled\" Totummy trial", 10, versionTrigger(findBit, [[4,0xe540], 0x29]), id=385608)
achievement("Full Occupancy!", "Fill Grand Zootel with 18 beasties", 25, versionTrigger(findConsecutiveBits, [[0,0xe578], 18, 18, [noSpecificMap], measured]), id=385609)
achievement("Nocturnal Nuisance", "Catch a special guest for the Grand Zootel penthouse", 5, versionTrigger(findBit, [[2,0xe57a], 0x30]), id=385610)
achievement("Gather the Toots", "Gather all 3 missing Toots for Bingo", 5, versionTrigger(findConsecutiveBits, [[4,0xe406], 3, 3, [0x22], measured]), id=385611)
achievement("Top-Quality Production", "Bring the Woofer and Tweeter systems online to repair the Musicator (Cassettedisks are now revealed on the map)", 5, versionTrigger(findConsecutiveBits, [[2,0xe545], 2, 2, [0x23], measured]), id=385612)
achievement("All the Hits", "Find all 31 Cassettedisks for Bingo", 50, versionTrigger(findConsecutiveBits, [[4,0xe33d], 31, 31, [noSpecificMap], measured]), id=385613)
achievement("Jenovi Convention", "Stack all 5 missing Barrel Cacti for Jenovi", 5, versionTrigger(findConsecutiveBits, [[0,0xe5dd], 5, 5, [0x22], measured]), id=385614)
mapAchievements(["Wytchberg", "Totummy Temples", "Grand Zootel", "Resonarion"], 385615)
// Miscellaneous
achievement("<3 Kapparama My Beloved <3", "Pet a Kapparama", 1, versionTrigger(petKappa, []), id=385619)
achievement("Truly Terrifying", "Speak to Witch while she is in Beast Mode", 1, versionTrigger(speakToWitch, [beastMode]), id=385620)
achievement("Makeover Time", "Speak to Witch while she is in Beauty Mode", 1, versionTrigger(speakToWitch, [beautyMode]), id=385621)
achievement("Real Recognize Real", "After clearing the \"cancelled\" Totummy trial, talk to the guard at the entrance of the trial", 1, versionTrigger(flexOnGuard, []), id=385622)
achievement("Love Hurts", "Hug Jenovi after stacking all of his Barrel Cacti", 1, versionTrigger(hugJenovi, []), id=385623)
// Challenges
achievement("Dodge This Dubelle", "Ring Dubelle on the blue Ancient Gate route", 5, versionTrigger(ringDubelleBluePath, []), id=385624)
achievement("Softlock Key", "Defeat Mamacuda in Totummy Temples without using the Warp Bolt on Normal difficulty", 10, versionTrigger(mamacuda2Challenge, []), id=385625) // Missable
achievement("Who Let the Dogs Out", "Get an S rank in Woofer", 10, versionTrigger(rankRhythmGame, [woofer, wooferSRankScore, wooferDuration]), id=385626)
achievement("Make Gramma Proud", "Get an S rank in Tweeter", 10, versionTrigger(rankRhythmGame, [tweeter, tweeterSRankScore, tweeterDuration]), id=385627)
achievement("The Intense Voice of Maxwell", "Get an S rank in Special 1", 25, versionTrigger(rankRhythmGame, [special1, special1SRankScore, special1Duration]), id=385628)
achievement("Through the Woofs and Tweets", "Get an S rank in Special 2", 25, versionTrigger(rankRhythmGame, [special2, special2SRankScore, special2Duration]), id=385629)

// Lunar Penitentiary, Echelon Lower
// Progression
achievement("Drill Doger", "Acquire the Drill Module", 1, versionTrigger(findBit, [[3, 0xe335], 0x18]), id=385630) // Progression
achievement("Incendiary Greatness", "Find all 5 bomb parts for Bomsae", 5, versionTrigger(findConsecutiveBits, [[7,0xe336], 5, 5, [0x14,0x15,0x16,0x17], measured]), id=385631) // Progression
achievement("Professional Escape", "Escape from Lunar Penitentiary with the gang", 5, versionTrigger(reachCount, [prisonProgress, 10, 0x1d, unmeasured, exact]), id=385632) // Progression
achievement("Pocket Full of Shards", "Collect 10k shards", 10, versionTrigger(get10kShards, []), id=385633) // Progression
achievement("Sorry I'm Late", "Fix the trains that go to the residential and industrial districts in Echelon L. Central", 5, versionTrigger(findBit, [[5, 0xe558], 0x0f]), id=385634) // Progression
achievement("Elevation Station", "Find all 4 keycards to open the entrance to the Echelon Upper elevator", 10, versionTrigger(findConsecutiveBits, [[2,0xe336], 4, 4, [0x0b,0x0f], measured]), id=385635) // Progression
// Completion
achievement("Banana Drama", "Finally help Alby find his bananas", 10, versionTrigger(reachCount, [albyProgress, 8, 0x0c, unmeasured, exact]), id=385636)
achievement("Hide ‘N’ Seek Tryhard", "Help Banban find Tootie", 3, versionTrigger(findBit, [[0, 0xe409], 0x0d]), id=385637)
achievement("Main Character Aura", "Get at least an S rank in Lilac Force and impress Video Game Sage", 10, versionTrigger(findBit, [[6, 0xe409], 0x0d]), id=385638)
achievement("I'm a Hustla Baby", "Get at least an A rank in Burgerdog and turn it into a profitable business for Landlord", 3, versionTrigger(findBit, [[5, 0xe409], 0x0c]), id=385639)
achievement("Part-Time Hero", "Defeat all the beasties in Echelon Mega Mall", 5, versionTrigger(clearConsecutiveBits, [[0,0xe560], 45, 0x0e]), id=385640)
achievement("I Ruff Rock and Roll", "Open a chest with the help of a guard in Echelon L. Industrial", 3, versionTrigger(findBit, [[6, 0xe585], 0x0b]), id=385641)
mapAchievements(["Lunar Penitentiary", "Echelon L. Central", "Echelon L. Residential", "Echelon Mega Mall", "Echelon L. Industrial"], 385642)
// Miscellaneous
achievement("Boxwell", "Hide inside the box in Cropett's prison cell", 1, versionTrigger(hideInBox, []), id=385672)
achievement("R.I.P. Gizmo", "Collect the two shards covering the portrait of Rik's old dog Gizmo", 1, versionTrigger(uncoverGizmo, []), id=385647)
achievement("Looking Sharp!", "Change your outfit at Nuyu's New You", 1, versionTrigger(changeOutfit, []), id=385648)
// Challenges
achievement("Get Shafted", "Find all 5 bomb parts for Bomsae within 3 days", 10, versionTrigger(dayThreeBombParts, []), id=385649) // Missable
achievement("Welcome to Burgerdog...", "Get a MAX rank in Burgerdog", 5, versionTrigger(rankBurgerdog, [normal, burgerdogMaxRankScore]), id=385650)
achievement("...Home of the Burgerdog", "Get an S rank in Burgerdog (Special)", 10, versionTrigger(rankBurgerdog, [special, burgerdogSpecialSRankScore]), id=385651)
achievement("PyroPyro's Pinnacle", "Get an S+ rank in Lilac Force", 25, versionTrigger(sPlusRankLilacForce, []), id=385652)

// Echelon Upper, Xenolith
// Progression
achievement("New Leash on Life", "Defeat then befriend the Bounty Hunters", 5, versionTrigger(findBit, [[2, 0xe308], 0x12]), id=385653) // Progression
achievement("This Is Weird", "Find a way to escape from Xenolith", 5, versionTrigger(reachCount, [xenolithProgress, 5, 0x11, unmeasured, exact]), id=385654) // Progression
achievement("Cherub's Choice", "Make 50 friends to meet the requirement to enter the Council Chamber", 25, versionTrigger(reachCount, [friends, 50, noSpecificMap, unmeasured, exact]), id=385655) // Progression
achievement("Pirate Goonsquad Barage", "Open the gate to the Council Chamber", 1, versionTrigger(findBit, [[4, 0xe408], 0x11]), id=385656) // Progression
achievement("That Escalated Quickly", "Destroy The Council", 25, versionTrigger(reachCount, [councilProgress, 4, 0x10, unmeasured, exact]), id=385657) // Win Condition
// Completion
mapAchievements(["Echelon Upper", "Xenolith"], 385658)
// Miscellaneous
achievement("Staff Use Only!", "Fall down from heaven", 1, versionTrigger(fallFromHeaven, []), id=385660)
// Challenges
achievement("Barking up the Wrong Tree", "Defeat the Bounty Hunters without shooting the Blaster and without taking damage on Normal difficulty", 10, versionTrigger(bountyHuntersChallenge, []), id=385661) // Missable
achievement("Canis Major Chad", "Destroy The Council in the order of blue, yellow, then red without taking damage on Normal difficulty", 25, versionTrigger(councilChallenge, []), id=385662)

// Overall Completion
achievement("Macro-Being", "Explore the Bolly nests and discover what's inside", 10, versionTrigger(findBit, [[1, 0xe403], 0x01]), id=385663)
mapAchievements(["Bolly Dimension"], 385664)
achievement("Push It to the Limit", "Unlock all 3 special minigame scorecards", 3, versionTrigger(findBits, [specialScorecardAddrs, 3]), id=385665)
achievement("Clean Sweep", "Win 5 games of Poop Sweeper", 10, versionTrigger(reachCount, [poopSweeperWins, 5, noSpecificMap, measured, exact]), id=385666)
achievement("Treasure Tracker", "Open all 30 chests", 25, versionTrigger(findConsecutiveBits, [[0,0xe584], 30, 30, [noSpecificMap], measured]), id=385667)
achievement("Points? Check!", "Activate all 38 checkpoints", 25, versionTrigger(findConsecutiveBits, [[0,0xe5e0], 38, 38, [noSpecificMap], measured]), id=385668)
achievement("Friend Zone", "Make all 67 friends", 50, versionTrigger(reachCount, [friends, 67, noSpecificMap, measured, exact]), id=385669)
achievement("Cosmic Curator", "Acquire all 124 items", 50, versionTrigger(reachCount, [items, 124, noSpecificMap, measured, exact]), id=385670)

// Overall Miscellaneous
achievement("Pro Tip", "Warp back to your ship by holding Select", 1, versionTrigger(shipWarp, []), id=385671)
achievement("Nostalgia Overload", "Cycle through all the pawsOS themes by pressing Select", 1, versionTrigger(changeTheme, []), id=385673)
achievement("Pawsome Present", "Install a new app in pawsOS", 1, versionTrigger(installNewApp, []), id=385674)
achievement("The Thinker", "Think for a moment during a game of Poop Sweeper", 1, versionTrigger(poopThink, []), id=385675)

// Overall Challenges
achievement("Watch Your Step", "Get an S rank in Poop Sweeper", 10, versionTrigger(sRankPoopSweeper, []), id=385676)

// Post-Game - Hyper Beam
achievement("The Power of Friendship", "Unlock the Hyper Beam (disables achievements on that save file)", 1, versionTrigger(unlockHyperBeam, []), id=385677)
achievement("Well, This is Pawkward", "Use the Hyper Beam near Sbooch in Echelon L. Central", 1, versionTrigger(revealHyperBeam, []), id=385678)
achievement("Podly Is Real", "Use the Hyper Beam to discover an homage to exelotl's old character Podly", 5, versionTrigger(findPodly, []), id=385679)

// Post-Game - Cropett's Mission
achievement("[GBA Exclusive] Orange Pear Apple...Fauxrog?", "Find all 8 Alien Fruit in Cropett's mission", 10, versionTrigger(findConsecutiveBits, [[6,0xe339], 8, 8, [0x03], measured]), id=385680)
achievement("[GBA Exclusive] Moment of Reprieve", "Activate all 6 checkpoints in Cropett's mission", 5, versionTrigger(findConsecutiveBits, [[1,0xe5e0], 6, 6, [0x03], measured]), id=385681)
achievement("[GBA Exclusive] Slimer's Secret", "Complete Cropett's mission", 10, versionTrigger(reachCount, [finaleProgress, 4, 0x02, unmeasured, unexact]), id=385682)
achievement("[GBA Exclusive] Parachute Pirouette", "Complete Cropett's mission within 10 minutes", 25, versionTrigger(cropettSpeedrun, []), id=385683)

// Leaderboards
leaderboard("Any% Speedrun", "Beat the game in the fastest time", versionTrigger(beatGame, [hyperBeamLocked]), always_false(), always_true(), versionValue(secondsPlayed), format="SECS", lower_is_better=true, id=84700)
leaderboard("100% Speedrun", "Beat the game with 100% completion in the fastest time", versionTrigger(hundoGame, [hyperBeamLocked]), always_false(), always_true(), versionValue(secondsPlayed), format="SECS", lower_is_better=true, id=84701)
leaderboard("Hyper Beam - Any% Speedrun", "Beat the game using the Hyper Beam in the fastest time", versionTrigger(beatGame, [hyperBeamUnlocked]), always_false(), always_true(), versionValue(secondsPlayed), format="SECS", lower_is_better=true, id=84702)
leaderboard("Hyper Beam - 100% Speedrun", "Beat the game with 100% completion using the Hyper Beam in the fastest time", versionTrigger(hundoGame, [hyperBeamUnlocked]), always_false(), always_true(), versionValue(secondsPlayed), format="SECS", lower_is_better=true, id=84703)
leaderboard("Cropett's Mission - Any% Speedrun", "Beat Cropett's Mission in the fastest time", versionTrigger(beatCropettsMission, []), always_false(), always_true(), versionValue(secondsPlayed), format="SECS", lower_is_better=true, id=84704)
leaderboard("Cropett's Mission - 100% Speedrun", "Beat Cropett's Mission with all 8 Alien Fruit in the fastest time", versionTrigger(hundoCropettsMission, []), always_false(), always_true(), versionValue(secondsPlayed), format="SECS", lower_is_better=true, id=84705)
leaderboard("Poop Sweeper - Speedrun", "Win a game of Poop Sweeper in the fastest time", versionTrigger(winPoopSweeper, []), always_false(), always_true(), versionValue(poopSweeperTime), format="SECS", lower_is_better=true, id=84706)
leaderboard("Poop Sweeper - Most Wins", "Win the most games of Poop Sweeper", versionTrigger(winPoopSweeper, []), always_false(), always_true(), versionValue(poopSweeperWins), format="VALUE", lower_is_better=false, id=84707)
leaderboard("Rhythm Game (Woofer) - High Score", "Finish a rhythm game of Woofer with the highest score", versionTrigger(clearRhythmGame, [woofer, wooferDuration]), always_false(), always_true(), versionValue(rhythmGameFinalScore), format="VALUE", lower_is_better=false, id=84708)
leaderboard("Rhythm Game (Tweeter) - High Score", "Finish a rhythm game of Tweeter with the highest score", versionTrigger(clearRhythmGame, [tweeter, tweeterDuration]), always_false(), always_true(), versionValue(rhythmGameFinalScore), format="VALUE", lower_is_better=false, id=84709)
leaderboard("Rhythm Game (Special 1) - High Score", "Finish a rhythm game of Special 1 with the highest score", versionTrigger(clearRhythmGame, [special1, special1Duration]), always_false(), always_true(), versionValue(rhythmGameFinalScore), format="VALUE", lower_is_better=false, id=84710)
leaderboard("Rhythm Game (Special 2) - High Score", "Finish a rhythm game of Special 2 with the highest score", versionTrigger(clearRhythmGame, [special2, special2Duration]), always_false(), always_true(), versionValue(rhythmGameFinalScore), format="VALUE", lower_is_better=false, id=84711)
leaderboard("Lilac Force - High Score", "Finish a game of Lilac Force with the highest score", versionTrigger(endLilacForce, []), always_false(), always_true(), versionValue(lilacForceScore), format="VALUE", lower_is_better=false, id=84712)
leaderboard("Burgerdog - High Score", "Finish a game of Burgerdog with the highest score", versionTrigger(endBurgerdog, [normal]), always_false(), always_true(), versionValue(burgerdogFinalScore), format="VALUE", lower_is_better=false, id=84713)
leaderboard("Burgerdog (Special) - High Score", "Finish a game of Burgerdog (Special) with the highest score", versionTrigger(endBurgerdog, [special]), always_false(), always_true(), versionValue(burgerdogFinalScore), format="VALUE", lower_is_better=false, id=84714)
leaderboard("Slimer Speedrun (Normal)", "Defeat the hidden Slimer on Normal difficulty in the fastest time", versionTrigger(startSlimerBoss, [normal, hyperBeamLocked]), versionTrigger(exitBoss, []), versionTrigger(bossDefeated, [boss1]), always_true(), format="FRAMES", lower_is_better=true, id=85368)
leaderboard("Slimer Speedrun (Easy)", "Defeat the hidden Slimer on Easy difficulty in the fastest time", versionTrigger(startSlimerBoss, [easy, hyperBeamLocked]), versionTrigger(exitBoss, []), versionTrigger(bossDefeated, [boss1]), always_true(), format="FRAMES", lower_is_better=true, id=85369)
leaderboard("Slimer Speedrun (Hyper Beam)", "Defeat the hidden Slimer with the Hyper Beam in the fastest time", versionTrigger(startSlimerBoss, [anyDifficulty, hyperBeamUnlocked]), versionTrigger(exitBoss, []), versionTrigger(bossDefeated, [boss1]), always_true(), format="FRAMES", lower_is_better=true, id=85370)
leaderboard("Mamacuda 1 Speedrun (Normal)", "Defeat Mamacuda in Zandunia on Normal difficulty in the fastest time", versionTrigger(startMamacuda1Boss, [normal, hyperBeamLocked]), versionTrigger(exitBoss, []), versionTrigger(bossDefeated, [boss1]), always_true(), format="FRAMES", lower_is_better=true, id=85371)
leaderboard("Mamacuda 1 Speedrun (Easy)", "Defeat Mamacuda in Zandunia on Easy difficulty in the fastest time", versionTrigger(startMamacuda1Boss, [easy, hyperBeamLocked]), versionTrigger(exitBoss, []), versionTrigger(bossDefeated, [boss1]), always_true(), format="FRAMES", lower_is_better=true, id=85372)
leaderboard("Mamacuda 1 Speedrun (Hyper Beam)", "Defeat Mamacuda in Zandunia with the Hyper Beam in the fastest time", versionTrigger(startMamacuda1Boss, [anyDifficulty, hyperBeamUnlocked]), versionTrigger(exitBoss, []), versionTrigger(bossDefeated, [boss1]), always_true(), format="FRAMES", lower_is_better=true, id=85373)
leaderboard("Planck's Henchmen Speedrun (Normal)", "Defeat Planck's henchmen on Normal difficulty in the fastest time", versionTrigger(startHenchmenBoss, [normal]), versionTrigger(exitBoss, []), versionTrigger(henchmenDefeated, []), always_true(), format="FRAMES", lower_is_better=true, id=85374)
leaderboard("Planck's Henchmen Speedrun (Easy)", "Defeat Planck's henchmen on Easy difficulty in the fastest time", versionTrigger(startHenchmenBoss, [easy]), versionTrigger(exitBoss, []), versionTrigger(henchmenDefeated, []), always_true(), format="FRAMES", lower_is_better=true, id=85375)
leaderboard("Mamacuda 2 Speedrun (Normal)", "Defeat Mamacuda in Totummy Temples on Normal difficulty in the fastest time", versionTrigger(startMamacuda2Boss, [normal, hyperBeamLocked]), versionTrigger(exitBoss, []), versionTrigger(bossDefeated, [boss1]), always_true(), format="FRAMES", lower_is_better=true, id=85376)
leaderboard("Mamacuda 2 Speedrun (Easy)", "Defeat Mamacuda in Totummy Temples on Easy difficulty in the fastest time", versionTrigger(startMamacuda2Boss, [easy, hyperBeamLocked]), versionTrigger(exitBoss, []), versionTrigger(bossDefeated, [boss1]), always_true(), format="FRAMES", lower_is_better=true, id=85377)
leaderboard("Mamacuda 2 Speedrun (Hyper Beam)", "Defeat Mamacuda in Totummy Temples with the Hyper Beam in the fastest time", versionTrigger(startMamacuda2Boss, [anyDifficulty, hyperBeamUnlocked]), versionTrigger(exitBoss, []), versionTrigger(bossDefeated, [boss1]), always_true(), format="FRAMES", lower_is_better=true, id=85378)
leaderboard("Bounty Hunters Speedrun (Normal)", "Defeat the Bounty Hunters on Normal difficulty in the fastest time", versionTrigger(startBountyHuntersBoss, [normal, hyperBeamLocked]), versionTrigger(exitBoss, []), versionTrigger(threeBossesDefeated, []), always_true(), format="FRAMES", lower_is_better=true, id=85379)
leaderboard("Bounty Hunters Speedrun (Easy)", "Defeat the Bounty Hunters on Easy difficulty in the fastest time", versionTrigger(startBountyHuntersBoss, [easy, hyperBeamLocked]), versionTrigger(exitBoss, []), versionTrigger(threeBossesDefeated, []), always_true(), format="FRAMES", lower_is_better=true, id=85380)
leaderboard("Bounty Hunters Speedrun (Hyper Beam)", "Defeat the Bounty Hunters with the Hyper Beam in the fastest time", versionTrigger(startBountyHuntersBoss, [anyDifficulty, hyperBeamUnlocked]), versionTrigger(exitBoss, []), versionTrigger(threeBossesDefeated, []), always_true(), format="FRAMES", lower_is_better=true, id=85381)
leaderboard("The Council Speedrun (Normal)", "Destroy The Council on Normal difficulty in the fastest time", versionTrigger(startCouncilBoss, [normal, hyperBeamLocked]), versionTrigger(exitBoss, []), versionTrigger(threeBossesDefeated, []), always_true(), format="FRAMES", lower_is_better=true, id=85382)
leaderboard("The Council Speedrun (Easy)", "Destroy The Council on Easy difficulty in the fastest time", versionTrigger(startCouncilBoss, [easy, hyperBeamLocked]), versionTrigger(exitBoss, []), versionTrigger(threeBossesDefeated, []), always_true(), format="FRAMES", lower_is_better=true, id=85383)
leaderboard("The Council Speedrun (Hyper Beam)", "Destroy The Council with the Hyper Beam in the fastest time", versionTrigger(startCouncilBoss, [anyDifficulty, hyperBeamUnlocked]), versionTrigger(exitBoss, []), versionTrigger(threeBossesDefeated, []), always_true(), format="FRAMES", lower_is_better=true, id=85384)