// Super Mario Sunshine [Subset - Hoverless]
// #ID = 28560
// Author: timenoe
// Date Published: 2024-02-11

//// Common

iterations = ["first", "second", "third"]

function nextBit(addr)
{
	if (addr[0] == 7) return [0, addr[1] + 1]
	else return [addr[0] + 1, addr[1]]
}

bitflagBaseAddr = 0x578940
ptrMask = 0x7fffffff

function regionBit(addr) => bit(addr[0], bitflagPtr() + addr[1] - bitflagBaseAddr)
function countRegionBits(addr, count)
{
	sum = 0
	for bit in range(1, count)
	{
		sum = sum + regionBit(addr)
		addr = nextBit(addr)
	}
	return sum
}
function regionBitflip(addr) => regionBit(addr) > prev(regionBit(addr))
function regionDword(addr) => dword_be(bitflagPtr() + addr - bitflagBaseAddr)

//// Constants

// IDs

courseIDs = 
{
	"Delfino Airstrip": 0,
	"Delfino Plaza": 1,
	"Bianco Hills": 2,
	"Ricco Harbor": 3,
	"Gelato Beach": 4,
	"Pinna Park - Beach": 5,
	"Sirena Beach - Beach": 6,
	"Sirena Beach - Hotel": 7,
	"Pianta Village": 8,
	"Noki Bay": 9,
	"Test Course": 0xc,
	"Pinna Park - Park": 0xd,
	"Sirena Beach - Casino": 0xe,
	"Title Screen/Credits": 0x0f, 
	"Noki Bay - The Red Coin Fish": 0x10, 
	"Delfino Plaza - Delfino Airstrip": 0x14, 
	"Delfino Plaza - Super Slide": 0x15, 
	"Delfino Plaza - Pachinko Game": 0x16,
	"Delfino Plaza - Red Coin Field": 0x17, 
	"Delfino Plaza - Lily Pad Ride": 0x18, 
	"Delfino Plaza - Turbo Track": 0x1d, 
	"Ricco Harbor - Blooper Surfing Safari": 0x1e, 
	"Noki Bay - The Shell's Secret": 0x1f, 
	"Gelato Beach - Dune Bud Sand Castle Secret": 0x20, 
	"Gelato Beach - The Sand Bird is Born": 0x21, 
	"Sirena Beach - The Secret of Casino Delfino": 0x28, 
	"Pinna Park - The Yoshi-Go-Round's Secret": 0x29, 
	"Pianta Village - Secret of the Village Underside": 0x2a, 
	"Noki Bay - Red Coins in a Bottle": 0x2c, 
	"Bianco Hills - The Secret of the Dirty Lake": 0x2e, 
	"Bianco Hills - The Hillside Cave Secret": 0x2f, 
	"Ricco Harbor - The Secret of Ricco Tower": 0x30, 
	"Pinna Park - The Beach Cannon's Secret": 0x32, 
	"Sirena Beach - The Hotel Lobby's Secret": 0x33, 
	"Corona Mountain": 0x34, 
	"Bianco Hills - Down with Petey Piranha!": 0x37, 
	"Sirena Beach - King Boo Down Below": 0x38, 
	"Noki Bay - Eely-Mouth's Dentist": 0x39, 
	"Pinna Park - Roller Coaster": 0x3a, 
	"Ricco Harbor - Gooper Blooper Breaks Out": 0x3b, 
	"Corona Mountain - Father and Son Shine!": 0x3c
}
courseStateIDs = 
{
	"dolpic0": 0,
	"dolpic1": 1,
	"dolpic10": 2,
	"dolpic5": 5,
	"dolpic6": 6,
	"dolpic7": 7,
	"dolpic8": 8,
	"dolpic9": 9,
	"Episode 1": 0,
	"Episode 2": 1,
	"Episode 3": 2,
	"Episode 4": 3,
	"Episode 5": 4,
	"Episode 6": 5,
	"Episode 7": 6,
	"Episode 8": 7,
}
gameStateIDs = 
{
	"Loading": 0,
	"Cutscene": 0x78
}

// Titles

mainCourseNames = ["Bianco Hills", "Ricco Harbor", "Gelato Beach", "Pinna Park", "Sirena Beach", "Noki Bay", "Pianta Village"]
mainCourseEpisodeShinesTitle = 
{
	"Bianco Hills": "[Hoverless] Country Livin'",
	"Ricco Harbor": "[Hoverless] Work-Life Balance",
	"Gelato Beach": "[Hoverless] Beach Bum",
	"Pinna Park": "[Hoverless] Childhood Dream",
	"Sirena Beach": "[Hoverless] All-Exclusive Stay",
	"Noki Bay": "[Hoverless] Out of This World",
	"Pianta Village": "[Hoverless] Honorary Pianta"
}
mainCourseSecretShinesTitle = 
{
	"Bianco Hills": "[Hoverless] Cave Story",
	"Ricco Harbor": "[Hoverless] Pure-Bred Blooper",
	"Gelato Beach": "[Hoverless] Magic Castle",
	"Pinna Park": "[Hoverless] Ring Around the Rosie",
	"Sirena Beach": "[Hoverless] Welcome to the Hotel Delfino",
	"Noki Bay": "[Hoverless] Sea Shells by the Sea Shore",
	"Pianta Village": "[Hoverless] King of the Underground"
}
mainCourseCoinShineTitle = 
{
	"Bianco Hills": "[Hoverless] Bianco Bullion",
	"Ricco Harbor": "[Hoverless] Rare Catch",
	"Gelato Beach": "[Hoverless] Metal Detector Mario",
	"Pinna Park": "[Hoverless] Lost and Found",
	"Sirena Beach": "[Hoverless] Tip the Staff",
	"Noki Bay": "[Hoverless] Ancient Artifacts",
	"Pianta Village": "[Hoverless] Toadstool Tour"
}
mainCourseblueCoinsTitle = 
{
	"Bianco Hills": "[Hoverless] High and Low",
	"Ricco Harbor": "[Hoverless] Klamber Chaos",
	"Gelato Beach": "[Hoverless] Wakey, Wakey, Cataquack",
	"Pinna Park": "[Hoverless] Break the Targets",
	"Sirena Beach": "[Hoverless] Waterlogged Furniture",
	"Noki Bay": "[Hoverless] Rule 1: Check Waterfalls",
	"Pianta Village": "[Hoverless] Blue Moon"
}

timedRedCoinCourseNames = ["Bianco Hills - The Hillside Cave Secret", "Bianco Hills - The Secret of the Dirty Lake",
						   "Ricco Harbor - The Secret of Ricco Tower",
						   "Gelato Beach - Dune Bud Sand Castle Secret",
						   "Pinna Park - The Beach Cannon's Secret", "Pinna Park - The Yoshi-Go-Round's Secret",
						   "Sirena Beach - Hotel", "Sirena Beach - The Hotel Lobby's Secret", "Sirena Beach - The Secret of Casino Delfino",
						   "Noki Bay - The Shell's Secret",
						   "Pianta Village - Secret of the Village Underside",
						   "Delfino Plaza - Delfino Airstrip"]

timedRedCoinCourseTitles = 
{
	"Bianco Hills - The Hillside Cave Secret": "Red Coins of the Hillside Cave",
	"Bianco Hills - The Secret of the Dirty Lake": "Red Coins of the Dirty Lake",
	"Ricco Harbor - The Secret of Ricco Tower": "Red Coins in Ricco Tower",
	"Gelato Beach - Dune Bud Sand Castle Secret": "Red Coins in the Sand Castle",
	"Pinna Park - The Beach Cannon's Secret": "Red Coins in the Cannon",
	"Pinna Park - The Yoshi-Go-Round's Secret": "Red Coins in the Yoshi-Go-Round",
	"Sirena Beach - Hotel": "Red Coins in the Hotel",
	"Sirena Beach - The Hotel Lobby's Secret": "Red Coins in Boo's Big Mouth",
	"Sirena Beach - The Secret of Casino Delfino": "Red Coin Winnings in the Casino",
	"Noki Bay - The Shell's Secret": "Red Coins on the Half Shell",
	"Pianta Village - Secret of the Village Underside": "Red Coin Chucksters",
	"Delfino Plaza - Delfino Airstrip": "Red Coin Waterworks"
}

raceCourseNames = ["Gelato Beach", "Noki Bay", "Pianta Village"]
raceCourseEpisodes = 
{
	"Gelato Beach": "Episode 5",
	"Noki Bay": "Episode 5",
	"Pianta Village": "Episode 2"
}
raceCourseTitles = 
{
	"Gelato Beach": "Il Piantissimo's Sand Sprint",
	"Noki Bay": "Il Piantissimo's Surf Swim",
	"Pianta Village": "Il Piantissimo's Crazy Climb" 
}

//// Functions

// Pointers
function bitflagPtr() => dword_be(regionPtr() + 0x34) & ptrMask
function gamePtr() => dword_be(regionPtr() + 4) & ptrMask
function hudPtr() => dword_be(gamePtr() + 0x74) & ptrMask
function regionPtr() => dword_be(0x5518) & ptrMask
function scriptPtr() => dword_be(gamePtr() + 0x80) & ptrMask

// Addresses
function course() => byte(regionPtr() + 0xe)
function courseState() => byte(regionPtr() + 0xf)
function gameState() => byte(gamePtr() + 0x64)
function piantasRescued() => regionDword(0x578a84)
function redCoins() => regionDword(0x578a7c)
function shines() => regionDword(0x578a58)
function timer() => dword_be(hudPtr() + 0x500)

// General
function inCourse(courseName) => course() == courseIDs[courseName]
function inCourseState(courseStateName) => courseState() == courseStateIDs[courseStateName]
function inGameState(gameStateName) => gameState() == gameStateIDs[gameStateName]
function inGame() => course() != courseIDs["Title Screen/Credits"] && !inGameState("Loading")
function inEnding() => inCourse("Title Screen/Credits") && inGameState("Cutscene")

function allPiantasRescued() => piantasRescued() == 10
function allRedCoins() => prev(redCoins()) == 7 && redCoins() == 8
function boxingClever(level) => countRegionBits([6, 0x578993], 2) == level
function reachRaceFlag() => regionBit([5, 0x578a6c]) > prev(regionBit([5, 0x578a6c]))
function timerWasActive() => prev(byte(hudPtr() + 0x4a)) == 1

// Scripts

function endBeachCleaning() => word_be(scriptPtr() + 0x372) == 0x2cd
function finishBlooperRace() => word_be(scriptPtr() + 0x372) == 0x46e
function winBoxingClever()
{
	return __ornext(inCourseState("dolpic10") || inCourseState("dolpic6") || inCourseState("dolpic7")) && word_be(scriptPtr() + 0xf2e) == 0x32f || 
					inCourseState("dolpic8") && word_be(scriptPtr() + 0x124a) == 0x32f || 
					inCourseState("dolpic5") && word_be(scriptPtr() + 0x1566) == 0x32f
}
function winMonteRace(courseName)
{
	if (courseName == "Gelato Beach" || courseName == "Noki Bay") return word_be(scriptPtr() + 0x68e) == 0x27d && reachRaceFlag()
	else if (course == courseIDs["Pianta Village"]) return word_be(scriptPtr() + 0x372) == 0x279 && reachRaceFlag()
}

//// Achievements

// Progression

allEpisode7s = 0
shineAddr = [0, 0x578988]
for mainCourse in mainCourseNames
{
	for episode in range(1, 10)
	{
		if (episode == 7) allEpisode7s = allEpisode7s + regionBit(shineAddr)
		shineAddr = nextBit(shineAddr)
	}
}
achievement("[Hoverless] Delfino Airstrip Dilemma", "Collect the first Shine Sprite in Delfino Airstrip", 1, inGame() && regionBitflip([6, 0x578992]))
achievement("[Hoverless] New Challenger Approaching", "Defeat the Polluted Piranha covering the Grand Pianta Statue in Delfino Plaza", 2, inGame() && regionBitflip([4, 0x5789f8]))
achievement("[Hoverless] Boathouse Blues", "Collect 3 Shine Sprites", 3, inGame() && prev(shines()) < 3 && shines() >= 3)
achievement("[Hoverless] Shiny Landmark", "Collect 5 Shine Sprites", 5, inGame() && prev(shines()) < 5 && shines() >= 5)
achievement("[Hoverless] Kidnapped...Again?!", "Collect 10 Shine Sprites", 5, inGame() && prev(shines()) < 10 && shines() >= 10)
achievement("[Hoverless] Look into the Light", "Collect 20 Shine Sprites", 10, inGame() && prev(shines()) < 20 && shines() >= 20)
achievement("[Hoverless] Retro Reunion", "Befriend Yoshi in Delfino Plaza", 5, inGame() && regionBitflip([7, 0x5789f9]))
achievement("[Hoverless] Time to Speed Things Up", "Obtain the Turbo Nozzle in Delfino Plaza", 10, inGame() && regionBitflip([7, 0x5789f4]))
achievement("[Hoverless] First Jump Man, Now Rocket Man", "Obtain the Rocket Nozzle in Delfino Plaza", 10, inGame() && regionBitflip([6, 0x5789f4]))
achievement("[Hoverless] Shadow Tsunami", "Complete Episode 7 in all 7 main courses", 10, inGame() && prev(allEpisode7s) == 6 && measured(allEpisode7s == 7))
achievement("[Hoverless] Bonding Time", "Collect the final Shine Sprite in Corona Mountain", 25, inEnding() && regionBitflip([7, 0x578996]))

// Collection

mainCourseEpisodeShinesAddr = [0, 0x578988]
mainCourseSecretShinesAddr = [0, 0x578989]
mainCourseCoinShineAddr = [4, 0x578994]
mainCourseBlueCoinsAddr = [2, 0x57899d]
mainCourseBlueCoins = 0
for mainCourseName in mainCourseNames
{
	achievement(mainCourseEpisodeShinesTitle[mainCourseName], "Complete all 8 episodes in " + mainCourseName, 25, inGame() && prev(countRegionBits(mainCourseEpisodeShinesAddr, 8)) == 7 && measured(countRegionBits(mainCourseEpisodeShinesAddr, 8) == 8))
	for i in range(1, 10) mainCourseEpisodeShinesAddr = nextBit(mainCourseEpisodeShinesAddr)

	achievement(mainCourseSecretShinesTitle[mainCourseName], "Collect both secret Shine Sprites in " + mainCourseName, 10, inGame() && prev(countRegionBits(mainCourseSecretShinesAddr, 2)) == 1 && measured(countRegionBits(mainCourseSecretShinesAddr, 2) == 2))
	for i in range(1, 10) mainCourseSecretShinesAddr = nextBit(mainCourseSecretShinesAddr)

	achievement(mainCourseCoinShineTitle[mainCourseName], "Gather 100 Yellow Coins and collect the Shine Sprite in " + mainCourseName, 5, inGame() && regionBitflip(mainCourseCoinShineAddr))
	mainCourseCoinShineAddr = nextBit(mainCourseCoinShineAddr)
	
	blueCoins = countRegionBits(mainCourseBlueCoinsAddr, 30)
	mainCourseBlueCoins = mainCourseBlueCoins + blueCoins
	achievement(mainCourseblueCoinsTitle[mainCourseName], "Collect all 30 Blue Coins in " + mainCourseName, 25, inGame() && prev(blueCoins) == 29 && measured(blueCoins == 30))
	for i in range(1, 50) mainCourseBlueCoinsAddr = nextBit(mainCourseBlueCoinsAddr)
}

plazaShineAddrs = [[5, 0x578993], [6, 0x578993], [7, 0x578993], [0, 0x578994], [1, 0x578994], [2, 0x578994], [3, 0x578994], [4, 0x578996], [5, 0x578996], [6, 0x578996]]
plazaShines = 0
for plazaShineAddr in plazaShineAddrs plazaShines = plazaShines + regionBit(plazaShineAddr)
achievement("[Hoverless] Janitor of the Year", "Collect all 10 Shine Sprites within Delfino Plaza", 25, inGame() && prev(plazaShines) == 9 && measured(plazaShines == 10))
achievement("[Hoverless] Slip and Slide", "Collect the Shine Sprite in Super Slide", 3, inGame() && regionBitflip([2, 0x578993]))
achievement("[Hoverless] Nothing But Pain", "Collect the Shine Sprite in Pachinko Game", 10, inGame() && regionBitflip([1, 0x578993]))
achievement("[Hoverless] Thank You Lilly", "Collect the Shine Sprite in Lily Pad Ride", 5, inGame() && regionBitflip([3, 0x578993]))
achievement("[Hoverless] F-Zero Sunshine", "Collect the Shine Sprite in Turbo Track", 3, inGame() && regionBitflip([7, 0x578992]))
achievement("[Hoverless] Scavenger Hunt", "Collect the Shine Sprite in Red Coin Field", 3, inGame() && regionBitflip([4, 0x578993]))

tradeShineBaseAddrs = [[6, 0x578990], [4, 0x578995]]
tradeShineCount = [16, 8]
tradedBlueCoins = 0
for bitBlock in range(0, length(tradeShineBaseAddrs) - 1)
{
	tradeShineAddr = tradeShineBaseAddrs[bitBlock]
	for trade in range(1, tradeShineCount[bitBlock])
	{
		tradedBlueCoins = tradedBlueCoins + regionBit(tradeShineAddr) * 10
		tradeShineAddr = nextBit(tradeShineAddr)
	}
}
delfinoPlazaBlueCoins = countRegionBits([1, 0x578997], 19)
coronaMountainBlueCoins = countRegionBits([4, 0x5789cb], 10)
allBlueCoins = mainCourseBlueCoins + delfinoPlazaBlueCoins + coronaMountainBlueCoins + regionBit([0, 0x578997])
achievement("[Hoverless] Inequivalent Exchange", "Trade all 240 Blue Coins for 24 Shine Sprites in the boathouse of Delfino Plaza", 25, inGame() && prev(tradedBlueCoins) < 240 && measured(tradedBlueCoins == 240))
achievement("[Hoverless] Easy Way or the Hard Way", "Gather 100 Yellow Coins and collect the Shine Sprite in Delfino Plaza, Red Coin Field, or Delfino Airstrip", 5, inGame() && regionBitflip([3, 0x578995]))
achievement("[Hoverless] Surf and Turf", "Collect all 19 Blue Coins in Delfino Plaza", 25, inGame() && prev(delfinoPlazaBlueCoins) == 18 && measured(delfinoPlazaBlueCoins == 19))
achievement("[Hoverless] Get Rich or Die Trying", "Collect all 10 Blue Coins in Corona Mountain", 25, inGame() && prev(coronaMountainBlueCoins) == 9 && measured(coronaMountainBlueCoins == 10))
achievement("[Hoverless] Red Coin Waterworks", "Collect the Shine Sprite in Delfino Airstrip after visiting Corona Mountain", 3, inGame() && regionBitflip([0, 0x578993]))
achievement("[Hoverless] Melty Block", "Collect the Blue Coin in Delfino Airstrip after visiting Corona Mountain", 2, inGame() && regionBitflip([0, 0x578997]))
achievement("[Hoverless] Shine On!", "Collect all 120 Shine Sprites", 50, (inGame() || inEnding()) && prev(shines()) < 120 && measured(shines() == 120))
achievement("[Hoverless] Tanuki Time", "Collect all 240 Blue Coins", 50, inGame() && prev(allBlueCoins) == 239 && measured(allBlueCoins == 240))

//// Leaderboards

// Countdown

for level in range(0, 2) leaderboard("[Hoverless] Boxing Clever " + level + 1 + " Speedrun", "Break all the crates in the " + iterations[level] + " formation as fast as possible in Delfino Plaza", inCourse("Delfino Plaza") && boxingClever(level) && timerWasActive() && winBoxingClever(), always_false(), always_true(), timer(), format="MILLISECS", lower_is_better=false)
for timedRedCoinCourseName in timedRedCoinCourseNames leaderboard("[Hoverless] " + timedRedCoinCourseTitles[timedRedCoinCourseName] + " Speedrun", "Collect all 8 red coins as fast as possible in " + timedRedCoinCourseTitles[timedRedCoinCourseName], inCourse(timedRedCoinCourseName) && timerWasActive() && allRedCoins(), always_false(), always_true(), timer(), format="MILLISECS", lower_is_better=false)
leaderboard("[Hoverless] Scrubbing Sirena Beach Speedrun", "Scrub Sirena Beach clean as fast as possible in Episode 6 of Sirena Beach", inCourse("Sirena Beach - Beach") && inCourseState("Episode 6") && timerWasActive() && timer() > 0 && endBeachCleaning(), always_false(), always_true(), timer(), format="MILLISECS", lower_is_better=false)
leaderboard("[Hoverless] Piantas in Need Speedrun", "Rescue all 10 Piantas as fast as possible in Episode 6 of Pianta Village", inCourse("Pianta Village") && inCourseState("Episode 6") && timerWasActive() && allPiantasRescued(), always_false(), always_true(), timer(), format="MILLISECS", lower_is_better=false)

// Race

leaderboard("[Hoverless] Blooper Surfing Safari Speedrun", "Cross the finish line as fast as possible in Blooper Surfing Safari", inCourse("Ricco Harbor - Blooper Surfing Safari") && timerWasActive() && finishBlooperRace(), always_false(), always_true(), timer(), format="MILLISECS", lower_is_better=true)
for raceCourseName in raceCourseNames leaderboard("[Hoverless] " + raceCourseTitles[raceCourseName] + " Speedrun", "Reach the flag as fast as possible during the race against Il Piantissimo in " + raceCourseEpisodes[raceCourseName] + " of " + raceCourseName, inCourse(raceCourseName) && inCourseState(raceCourseEpisodes[raceCourseName]) && timerWasActive() && reachRaceFlag(), always_false(), always_true(), timer(), format="MILLISECS", lower_is_better=true)